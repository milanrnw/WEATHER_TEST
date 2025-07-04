class ApiRequests {
  ApiRequests._();

  static const String baseUrl = "http://dataservice.accuweather.com/";
  static const String apiKey = "8EKYZc7zMXrje7xTijR3XWx2Q0xeCcit";
  //static const String apiKey = "3bQZ8QxRFD3MvA8ghAr48km0xBoRxXG8";

  static const String topcities =
      "${baseUrl}locations/v1/topcities/50/?apikey=$apiKey&language=en-US&details=false";

  static String currentConditions(String cityKey) {
    return "${baseUrl}currentconditions/v1/$cityKey?apikey=$apiKey&language=en-US&details=false";
  }

  //static String dailyForecast =
  //    "http://dataservice.accuweather.com/forecasts/v1/daily/1day/28143?apikey=3bQZ8QxRFD3MvA8ghAr48km0xBoRxXG8&language&details&metric";

  static String dailyForecast(String cityKey) {
    return "${baseUrl}forecasts/v1/daily/5day/$cityKey?apikey=$apiKey&language=en-US&details=false&metric=true";
  }
}
