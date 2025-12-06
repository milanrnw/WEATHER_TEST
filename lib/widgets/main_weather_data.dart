import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWeatherData extends StatelessWidget {
  String weatherType;
  String weatherTemp;
  MainWeatherData(
      {super.key, required this.weatherType, required this.weatherTemp});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "${weatherType} ",
        style: TextStyle(
          fontFamily: "MadimiOne",
          fontSize: 24.sp,
          fontWeight: FontWeight.normal,
          color: Color(0XFF3C4042),
        ),
        children: [
          TextSpan(
            text: "${weatherTemp}°C",
            style: TextStyle(
              fontFamily: "MadimiOne",
              fontWeight: FontWeight.w300,
              fontSize: 32.sp,
              color: Color(0XFF3C4042),
            ),
          ),
        ],
      ),
    );
  }
}
