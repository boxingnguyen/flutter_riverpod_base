import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(0) int counter,
    @Default(17) int random,
    @Default(false) bool showLoadingIndicator,
    @Default(false) bool updatePhone,
  }) = _HomeState;
}
