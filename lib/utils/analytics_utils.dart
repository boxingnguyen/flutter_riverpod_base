import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

enum AnalyticsEventType {
  appLaunched,
  notification,
  takePicture,
  otpCaptcha,
  loginWithApple,
  loginWithGoogle,
  loginWithFacebook,
  playVideo,
  filePreview
}

extension AnalyticsEventTypeExtension on AnalyticsEventType {
  String get name {
    var string = '';
    switch (this) {
      case AnalyticsEventType.appLaunched:
        string = 'app_launched';
        break;
      case AnalyticsEventType.notification:
        string = 'notification';
        break;
      case AnalyticsEventType.takePicture:
        string = 'take_picture';
        break;
      case AnalyticsEventType.otpCaptcha:
        string = 'otp_captcha';
        break;
      case AnalyticsEventType.loginWithApple:
        string = 'login_with_apple';
        break;
      case AnalyticsEventType.loginWithFacebook:
        string = 'login_with_facebook';
        break;
      case AnalyticsEventType.loginWithGoogle:
        string = 'login_with_google';
        break;
      case AnalyticsEventType.playVideo:
        string = 'play_video';
        break;
      case AnalyticsEventType.filePreview:
        string = 'file_preview';
        break;
    }
    return string;
  }
}

class AnalyticsUtil {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(
    AnalyticsEventType type, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      await analytics.logEvent(
        name: type.name,
        parameters: parameters,
      );
    } on Exception catch (e) {
      log('$e');
    }
  }

  Future<void> logLogin({String? loginMethod}) {
    return analytics.logLogin(loginMethod: loginMethod);
  }

  Future<void> setCurrentScreen(String? screenName) {
    log(screenName ?? '');
    return analytics.setCurrentScreen(screenName: screenName);
  }

  Future<void> setUserId(String? userId) {
    return analytics.setUserId(id: userId);
  }

  Future<void> setUserProperty({
    required String name,
    required String value,
  }) {
    return analytics.setUserProperty(name: name, value: value);
  }
}
