import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/routes.dart';
import 'package:provider_base/common/core/theme/app_theme_state_notifier.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/utils/analytics_util.dart';
import 'package:provider_base/utils/navigator_util.dart';
import 'package:provider_base/utils/notification_util.dart';

late final StateProvider envProvider;
final analyticsUtilProvider = Provider((ref) => AnalyticsUtil());
final navigatorUtilProvider = Provider((ref) => NavigatorUtil());

Future<void> setupAndRunApp({required EnvState env}) async {
  envProvider = StateProvider((ref) => env);

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(appThemeProvider);
    ref.read(analyticsUtilProvider).logEvent(AnalyticsEventType.appLaunched);

    // initialize flutter local notification
    NotificationUtil.initialize(context);

    return MaterialApp(
      darkTheme: ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(), // This is required
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // This is required
      ],
      title: 'Provider Base',
      debugShowCheckedModeBanner: false,
      theme: themeState.appTheme,
      initialRoute: ModulesScreen.routeName,
      routes: routes,
      navigatorKey: ref.read(navigatorUtilProvider).navigatorKey,
      navigatorObservers: [
        FirebaseAnalyticsObserver(
            analytics: ref.read(analyticsUtilProvider).analytics),
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      builder: (context, child) => GestureDetector(
        // dismiss keyboard when tap outside whole app
        onTap: () =>
            WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
        child: child,
      ),
    );
  }
}
