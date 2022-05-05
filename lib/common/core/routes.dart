import 'package:flutter/material.dart';
import 'package:provider_base/screens/dashboard/dashboard_screen.dart';
import 'package:provider_base/screens/locale/locale_screen.dart';
import 'package:provider_base/screens/login/login_screen.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/settings/settings_screen.dart';
import 'package:provider_base/screens/util/util_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // Example:
  ModulesScreen.routeName: (context) => const ModulesScreen(),
  UtilScreen.routeName: (context) => const UtilScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  LocaleScreen.routeName: (context) => const LocaleScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
};
