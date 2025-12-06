import 'country_model.dart';

class TopcitiesModel {
    final int version;
    final String key;
    final int rank;
    final String localizedName;
    final String englishName;
    final CountryModel country;

    TopcitiesModel({
        required this.version,
        required this.key,
        required this.rank,
        required this.localizedName,
        required this.englishName,
        required this.country,
    });

    factory TopcitiesModel.fromJson(Map<String, dynamic> json) => TopcitiesModel(
        version: json["Version"],
        key: json["Key"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        country: CountryModel.fromJson(json["Country"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Rank": rank,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "Country": country.toJson(),
    };
}
