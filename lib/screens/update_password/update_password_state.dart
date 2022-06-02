import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_state.freezed.dart';

@freezed
class UpdatePasswordState with _$UpdatePasswordState {
  factory UpdatePasswordState({
    @Default(false) bool showLoadingIndicator,
    @Default(false) bool isShowPassword,
    @Default(false) bool isShowRePassword,
    @Default(true) bool isSuccess,
  }) = _UpdatePasswordState;
}
