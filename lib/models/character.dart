class Character {
  final String name;
  final String url;
  double totalStars;
  int reviews;
  final int strength;
  final int magic;
  final int speed;
  double get stars => totalStars / reviews;

  Character({
    required this.name,
    required this.url,
    required this.totalStars,
    required this.reviews,
    required this.strength,
    required this.magic,
    required this.speed,
  });

  void addReview(int value) {
    reviews++;
    totalStars += value;
  }
}
