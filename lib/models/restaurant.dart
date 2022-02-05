class Restaurant {
  final String restaurantName;
  final double lat;
  final double lon;

  Restaurant({
    required this.restaurantName,
    required this.lat,
    required this.lon,
  });

  Restaurant copyWith({
    String? restaurantName,
    double? lat,
    double? lon,
  }) =>
      Restaurant(
        restaurantName: restaurantName ?? this.restaurantName,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );
}
