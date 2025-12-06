class TemperatureModel {
  final Imperial metric;
  final Imperial imperial;

  TemperatureModel({
    required this.metric,
    required this.imperial,
  });

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      TemperatureModel(
        metric: Imperial.fromJson(json["Metric"]),
        imperial: Imperial.fromJson(json["Imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "Imperial": imperial.toJson(),
      };
}

class Imperial {
  final double value;
  final String unit;
  final int unitType;

  Imperial({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"]?.toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
}
