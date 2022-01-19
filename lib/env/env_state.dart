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
    baseUrlApi: 'https://kanri-owner-dev1.chintaidx.com/graphql',
    baseUrlS3:
        'https://chintaidx-files-public-dev1.s3-ap-northeast-1.amazonaws.com',
    termsOfServiceUrl: 'https://kanri-owner-dev1.chintaidx.com/terms',
    paymentToken: 'https://pt01.mul-pay.jp/ext/api/credit/getToken',
  );
  static const EnvState staging = EnvState(
    baseUrlApi: 'https://owner-stg.admin.chintaidx.com/graphql',
    baseUrlS3:
        'https://chintaidx-files-public-staging.s3-ap-northeast-1.amazonaws.com',
    termsOfServiceUrl: 'https://owner-stg.admin.chintaidx.com/terms',
    paymentToken: 'https://pt01.mul-pay.jp/ext/api/credit/getToken',
  );
  static const EnvState production = EnvState(
    baseUrlApi: 'https://admin.chintaidx.com/graphql',
    baseUrlS3: 'https://chintaidx-files-public.s3-ap-northeast-1.amazonaws.com',
    termsOfServiceUrl: 'https://admin.chintaidx.com/terms',
    paymentToken: 'https://p01.mul-pay.jp/ext/api/credit/getToken',
  );
}
