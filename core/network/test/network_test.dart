import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' hide test;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/di.dart';
import 'package:network/network.dart';
import 'package:network/src/client/weather_client.dart';

import 'network_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  const city = 'Jakarta';
  const appId = '12345';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final String mockData = await rootBundle
        .loadString('packages/network/assets/weather.mock.json');

    final response = Response<Map<String, dynamic>>(
        data: jsonDecode(mockData),
        statusCode: 200,
        requestOptions: RequestOptions());

    when(dio.options).thenAnswer((_) => BaseOptions());
    when(dio.fetch(any)).thenAnswer((_) async => response);
    when(dio.get('$baseUrl?q=$city&appid=$appId&units=metric'))
        .thenAnswer((_) async => response);
  });

  test('is registered network module objects', () async {
    await GetIt.I.reset();
    GetIt.I.registerFactory<String>(() => baseUrl, instanceName: 'baseUrl');
    await NetworkPackageModule().init(GetItHelper(GetIt.I));

    expect(GetIt.I.isRegistered<String>(instanceName: 'baseUrl'), true);
    expect(GetIt.I.isRegistered<BaseOptions>(), true);
    expect(GetIt.I.isRegistered<WeatherDataSource>(), true);
  });

  test('call getWeatherByCity and parse json', () async {
    final WeatherDataSource weatherClient = WeatherClient(dio);

    final NetworkWeather result =
        await weatherClient.getWeatherByCity(city: city, appId: appId);

    expect(result, isA<NetworkWeather>());
  });
}
