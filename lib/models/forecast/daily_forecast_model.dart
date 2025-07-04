import 'package:weathertest/models/forecast/forecast_temp_model.dart';

class DailyForecast {
  final ForecastTempModel temperature;

  DailyForecast({
    required this.temperature,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        temperature: ForecastTempModel.fromJson(json["Temperature"]),
      );

  Map<String, dynamic> toJson() => {
        "Temperature": temperature.toJson(),
      };
}
