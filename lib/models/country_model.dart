class CountryModel {
    final String id;
    final String localizedName;
    final String englishName;

    CountryModel({
        required this.id,
        required this.localizedName,
        required this.englishName,
    });

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
    };
}