String getLottieAsset(String weatherMain) {
  switch (weatherMain.toLowerCase()) {
    case 'clear':
      return 'assets/gif/lottie_sunny.json';
    case 'clouds':
      return 'assets/gif/lottie_cloudy.json';
    case 'rain':
      return 'assets/gif/lottie_rainy.json';
    case 'snow':
      return 'assets/gif/lottie_snowy.json';
    case 'thunderstorm':
      return 'assets/gif/lottie_thunder.json';
    case 'drizzle':
      return 'assets/gif/lottie_drizzle.json';
    default:
      return 'assets/gif/lottie_cloudy.json';
  }
}
