import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/models/user/user_detail.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    UserDetail? userDetail,
    @Default(false) bool isSignUp,
    @Default(false) bool forgotPasswordSuccess,
    @Default(false) bool showLoadingIndicator,
    @Default(0) int numberShowCaptcha,
    @Default(false) bool isCaptcha,
  }) = _LoginState;
}
