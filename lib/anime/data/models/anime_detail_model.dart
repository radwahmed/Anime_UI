class AnimeDetailModel {
  final String title;
  final String imageUrl;
  final List<String> genres;
  final String views;
  final String claps;
  final String seasons;
  final String description;

  const AnimeDetailModel({
    required this.title,
    required this.imageUrl,
    required this.genres,
    required this.views,
    required this.claps,
    required this.seasons,
    required this.description,
  });
}
