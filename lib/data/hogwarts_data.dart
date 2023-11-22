import 'package:flutter/widgets.dart';

import '../models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [
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
    getCharFromId(id).addReview(rating);
    notifyListeners();
  }

  void toggleFavorite(int id) {
    getCharFromId(id).favorite = !getCharFromId(id).favorite;
    notifyListeners();
  }

  Character getCharFromId(int id) =>
      characters.firstWhere((element) => element.id == id);
}
