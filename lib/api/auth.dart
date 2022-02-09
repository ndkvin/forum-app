import 'dart:convert';
import 'package:flutter/material.dart';
import '../helpers/secureStorage.dart';
import '../helpers/dio.dart';
import 'package:dio/dio.dart' as Dio;


class Auth extends ChangeNotifier {
  bool _isLogedin = false;
  bool get isLogedin => _isLogedin;

  Future<Map> requestRegister(credentials) async {
    try {
      final res = await dio().post('users', data: credentials);

      if (res.statusCode == 201) {
        return {
          'status': true,
        };
      }
    } on Dio.DioError catch (e) {
      final decodedError = json.decode(e.response.toString());
      return {
        'status': false,
        'errMsg': decodedError,
      };
    }
    return {
      'status': true,
    };
  }

  Future<Map> requestLogin(credentials) async {
    try {
      final res = await dio().post('authentications', data: credentials);
      final decodedRes = json.decode(res.toString());

      final accessToken = decodedRes['data']['accessToken'];
      final refreshToken = decodedRes['data']['refreshToken'];

      SecureStorage().saveAccessToken(accessToken);
      SecureStorage().saveRefreshToken(refreshToken);

      _isLogedin = true;
      notifyListeners();

      if (res.statusCode == 201) {
        return {
          'status': true,
        };
      }
    } on Dio.DioError catch (e) {
      final decodedError = json.decode(e.response.toString());
      return {
        'status': false,
        'errMsg': decodedError,
      };
    }
    return {
      'status': true,
    };
  }

  Future<Map> requestLogout(credential) async {
    try {
      final res = await dio().delete('authentications', data: credential);

      await SecureStorage().deleteAccessToken();
      await SecureStorage().deleteRefreshToken();

      _isLogedin = false;
      notifyListeners();

      if (res.statusCode == 200) {
        return {
          'status': true,
        };
      }
    } on Dio.DioError catch (e) {
      return {
        'status': false,
        'errMsg': e,
      };
    }
    return {
      'status': true,
    };
  }
}