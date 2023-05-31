import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/api/api_client.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/common/core/routes.dart';
import 'package:provider_base/common/core/theme/app_theme_state_notifier.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/l10n/l10n.dart';
import 'package:provider_base/l10n/ln10_delegate.dart';
import 'package:provider_base/screens/locale/locale_state_notifier.dart';
import 'package:provider_base/utils/analytics_utils.dart';
import 'package:provider_base/utils/notification_util.dart';

late StateNotifierProvider<ApiClient, EnvState> envProvider;
final analyticsUtilProvider = Provider((ref) => AnalyticsUtil());

Future<void> setupAndRunApp({required Env env}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: env.value.firebaseOptions);

  envProvider = StateNotifierProvider<ApiClient, EnvState>(
      (ref) => ApiClient(env.value, ref));

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
    final localeState = ref.watch(localeProvider);
    final themeState = ref.watch(appThemeProvider);
    ref.read(analyticsUtilProvider).logEvent(AnalyticsEventType.appLaunched);

    // initialize flutter local notification
    NotificationUtil.initialize(context);

    return MaterialApp(
      navigatorKey: Constants.navigatorKey,
      scaffoldMessengerKey: Constants.snackbarKey,
      themeMode: ThemeMode.system,
      theme: themeState.appTheme,
      localizationsDelegates: const [
        L10n.delegate,
        L10nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      title: 'Provider Base',
      debugShowCheckedModeBanner: false,
      locale: localeState.locale,
      initialRoute: Routes.modulesScreen,
      routes: Routes.routes,
      navigatorObservers: [
        FirebaseAnalyticsObserver(
            analytics: ref.read(analyticsUtilProvider).analytics),
      ],
      builder: (context, child) => GestureDetector(
        // dismiss keyboard when tap outside whole app
        onTap: () =>
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: child,
      ),
    );
  }
}
