import 'package:network/src/model/network_weather.dart';

abstract interface class WeatherDataSource {
  Future<NetworkWeather> getWeatherByCity({
    required String city,
    required String appId,
    String units = 'metric',
  });
}
