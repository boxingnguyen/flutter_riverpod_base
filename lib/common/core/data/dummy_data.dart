import 'dart:convert';

import 'package:http/http.dart';
import 'package:provider_base/common/core/data/local_storage.dart';

class DummyData {
  static Future<Response> handleCheckExpired() async {
    int? expiredAt = await LocalStorage.getExpiredAt();
    if (expiredAt != null) {
      if (DateTime.now().millisecondsSinceEpoch <= expiredAt) {
        return Response(json.encode(loginSuccessful), 200);
      } else {
        return Response(json.encode(unauthorizedError), 401);
      }
    }

    return Response(json.encode(loginSuccessful), 200);
  }

  static Map<String, dynamic> loginSuccessful = {
    'name': 'dieptt',
    'token': 'abc123456789',
    'expired_at': DateTime.now().millisecondsSinceEpoch + 5000,
    'message': 'ok'
  };

  static Map<String, dynamic> unauthorizedError = {'message': 'fail'};
}
