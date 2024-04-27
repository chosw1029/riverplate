//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;
import 'package:network/src/client/weather_client.dart' as _i5;
import 'package:network/src/data_source/weather_data_source.dart' as _i4;
import 'package:network/src/di/network_module.dart' as _i6;

class NetworkPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.factory<_i3.BaseOptions>(
        () => networkModule.baseOptions(gh<String>(instanceName: 'baseUrl')));
    gh.factory<_i3.Dio>(() => networkModule.dio(gh<_i3.BaseOptions>()));
    gh.factoryParam<_i4.WeatherDataSource, String?, dynamic>((
      baseUrl,
      _,
    ) =>
        _i5.WeatherClient(
          gh<_i3.Dio>(),
          baseUrl: baseUrl,
        ));
  }
}

class _$NetworkModule extends _i6.NetworkModule {}
