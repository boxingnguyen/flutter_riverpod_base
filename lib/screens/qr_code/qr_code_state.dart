import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code_state.freezed.dart';

@freezed
class QrCodeState with _$QrCodeState {
  factory QrCodeState({
    @Default('') String dataQrCode,
  }) = _QrCodeState;
}
