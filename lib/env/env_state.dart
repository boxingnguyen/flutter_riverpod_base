import 'package:freezed_annotation/freezed_annotation.dart';

part 'env_state.freezed.dart';

@freezed
abstract class EnvState with _$EnvState {
  const factory EnvState({
    required String baseUrlApi,
    required String baseUrlS3,
    required String termsOfServiceUrl,
    required String paymentToken,
  }) = _EnvState;

  const EnvState._();
}

// ignore: avoid_classes_with_only_static_members
class EnvValue {
  static const EnvState development = EnvState(
    baseUrlApi: 'https://jsonplaceholder.typicode.com',
    baseUrlS3: '',
    termsOfServiceUrl: '',
    paymentToken: '',
  );
  static const EnvState staging = EnvState(
    baseUrlApi: 'https://www.googleapis.com',
    baseUrlS3: '',
    termsOfServiceUrl: '',
    paymentToken: '',
  );
  static const EnvState production = EnvState(
    baseUrlApi: '',
    baseUrlS3: '',
    termsOfServiceUrl: '',
    paymentToken: '',
  );
}
