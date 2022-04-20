import 'package:flutter/material.dart';
import 'package:provider_base/screens/login/login_screen.dart';

class NavigatorUtil {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get navigator => navigatorKey.currentState;

  // push to login when unauthorized
  Future<dynamic> navigateToLogin() async {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);

    return navigatorKey.currentState
        ?.pushReplacementNamed(LoginScreen.routeName);
  }
}
