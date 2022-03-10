import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_base/models/user_model/user.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    UserDetail? userDetail,
    @Default(false) bool showLoadingIndicator,
  }) = _LoginState;
}