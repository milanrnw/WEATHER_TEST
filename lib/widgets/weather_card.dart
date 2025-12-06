import 'package:flutter/material.dart';
import 'package:weathertest/models/topcities_model.dart';
import 'package:weathertest/presentations/weather_details_screen.dart';

class WeatherCard extends StatelessWidget {
  final TopcitiesModel? topcitiesDetails;

  const WeatherCard({super.key, this.topcitiesDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (topcitiesDetails != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherDetailsScreen(
                cityKey: topcitiesDetails!.key,
                cityName: topcitiesDetails!.englishName,
              ),
            ),
          );
        }
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rank : ${topcitiesDetails?.rank}"),
              Text("Id : ${topcitiesDetails?.country.id}"),
              Text("Country : ${topcitiesDetails?.country.englishName}"),
              Text("City : ${topcitiesDetails?.englishName}"),
            ],
          ),
        ),
      ),
    );
  }
}
