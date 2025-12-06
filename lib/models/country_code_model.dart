class CountryCodeModel {
  final String country;

  CountryCodeModel({
    required this.country,
  });

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) => CountryCodeModel(
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}