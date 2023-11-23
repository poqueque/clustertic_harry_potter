import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

import '../data/hogwarts_data.dart';
import '../data/preferences.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Hogwarts"),
          actions: [
            Consumer<Preferences>(builder: (context, preferences, child) {
              return Switch(
                value: preferences.showSubtitles,
                onChanged: (value) {
                  preferences.setShowSubtitles(value);
                },
              );
            }),
          ],
        ),
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
                          color: Colors.blue,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterDetail(
                                        id: character.id,
                                      )));
                        },
                      );
                    },
                  ),
                )
            ],
          );
        }));
  }
}
