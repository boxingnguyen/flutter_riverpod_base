import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/screens/qr_code/qr_code_state.dart';

final qrCodeProvider = StateNotifierProvider<QrCodeStateNotifier, QrCodeState>(
    (_) => QrCodeStateNotifier());

class QrCodeStateNotifier extends StateNotifier<QrCodeState> {
  QrCodeStateNotifier() : super(QrCodeState());

  // Function to get and set data QR code into state
  Future<void> getQrCode(String? dataQrCode) async {
    // If data QR code is null, will be return
    if (dataQrCode == null) {
      return;
    }

    state = state.copyWith(dataQrCode: dataQrCode);
  }
}
