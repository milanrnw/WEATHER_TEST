import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weathertest/core/api_requests.dart';
import 'package:weathertest/models/topcities_model.dart';
import 'package:http/http.dart' as http;
import 'package:weathertest/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TopcitiesModel> topCities = [];

  Future<void> fetchtopcities() async {
    final response = await http.get(Uri.parse(ApiRequests.topcities));

    if (response.statusCode == 200) {
      final List<dynamic> cityData = jsonDecode(response.body);

      topCities = cityData.map((cityJson) => TopcitiesModel.fromJson(cityJson)).toList();

      setState(() {});
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchtopcities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "TOP CITIES",
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return WeatherCard(
                topcitiesDetails: topCities[index],
              );
            },
            itemCount: topCities.length,
          ),
        ),
      ),
    );
  }
}
