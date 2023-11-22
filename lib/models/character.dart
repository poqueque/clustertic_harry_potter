class Character {
  final int id;
  final String name;
  final String url;
  double totalStars;
  int reviews;
  final int strength;
  final int magic;
  final int speed;
  bool favorite = false;
  double get stars => (reviews == 0) ? 0 : totalStars / reviews;

  Character({
    required this.id,
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
