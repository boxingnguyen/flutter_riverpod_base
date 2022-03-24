import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

enum AnalyticsEventType {
  increment,
  getRandom,
}

extension AnalyticsEventTypeExtension on AnalyticsEventType {
  String get name {
    var string = '';
    switch (this) {
      case AnalyticsEventType.increment:
        string = 'increment';
        break;
      case AnalyticsEventType.getRandom:
        string = 'get_ramdom';
        break;
    }
    return string;
  }
}

class AnalyticsUtil {
  AnalyticsUtil();
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  Future<void> logEvent(
    AnalyticsEventType? type, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      await analytics.logEvent(
        name: type!.name,
        parameters: parameters,
      );
    } on Exception catch (e) {
      log('$e');
    }
  }

  Future<void> logLogin({String? loginMethod}) {
    return analytics.logLogin(loginMethod: loginMethod);
  }

  Future<void> setCurrentScreen(String s, {String? screenName}) {
    return analytics.setCurrentScreen(screenName: screenName);
  }
}
