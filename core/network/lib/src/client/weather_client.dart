import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/data_source/weather_data_source.dart';
import 'package:retrofit/retrofit.dart';

import '../model/network_weather.dart';

part '../generated/client/weather_client.g.dart';

@Injectable(as: WeatherDataSource)
@RestApi()
abstract class WeatherClient implements WeatherDataSource {
  @factoryMethod
  factory WeatherClient(
    Dio dio, {
    @factoryParam String? baseUrl,
  }) = _WeatherClient;

  @GET('/weather')
  @override
  Future<NetworkWeather> getWeatherByCity({
    @Query('q') required String city,
    @Query('appid') required String appId,
    @Query('units') String units = 'metric',
  });
}
