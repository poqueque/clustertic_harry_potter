import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width * .8;

    return Scaffold(
      appBar: AppBar(
        title: Text("${character.name} Details"),
      ),
      body: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 5; i++)
                    (character.stars >= i)
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_border_outlined),
                ],
              ),
              Text("${character.reviews} reviews"),
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
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Fuerza"),
                  Text("${character.strenght}"),
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
    );
  }
}
