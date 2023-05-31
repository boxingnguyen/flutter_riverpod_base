import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/env/firebase/firebase_options.dart';
import 'package:provider_base/env/firebase/firebase_options_dev.dart' as dev;
import 'package:provider_base/env/firebase/firebase_options_stg.dart' as stg;

part 'env_state.freezed.dart';

@freezed
class EnvState with _$EnvState {
  const factory EnvState({
    required String baseUrlApi,
    required String baseUrlS3,
    required String termsOfServiceUrl,
    required String paymentToken,
    FirebaseOptions? firebaseOptions,
  }) = _EnvState;

  const EnvState._();
}

enum Env { dev, stg, prod }

extension EnvExtension on Env {
  static EnvState envState = EnvState(
    baseUrlApi: '',
    baseUrlS3: '',
    termsOfServiceUrl: '',
    paymentToken: '',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  EnvState get value {
    switch (this) {
      case Env.dev:
        envState = envState.copyWith(
          baseUrlApi: 'https://jsonplaceholder.typicode.com',
          firebaseOptions: dev.DefaultFirebaseOptions.currentPlatform,
        );
        break;
      case Env.stg:
        envState = envState.copyWith(
          baseUrlApi: 'https://www.googleapis.com',
          firebaseOptions: stg.DefaultFirebaseOptions.currentPlatform,
        );
        break;
      // default production
      default:
    }

    return envState;
  }
}
