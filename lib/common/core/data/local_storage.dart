/*
  Use Shared preferences to store data locally
  in NSUserDefaults (ios) and SharedPreferences (android)
  You can use Hive as lightweight and fast key-value database
  or sqflite with complex queries
  https://pub.dev/packages/hive
  https://pub.dev/packages/sqflite
*/
import 'dart:convert';

import 'package:provider_base/models/user_info_model/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static const _keyAccessToken = 'access_token';
  static const _keyOnDarkMode = 'on_dark_mode';
  static const _keyUserInfo = 'user_info';
  static const _keyExpiredAt = 'expired_at';

  static Future<int?> getExpiredAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyExpiredAt);
  }

  static Future<void> saveExpiredAt(int expiredAt) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_keyExpiredAt, expiredAt);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

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

  static Future<UserInfo> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_keyUserInfo);

    if (value == null || value.isEmpty) {
      return UserInfo();
    }
    final map = jsonDecode(value) as Map<String, dynamic>;
    return UserInfo.fromJson(map);
  }

  static Future<void> updateUserInfo(UserInfo userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final value = jsonEncode(userInfo.toJson());
    await prefs.setString(_keyUserInfo, value);
  }
}
