import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_state.freezed.dart';

@freezed
class FormState with _$FormState {
  factory FormState({
    @Default(false) bool showPassword,
  }) = _FormState;
}
