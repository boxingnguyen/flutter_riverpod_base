import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider_base/env/env_state.dart';
import 'package:provider_base/env/firebase/firebase_options_stg.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupAndRunApp(
    env: EnvValue.staging,
  );
}
