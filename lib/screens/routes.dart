import 'package:flutter/material.dart';
import 'package:provider_base/screens/dashboard/dashboard_screen.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/util/util_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // TODO: Add routes
  // Example:
  ModulesScreen.routeName: (context) => const ModulesScreen(),
  UtilScreen.routeName: (context) => const UtilScreen(),
  DashboardScreen.routeName: (context) => DashboardScreen(),
};
