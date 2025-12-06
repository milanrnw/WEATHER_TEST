class TempMainModel {
  final double temp;

  TempMainModel({
    required this.temp,
  });

  factory TempMainModel.fromJson(Map<String, dynamic> json) => TempMainModel(
        temp: (json["temp"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
      };
}
