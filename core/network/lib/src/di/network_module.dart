import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  static const Duration _connectTimeOut = Duration(seconds: 15);
  static const Duration _receiveTimeOut = Duration(seconds: 30);

  BaseOptions baseOptions(@Named('baseUrl') String baseUrl) => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: _connectTimeOut,
        receiveTimeout: _receiveTimeOut,
      );

  Dio dio(BaseOptions options) => Dio(options);
}
