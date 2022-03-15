import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/utils/analytics_utils.dart';

late final StateProvider envProvider;

Future<void> setupAndRunApp({required EnvState env}) async {
  envProvider = StateProvider((ref) => env);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final analytics = AnalyticsUtil();
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
