import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.github.com/',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        ) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
      ),
    );
  }
}