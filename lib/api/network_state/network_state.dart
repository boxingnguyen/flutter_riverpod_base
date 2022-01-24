import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_state.freezed.dart';

@freezed
abstract class NetworkState<T> with _$NetworkState<T> {
  const factory NetworkState(T? data) = _Data<T>;

  const factory NetworkState.loading() = _Loading<T>;

  const factory NetworkState.error(dynamic errors) = _ErrorDetails<T>;
}
