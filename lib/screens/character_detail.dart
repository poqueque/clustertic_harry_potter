import 'package:flutter/material.dart';

import '../models/character.dart';
import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  double lastValueClicked = 0;
  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width * .8;

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.character.name} Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: widget.character.name,
            child: Image.network(
              widget.character.url,
              width: imageWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating(value: widget.character.stars),
              Text("${widget.character.reviews} reviews"),
            ],
          ),
          Text(
            widget.character.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Rating(
            value: lastValueClicked,
            color: Colors.blue,
            onRating: (value) {
              setState(() {
                lastValueClicked = value.toDouble();
                widget.character.addReview(value);
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Fuerza"),
                  Text("${widget.character.strength}"),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.auto_fix_normal),
                  const Text("Magia"),
                  Text("${widget.character.magic}"),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.speed),
                  const Text("Velocidad"),
                  Text("${widget.character.speed}"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
