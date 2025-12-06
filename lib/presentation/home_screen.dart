import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:myweatherapp/core/api_requests.dart';
import 'package:myweatherapp/models/fivedays_main_forecast_model.dart';
import 'package:myweatherapp/models/tempMainModel.dart';
import 'package:myweatherapp/models/weatherMainModel.dart';
import 'package:myweatherapp/widgets/custom_searchbar.dart';
import 'package:myweatherapp/widgets/get_lottie.dart';
import 'package:myweatherapp/widgets/homescreen_data_card.dart';
import 'package:myweatherapp/widgets/main_weather_data.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherMainModel? weatherDataType;
  TempMainModel? tempDataType;
  FiveDaysMainForecastModel? fiveDaysForecast;

  String cityName = "Delhi";
  bool isLoading = false;

  Future<void> fetchWeatherType() async {
    setState(() {
      isLoading = true;
    });

    final currentResponse = await http.get(
      Uri.parse(ApiRequests.currentConditionUrl(city: cityName)),
    );

    final forecastResponse = await http.get(
      Uri.parse(ApiRequests.fiveDaysForecastUrl(city: cityName)),
    );

    if (currentResponse.statusCode == 200 &&
        forecastResponse.statusCode == 200) {
      final Map<String, dynamic> currentData =
          json.decode(currentResponse.body);
      final Map<String, dynamic> forecastData =
          json.decode(forecastResponse.body);

      final weatherList = currentData['weather'] as List<dynamic>;
      final mainWeather = weatherList.isNotEmpty ? weatherList[0] : {};
      final mainTemp = currentData['main'] ?? {};

      weatherDataType = WeatherMainModel.fromJson(mainWeather);
      tempDataType = TempMainModel.fromJson(mainTemp);
      fiveDaysForecast = FiveDaysMainForecastModel.fromJson(forecastData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Oops! Something went wrong"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherType();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    SizedBox(height: topPadding);

    if (isLoading ||
        weatherDataType == null ||
        tempDataType == null ||
        fiveDaysForecast == null) {
      return const Scaffold(
        backgroundColor: Color(0XFFE7EAEF),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0XFFE7EAEF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Center(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        cityName,
                        style: GoogleFonts.oxanium(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF3C4042),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56,
            ),
            Lottie.asset(
              getLottieAsset(weatherDataType!.main),
              width: 410.w,
              height: 410.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 64,
            ),
            MainWeatherData(
              weatherType: weatherDataType!.main,
              weatherTemp: tempDataType!.temp.toString(),
            ),
            SizedBox(
              height: 18,
            ),
            HomescreenDataCard(fiveDaysForecast: fiveDaysForecast!),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CustomSearchbar(
                    cityChanged: (newCity) async {
                      setState(() {
                        cityName = newCity;
                      });
                      await fetchWeatherType();
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset("assets/svgs/swipe_menu.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
