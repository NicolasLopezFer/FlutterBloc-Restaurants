class City {
  final String cityName;
  final String lat;
  final String lon;

  City({
    required this.cityName,
    required this.lat,
    required this.lon,
  });

  City copyWith({
    String? cityName,
    String? lat,
    String? lon,
  }) =>
      City(
        cityName: cityName ?? this.cityName,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );
}
