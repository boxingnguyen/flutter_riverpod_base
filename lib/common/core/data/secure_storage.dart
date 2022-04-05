import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // implement store secure data if need in keychain and keystore
  // package: https://pub.dev/packages/flutter_secure_storage

  static const storage = FlutterSecureStorage();
  static const accessToken = 'access_token';
  static const refreshToken = 'f5_token';

  // Default return access token, else refresh token
  static Future<String> getToken({bool isAccessToken = true}) async {
    final token = await storage.read(
      key: isAccessToken ? accessToken : refreshToken,
    );
    return token ?? '';
  }

  static Future<void> saveToken(
    String token, {
    bool isAccessToken = true,
  }) async {
    await storage.write(
      key: isAccessToken ? accessToken : refreshToken,
      value: token,
    );
  }
}
