import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/network_weather.freezed.dart';
part '../generated/model/network_weather.g.dart';

@freezed
class NetworkWeather with _$NetworkWeather {
  const factory NetworkWeather({
    @JsonKey(name: 'main') required NetworkWeatherMain networkWeatherMain,
    @JsonKey(name: 'weather')
    required List<NetworkWeatherInfo> networkWeatherInfo,
    required int dt,
  }) = _NetworkWeather;

  factory NetworkWeather.fromJson(Map<String, dynamic> json) =>
      _$NetworkWeatherFromJson(json);
}

@freezed
class NetworkWeatherInfo with _$NetworkWeatherInfo {
  const factory NetworkWeatherInfo({
    required String main,
    required String description,
    required String icon,
  }) = _NetworkWeatherInfo;

  factory NetworkWeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$NetworkWeatherInfoFromJson(json);
}

@freezed
class NetworkWeatherMain with _$NetworkWeatherMain {
  const factory NetworkWeatherMain({
    required double temp,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
  }) = _NetworkWeatherMain;

  factory NetworkWeatherMain.fromJson(Map<String, dynamic> json) =>
      _$NetworkWeatherMainFromJson(json);
}
