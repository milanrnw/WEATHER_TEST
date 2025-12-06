import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weathertest/core/api_requests.dart';
import 'package:weathertest/models/current_weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weathertest/widgets/weather_condition_card.dart';
import 'package:weathertest/models/forecast/forecast_model.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityKey;
  final String cityName;

  const WeatherDetailsScreen(
      {super.key, required this.cityKey, required this.cityName});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  // Current Condition
  CurrentWeatherModel? currentWeatherDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCurrentWeather();
    fetchForecastData();
  }

  Future<void> fetchCurrentWeather() async {
    final response = await http.get(
      Uri.parse(ApiRequests.currentConditions(widget.cityKey)),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        setState(() {
          currentWeatherDetails = CurrentWeatherModel.fromJson(jsonData[0]);
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Forecast
  late ForecastModel? forecastModel;

  Future<void> fetchForecastData() async {
    final response =
        await http.get(Uri.parse(ApiRequests.dailyForecast(widget.cityKey)));
    if (response.statusCode == 200) {
      setState(() {
        forecastModel = forecastModelFromJson(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final weather = currentWeatherDetails;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        title: Text(widget.cityName),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    weather == null
                        ? Text("Weather data not available.")
                        : WeatherConditionCard(currentWeatherDetails: weather),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Daily Forecast For Following Days :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 26, 255)
                            .withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    //forecastModel == null
                    //? const Text("Forecast data not available.")
                    //:
                    Expanded(
                      child: ListView.builder(
                        itemCount: forecastModel?.dailyForecasts.length,
                        itemBuilder: (context, index) {
                          final forecast = forecastModel?.dailyForecasts[index];
                          final min = forecast?.temperature.minimum.value;
                          final max = forecast?.temperature.maximum.value;

                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orangeAccent.withValues(alpha: 0.8),
                                  Colors.deepOrangeAccent
                                      .withValues(alpha: 0.8),
                                  Colors.redAccent.withValues(alpha: 0.8),
                                ],
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              title: Text("Day ${index + 1}"),
                              subtitle: Text("Min: $min°F, Max: $max°F"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
