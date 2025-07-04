import 'package:weathertest/models/forecast/temp_values_model.dart';

class ForecastTempModel {
  final TempValuesModel minimum;
  final TempValuesModel maximum;

  ForecastTempModel({
    required this.minimum,
    required this.maximum,
  });

  factory ForecastTempModel.fromJson(Map<String, dynamic> json) => ForecastTempModel(
        minimum: TempValuesModel.fromJson(json["Minimum"]),
        maximum: TempValuesModel.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum.toJson(),
        "Maximum": maximum.toJson(),
      };
}