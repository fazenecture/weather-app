import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  int condition;
  String cityName;
  String weatherIcon;
  String description;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {

    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        weatherIcon = weather.getWeatherIcon(0);
        description = 'ERROR';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF7FAF7),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 55, 10, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.orange,
                          size: 40,
                        ),
                      ),
                      onTap: () async {
                        var weatherData = await weather.getWeatherLocation();
                        updateUI(weatherData);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 260,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.orange,
                      ),
                      onTap: () async {
                        var typeName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typeName != null) {
                          var weatherData =
                          await weather.getCityWeather(typeName);
                          updateUI(weatherData);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                '$description'.toUpperCase(),
                style: TextStyle(fontSize: 15, letterSpacing: 10),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Lottie.network(weatherIcon,
                    width: 260, height: 260, fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                '$temperature°',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Color(0xff282828),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '$cityName'.toUpperCase(),
              style: TextStyle(
                color: Color(0xff282828),
                fontSize: 15,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_vuubgscl.json',
                height: 200,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
