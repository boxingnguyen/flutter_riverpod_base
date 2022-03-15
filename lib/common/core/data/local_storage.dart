// Use Shared preferences to store data locally
// in NSUserDefaults (ios) and SharedPreferences (android)
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static const _keyAccessToken = 'access_token';
  static const _keyOnDarkMode = 'onDarkMode';

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccessToken);
  }

  static Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyAccessToken, token);
  }

  static Future<void> setOnDarkMode(bool onDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnDarkMode, onDarkMode);
  }

  static Future<bool?> getOnDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnDarkMode);
  }
}
