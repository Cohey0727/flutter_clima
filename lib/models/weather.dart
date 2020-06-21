const Map<List<int>, String> conditionIconMap = {
  [300, 400]: '',
  [400, 600]: '☔️',
  [600, 700]: '☃️',
  [700, 800]: '',
  [800, 801]: '☀️',
  [801, 804]: '☁️',
};

const Map<List<double>, String> tempMessageMap = {
  [double.negativeInfinity, 10.0]: 'You\'ll need 🧣 and 🧤',
  [10.0, 20]: 'Bring a 🧥 just in case',
  [20.0, 25]: 'Time for shorts and 👕',
  [25.0, double.infinity]: 'It\'s 🍦 time',
};

class WeatherModel {
  final int condition;
  final double temp;
  final String city;

  WeatherModel({this.condition, this.temp, this.city});

  String getWeatherIcon() {
    var find = conditionIconMap.entries.toList().firstWhere((element) {
      return element.key[0] <= this.condition &&
          this.condition < element.key[1];
    });
    return find != null ? find.value : '';
  }

  String getTempMessage() {
    var find = tempMessageMap.entries.toList().firstWhere((element) {
      return element.key[0] <= this.condition &&
          this.condition < element.key[1];
    });
    return find != null ? find.value : '';
  }

}
