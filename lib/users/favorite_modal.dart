class Favorite {
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  bool isFavorite;
  final String categoryId;
  final String description;

  Favorite({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.categoryId,
    required this.description,
  });
}
