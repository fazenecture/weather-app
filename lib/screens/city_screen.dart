import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value){
                    Navigator.pop(context, cityName);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xF7F7E7E),
                    icon: Icon(
                      Icons.location_pin,
                    ),
                    hintText: 'Enter City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
