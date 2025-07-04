class TempValuesModel {
  final double value;
  final String unit;
  final int unitType;

  TempValuesModel({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  factory TempValuesModel.fromJson(Map<String, dynamic> json) => TempValuesModel(
        value: json["Value"].toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
}