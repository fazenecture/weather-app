import 'package:clima/location.dart';
import 'package:clima/networking.dart';

const apiKey = '3eb04d5ea330d60d63bb865586f6c024';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition == 0) {
      return 'https://assets8.lottiefiles.com/packages/lf20_Cu88f9.json';
    } else if (condition < 300 && condition > 1) {
      return 'https://assets9.lottiefiles.com/temp/lf20_XkF78Y.json';
    } else if (condition < 400) {
      return 'https://assets9.lottiefiles.com/temp/lf20_rpC1Rd.json';
    } else if (condition < 600) {
      return 'https://assets9.lottiefiles.com/temp/lf20_WtPCZs.json';
    } else if (condition < 700) {
      return 'https://assets1.lottiefiles.com/temp/lf20_VAmWRg.json';
    } else if (condition < 800) {
      return 'https://assets9.lottiefiles.com/temp/lf20_kOfPKE.json';
    } else if (condition == 800) {
      return 'https://assets9.lottiefiles.com/temp/lf20_Stdaec.json';
    } else if (condition <= 804) {
      return 'https://assets5.lottiefiles.com/temp/lf20_dgjK9i.json';
    }
  }
}
