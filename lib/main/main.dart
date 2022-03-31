import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/theme/app_theme_state_notifier.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/screens/modules/modules_screen.dart';
import 'package:provider_base/screens/routes.dart';
import 'package:provider_base/screens/login/login_screen.dart';

late final StateProvider envProvider;

void setupAndRunApp({required EnvState env}) async {
  envProvider = StateProvider((ref) => env);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appThemeProvider);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: state.appTheme,
      initialRoute: ModulesScreen.routeName,
      routes: routes,
      home: const LoginScreen(),
      supportedLocales: const [
        Locale('en'),
      ],
    );
  }
}
