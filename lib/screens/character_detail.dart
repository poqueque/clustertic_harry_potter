import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/data/hogwarts_data.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../models/character.dart';
import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id, this.showAppBar = true});

  final int id;
  final bool showAppBar;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  double lastValueClicked = 0;
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * .8;
    final l = AppLocalizations.of(context)!;

    return Consumer<HogwartsData>(builder: (context, data, child) {
      Character character = data.getCharFromId(widget.id);
      return Scaffold(
        appBar: widget.showAppBar
            ? AppBar(
                title: Text(l.characterDetails(character.name)),
              )
            : null,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: character.name,
                child: Image.network(
                  character.url,
                  width: imageWidth,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(value: character.stars),
                  Text(l.nReviews(character.reviews)),
                ],
              ),
              Text(
                character.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(
                    value: lastValueClicked,
                    color: AppStyles.trueBlue,
                    onRating: (value) {
                      setState(() {
                        lastValueClicked = value.toDouble();
                        data.addReview(widget.id, value);
                      });
                    },
                  ),
                  InkWell(
                    onTap: () => data.toggleFavorite(widget.id),
                    child: (character.favorite)
                        ? Lottie.asset(
                            Assets.anim.heart,
                            height: 48,
                            width: 48,
                            repeat: false,
                          )
                        : const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.favorite_border,
                              color: AppStyles.trueBlue,
                            ),
                          ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.fitness_center),
                      const Text("Fuerza"),
                      Text("${character.strength}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.auto_fix_normal),
                      const Text("Magia"),
                      Text("${character.magic}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.speed),
                      const Text("Velocidad"),
                      Text("${character.speed}"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
