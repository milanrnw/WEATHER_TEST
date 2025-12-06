import 'package:myweatherapp/models/forecast_temp_model.dart';
import 'package:myweatherapp/models/weatherMainModel.dart';
import 'package:myweatherapp/models/wind_model.dart';

class ForecastMaindataModel {
  final ForecastTempModel main;
  final WindModel wind;
  final String dt_txt;
  final List<WeatherMainModel> weather;

  ForecastMaindataModel({
    required this.main,
    required this.wind,
    required this.dt_txt,
    required this.weather,
  });

  factory ForecastMaindataModel.fromJson(Map<String, dynamic> json) =>
      ForecastMaindataModel(
        main: ForecastTempModel.fromJson(json["main"]),
        wind: WindModel.fromJson(json["wind"]),
        dt_txt: json["dt_txt"] ?? "",
        weather: json["weather"] == null
            ? []
            : List<WeatherMainModel>.from(
                json["weather"].map((x) => WeatherMainModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "main": main.toJson(),
        "wind": wind.toJson(),
        "dt_txt": dt_txt,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}
