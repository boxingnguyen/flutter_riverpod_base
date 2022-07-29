import 'package:flutter/material.dart';
import 'package:provider_base/screens/dashboard/dashboard_screen.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/locale/locale_screen.dart';
import 'package:provider_base/screens/login/login_screen.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/settings/settings_screen.dart';
import 'package:provider_base/screens/util/util_screen.dart';

class Routes {
  static const modulesScreen = '/list_modules';
  static const utilScreen = '/util';
  static const loginScreen = '/login_screen';
  static const settingsScreen = '/settings';
  static const localeScreen = '/change_language';
  static const dashboardScreen = '/dashboard';
  static const todoScreen = '/todo';
  static const homeScreen = '/home_screen';

  static final Map<String, WidgetBuilder> routes = {
    modulesScreen: (context) => const ModulesScreen(),
    utilScreen: (context) => const UtilScreen(),
    settingsScreen: (context) => const SettingsScreen(),
    localeScreen: (context) => const LocaleScreen(),
    loginScreen: (context) => const LoginScreen(),
    dashboardScreen: (context) => const DashboardScreen(),
    homeScreen: (context) => const HomeScreen(),
  };
}
