import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/common/core/routes.dart';
import 'package:provider_base/common/core/theme/app_theme_state_notifier.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/l10n/l10n.dart';
import 'package:provider_base/l10n/ln10_delegate.dart';
import 'package:provider_base/screens/locale/locale_state_notifier.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/utils/analytics_utils.dart';
import 'package:provider_base/utils/notification_util.dart';

late final StateProvider envProvider;
final analyticsUtilProvider = Provider((ref) => AnalyticsUtil());

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
      // TODO(mintt): check default locale có lấy từ system ko? -> lấy từ system
      // khi đã chọn locale -> lưu vào preferences.
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
            WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
        child: child,
      ),
    );
  }
}
