import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();
  final refresh = 'refreshToken';
  final access = 'AccessToken';

  Future<String?> getAccessToken() async {
    return await storage.read(key: access);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: refresh);
  }

  saveAccessToken(String accessToken) async {
    await storage.write(key: access, value: accessToken);
  }

  saveRefreshToken(String refreshToken) async {
    await storage.write(key: refresh, value: refreshToken);
  }

  deleteRefreshToken() async {
    await storage.delete(key: refresh);
  }

  deleteAccessToken() async {
    await storage.delete(key: access);
  }
}
