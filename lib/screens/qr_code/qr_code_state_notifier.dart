import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_base/screens/qr_code/qr_code_state.dart';
import 'package:scan/scan.dart';

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

  Future<String> scanQRCodeFromFile() async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final ImagePicker _picker = ImagePicker();
    final imageScan = await _picker.pickImage(source: ImageSource.gallery);

    if (imageScan == null) {
      return '';
    }
    final qrData = await Scan.parse(imageScan.path);

    return qrData ?? '';
  }
}
