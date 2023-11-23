import 'package:flutter/widgets.dart';
import 'package:harry_potter/services/database.dart';

import '../models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [];

  HogwartsData() {
    init();
  }

  init() async {
    characters = await Database.instance.getAllCharacters();
    if (characters.isEmpty) {
      for (var character in charactersInitial) {
        await Database.instance.updateCharacter(character);
        characters.add(character);
      }
    }
    notifyListeners();
  }

  List<Character> charactersInitial = [
    Character(
        id: 1,
        name: "Harry Potter",
        url:
            "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg",
        totalStars: 0,
        reviews: 0,
        strength: 8,
        magic: 9,
        speed: 7),
    Character(
        id: 2,
        name: "Hermione Granger",
        url:
            "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es",
        totalStars: 0,
        reviews: 0,
        strength: 7,
        magic: 10,
        speed: 10),
    Character(
        id: 3,
        name: "Ron Weasley",
        url:
            "https://static.wikia.nocookie.net/warnerbros/images/a/af/Rony.jpg/revision/latest?cb=20120402152702&path-prefix=es",
        totalStars: 0,
        reviews: 0,
        strength: 7,
        magic: 8,
        speed: 6),
  ];

  void addReview(int id, int rating) {
    var character = getCharFromId(id);
    character.addReview(rating);
    Database.instance.updateCharacter(character);
    notifyListeners();
  }

  void toggleFavorite(int id) {
    var character = getCharFromId(id);
    character.favorite = !getCharFromId(id).favorite;
    Database.instance.updateCharacter(character);
    notifyListeners();
  }

  Character getCharFromId(int id) =>
      characters.firstWhere((element) => element.id == id);
}
