import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/theme/app_theme_state_notifier.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/routes.dart';
import 'package:provider_base/utils/analytics_utils.dart';

late final StateProvider envProvider;

Future<void> setupAndRunApp({required EnvState env}) async {
  envProvider = StateProvider((ref) => env);
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final analytics = AnalyticsUtil();

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  final analyticsUtilProvider = Provider((ref) => AnalyticsUtil());

  runApp(ProviderScope(
    overrides: [
      analyticsUtilProvider.overrideWithValue(analytics),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appThemeProvider);
    // TODO(anhnq): setup locale and font for whole app
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: state.appTheme,
      initialRoute: ModulesScreen.routeName,
      routes: routes,
    );
  }
}
