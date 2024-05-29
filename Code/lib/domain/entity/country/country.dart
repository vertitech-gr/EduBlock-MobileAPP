class Country {
  String country;
  String abbreviation;

  Country({required this.country, required this.abbreviation});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      abbreviation: json['abbreviation'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'country': country,
    'abbreviation': abbreviation,
  };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Country &&
        other.country == country &&
        other.abbreviation == abbreviation;
  }

  @override
  int get hashCode => country.hashCode ^ abbreviation.hashCode;
}
