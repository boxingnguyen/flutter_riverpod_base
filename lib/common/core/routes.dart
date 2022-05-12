import 'package:flutter/material.dart';
import 'package:provider_base/screens/dashboard/dashboard_screen.dart';
import 'package:provider_base/screens/locale/locale_screen.dart';
import 'package:provider_base/screens/login/login_screen.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/settings/settings_screen.dart';
import 'package:provider_base/screens/util/util_screen.dart';

class Routes {
  static String modulesScreen = '/list_modules';
  static String utilScreen = '/util';
  static const loginScreen = '/login_screen';
  static String settingsScreen = '/settings';
  static String localeScreen = '/change_language';
  static String dashboardScreen = '/dashboard';
  static String todoScreen = '/todo';

  static final Map<String, WidgetBuilder> routes = {
    modulesScreen: (context) => const ModulesScreen(),
    utilScreen: (context) => const UtilScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    localeScreen: (context) => const LocaleScreen(),
    loginScreen: (context) => const LoginScreen(),
    dashboardScreen: (context) => const DashboardScreen(),
  };

}