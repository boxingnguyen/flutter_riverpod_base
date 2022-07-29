import 'package:freezed_annotation/freezed_annotation.dart';
part 'util_state.freezed.dart';

@freezed
class UtilState with _$UtilState {
  factory UtilState(
      {@Default('') String status,
      @Default(false) bool showLoadingIndicator,
      @Default(false) bool showErrorIndicator}) = _UtilState;
}
