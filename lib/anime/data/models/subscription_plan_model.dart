class SubscriptionPlanModel {
  final String title;
  final String price;
  final String duration;
  final String description;
  final List<String> features;

  const SubscriptionPlanModel({
    required this.title,
    required this.price,
    required this.duration,
    required this.description,
    required this.features,
  });
}
