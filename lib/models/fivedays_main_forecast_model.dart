// To parse this JSON data, do
//
//     final FiveDaysMainForecastModel = FiveDaysMainForecastModelFromJson(jsonString);

import 'dart:convert';

import 'package:myweatherapp/models/forecast_maindata_model.dart';

FiveDaysMainForecastModel FiveDaysMainForecastModelFromJson(String str) =>
    FiveDaysMainForecastModel.fromJson(json.decode(str));

String FiveDaysMainForecastModelToJson(FiveDaysMainForecastModel data) =>
    json.encode(data.toJson());

class FiveDaysMainForecastModel {
  final List<ForecastMaindataModel> list;

  FiveDaysMainForecastModel({
    required this.list,
  });

  factory FiveDaysMainForecastModel.fromJson(Map<String, dynamic> json) =>
      FiveDaysMainForecastModel(
        list: List<ForecastMaindataModel>.from(
            json["list"].map((x) => ForecastMaindataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}
