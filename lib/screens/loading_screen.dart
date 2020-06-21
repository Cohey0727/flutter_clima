import 'package:clima/models/weather.dart';
import 'package:clima/services/location_weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getGeoDate();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void getGeoDate() async {
    final service = LocationWeatherService();
    var weather = await service.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weather: weather,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: getGeoDate,
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
