import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:provider/provider.dart';

import '../data/hogwarts_data.dart';
import '../data/preferences.dart';
import '../widgets/hogwarts_app_bar.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, this.showAppBar = true, this.onTapped});

  final bool showAppBar;
  final Function(int)? onTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (showAppBar) ? const HogwartsAppBar() : null,
        body: Consumer<HogwartsData>(builder: (
          context,
          data,
          child,
        ) {
          return ListView(
            children: [
              for (var character in data.characters)
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Consumer<Preferences>(
                    builder: (
                      context,
                      preferences,
                      child,
                    ) {
                      return ListTile(
                        leading: Hero(
                          tag: character.name,
                          child: Image.network(character.url),
                        ),
                        title: Text(character.name),
                        subtitle: preferences.showSubtitles
                            ? Text(
                                "${character.stars.toStringAsFixed(1)} "
                                "- ${character.reviews} reviews",
                              )
                            : null,
                        trailing: Icon(
                          (character.favorite)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppStyles.trueBlue,
                        ),
                        onTap: () {
                          if (onTapped == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterDetail(
                                          id: character.id,
                                        )));
                          } else {
                            onTapped!(character.id);
                          }
                        },
                      );
                    },
                  ),
                ),
              const SizedBox(height: 48),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                onDateChanged: (value) {},
              ),
            ],
          );
        }));
  }
}
