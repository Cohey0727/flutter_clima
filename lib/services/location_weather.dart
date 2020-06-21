import 'package:clima/models/weather.dart';
import 'package:geolocator/geolocator.dart';

import 'networking.dart';

const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class LocationWeatherService {
  Future<WeatherModel> getLocationWeather() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      return WeatherModel(
          condition: weatherData['weather'][0]['id'],
          temp: weatherData['main']['temp'],
          city: weatherData['name']);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
