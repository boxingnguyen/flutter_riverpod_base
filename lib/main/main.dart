import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/utils/analytics_utils.dart';

late final StateProvider envProvider;

void setupAndRunApp({required EnvState env}) {
  envProvider = StateProvider((ref) => env);
  final analytics = AnalyticsUtil(FirebaseAnalytics.instance);
  //  FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  final analyticsUtilProvider = Provider<AnalyticsUtil>((ref) {
    throw UnimplementedError();
  });
  runApp(ProviderScope(
    overrides: [
      analyticsUtilProvider.overrideWithValue(analytics),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Base'),
    );
  }
}
