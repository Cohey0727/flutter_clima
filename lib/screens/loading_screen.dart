import 'package:clima/services/weather.dart';
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

  void getGeoDate() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    final latitude = position.latitude;
    final longitude = position.longitude;
    print(latitude);
    print(longitude);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        location: position,
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
