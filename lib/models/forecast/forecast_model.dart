// To parse this JSON data, do
//
//     final forecastModel = forecastModelFromJson(jsonString);

import 'dart:convert';

import 'package:weathertest/models/forecast/daily_forecast_model.dart';

ForecastModel forecastModelFromJson(String str) => ForecastModel.fromJson(json.decode(str));

String forecastModelToJson(ForecastModel data) => json.encode(data.toJson());

class ForecastModel {
    final List<DailyForecast> dailyForecasts;

    ForecastModel({
        required this.dailyForecasts,
    });

    factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        dailyForecasts: List<DailyForecast>.from(json["DailyForecasts"].map((x) => DailyForecast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "DailyForecasts": List<dynamic>.from(dailyForecasts.map((x) => x.toJson())),
    };
}