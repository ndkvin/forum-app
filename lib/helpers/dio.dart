import 'package:dio/dio.dart';

Dio dio () {
  return Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5000/',
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json'
      },
    ),

  );
}