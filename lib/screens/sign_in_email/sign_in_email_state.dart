import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/models/user/user_detail.dart';

part 'sign_in_email_state.freezed.dart';

@freezed
class SignInEmailState with _$SignInEmailState {
  factory SignInEmailState({
    UserDetail? userDetail,
    @Default(false) bool showLoadingIndicator,
    @Default(0) int numberShowCaptcha,
    @Default(false) bool isCaptcha,
    @Default(false) bool isEmptyInput,
    @Default(false) bool isShowPassword,
    @Default(false) bool isSignUp,
  }) = _SignInEmailState;
}
