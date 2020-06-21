const Map<List<double>, String> conditionIconMap = {
  [double.negativeInfinity, 300]: '',
  [300.0, 400.0]: '',
  [400.0, 600.0]: '☔️',
  [600.0, 700.0]: '☃️',
  [700.0, 800.0]: '',
  [800.0, 801.0]: '☀️',
  [801.0, 804.0]: '☁️',
  [804.0, double.infinity]: '',
};

const Map<List<double>, String> tempMessageMap = {
  [double.negativeInfinity, 10]: 'You\'ll need 🧣 and 🧤',
  [10.0, 20.0]: 'Bring a 🧥 just in case',
  [20.0, 25.0]: 'Time for shorts and 👕',
  [25.0, double.infinity]: 'It\'s 🍦 time',
};

class WeatherModel {
  final double condition;
  final double temp;
  final String city;

  WeatherModel({this.condition, this.temp, this.city});

  String getWeatherIcon() {
    return conditionIconMap.entries.toList().firstWhere((element) {
      return element.key[0] <= this.condition &&
          this.condition < element.key[1];
    }).value;
  }

  String getTempMessage() {
    return tempMessageMap.entries.toList().firstWhere((element) {
      return element.key[0] <= this.condition &&
          this.condition < element.key[1];
    }).value;
  }

}
