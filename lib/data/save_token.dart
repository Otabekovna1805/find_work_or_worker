
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

sealed class Store {
  static const String _accessToken = "accessToken";
  static const String _refreshToken = "refreshToken";
  static const storage = FlutterSecureStorage();

  static Future<void> setToken(String accessToken, String refreshToken) async {
    await storage.write(key: _accessToken, value: accessToken);
    await storage.write(key: _refreshToken, value: refreshToken);
  }

  static Future<String?> accessToken() async {
    return await storage.read(key: _accessToken);
  }

  static Future<String?> getRefreshToken() async {
    return await storage.read(key: _refreshToken);
  }

  static Future<void> clear(String token) async {
    await storage.delete(key: token);
  }

  static Future<Map<String, String>> readAll() async {
    return storage.readAll();
  }
}