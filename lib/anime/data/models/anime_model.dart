class AnimeModel {
  final String title;
  final String imageUrl;
  final double rating;
  final String type;
  final bool isNew;

  const AnimeModel({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.type,
    this.isNew = false,
  });
}
