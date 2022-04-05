import 'package:flutter/material.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_screen.dart';
import 'package:provider_base/screens/dashboard/dashboard_screen.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/util/util_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // Example:
  ModulesScreen.routeName: (context) => const ModulesScreen(),
  UtilScreen.routeName: (context) => const UtilScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(title: 'fu'),
  DashboardScreen.routeName: (context) => DashboardScreen(),
};
