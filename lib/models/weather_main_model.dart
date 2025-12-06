import 'dart:convert';

WeatherMainModel weatherMainModelFromJson(String str) =>
    WeatherMainModel.fromJson(json.decode(str));

String weatherMainModelToJson(WeatherMainModel data) =>
    json.encode(data.toJson());

class WeatherMainModel {
  final String main;
  final String description;

  WeatherMainModel({
    required this.main,
    required this.description,
  });

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) =>
      WeatherMainModel(
        main: json["main"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "description": description,
      };
}
