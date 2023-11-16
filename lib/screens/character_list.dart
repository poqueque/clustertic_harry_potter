import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';

import '../models/character.dart';

List<Character> characters = [
  Character(
      name: "Harry Potter",
      url:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg",
      totalStars: 0,
      reviews: 0,
      strength: 8,
      magic: 9,
      speed: 7),
  Character(
      name: "Hermione Granger",
      url:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es",
      totalStars: 0,
      reviews: 0,
      strength: 7,
      magic: 10,
      speed: 10),
  Character(
      name: "Ron Weasley",
      url:
          "https://static.wikia.nocookie.net/warnerbros/images/a/af/Rony.jpg/revision/latest?cb=20120402152702&path-prefix=es",
      totalStars: 0,
      reviews: 0,
      strength: 7,
      magic: 8,
      speed: 6),
];

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Hogwarts"),
        ),
        body: ListView(
          children: [
            for (var character in characters)
              Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  leading: Hero(
                    tag: character.name,
                    child: Image.network(character.url),
                  ),
                  title: Text(character.name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CharacterDetail(
                                  character: character,
                                )));
                  },
                ),
              )
          ],
        ));
  }
}
