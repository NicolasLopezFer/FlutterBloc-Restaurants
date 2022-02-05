//TODO: REVISAR

class City {
  final String name;
  final String email;

  City({
    required this.name,
    required this.email,
  });

  City copyWith({
    String? name,
    String? email,
  }) =>
      City(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
