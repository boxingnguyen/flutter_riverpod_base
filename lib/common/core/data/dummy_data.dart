import 'dart:convert';

import 'package:http/http.dart';
import 'package:provider_base/common/core/data/local_storage.dart';

class DummyData {
  static Future<Response> handleCheckExpired() async {
    int? expiredAt = await LocalStorage.getExpiredAt();

    if (expiredAt == null) {
      return Response(json.encode(loginSuccessful), 200);
    }
    final now = DateTime.now().millisecondsSinceEpoch;

    if (now <= expiredAt) {
      return Response(json.encode(loginSuccessful), 200);
    }
    return Response(json.encode(unauthorizedError), 401);
  }

  static Map<String, dynamic> loginSuccessful = {
    'name': 'dieptt',
    'token': 'abc123456789',
    'expired_at': DateTime.now().millisecondsSinceEpoch + 5000,
    'message': 'ok'
  };

  static Map<String, dynamic> unauthorizedError = {'message': 'fail'};
}
