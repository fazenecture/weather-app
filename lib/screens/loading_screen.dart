// import 'dart:js';
import 'package:clima/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/location.dart';
import 'package:clima/networking.dart';
import 'location_screen.dart';
import 'package:clima/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:io';
import 'package:clima/services/weather.dart';

const apiKey = '3eb04d5ea330d60d63bb865586f6c024';
const spinkit = SpinKitDoubleBounce(
  color: Colors.white,
  size: 50.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;


  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherLocation();

    sleep(const Duration(seconds: 2));

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.network('https://assets3.lottiefiles.com/packages/lf20_gfmi4i3g.json',
            width: 180,
            height: 180,
            fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
