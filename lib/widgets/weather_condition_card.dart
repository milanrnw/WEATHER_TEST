import 'package:flutter/material.dart';
import 'package:weathertest/models/current_weather_model.dart';

class WeatherConditionCard extends StatelessWidget {
  final CurrentWeatherModel currentWeatherDetails;

  const WeatherConditionCard({super.key, required this.currentWeatherDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Colors.blue.withValues(alpha: 0.8),
              Colors.purple.withValues(alpha: 0.8),
            ],
          ),
        ),
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CURRENT WEATHER CONDITION",
                style: TextStyle(fontSize: 24,color: Colors.white),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Condition: ${currentWeatherDetails.weatherText}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                  "Temp: ${currentWeatherDetails.temperature.metric.value} ${currentWeatherDetails.temperature.metric.unit}",
                  style: TextStyle(color: Colors.white)),
              Text(
                  "Observed at: ${currentWeatherDetails.localObservationDateTime}",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
