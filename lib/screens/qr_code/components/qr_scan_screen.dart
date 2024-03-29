import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/qr_code/qr_code_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class QrCodeScanScreen extends HookConsumerWidget with Utils {
  const QrCodeScanScreen({Key? key}) : super(key: key);
  static const routeName = '/qr_code_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Variable for notifier of QR Code
    final qrCodeNotifier = ref.read(qrCodeProvider.notifier);
    // Variable for mobile scanner controller
    final cameraController =
        MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);

    return Scaffold(
      appBar: getAppBar(title: Constants.scanQRCode),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Build scanner view
          MobileScanner(
            controller: cameraController,
            onDetect: (barcode) async {
              final List<Barcode> barcodes = barcode.barcodes;
              String message = '';
              for (final barcode in barcodes) {
                message += barcode.displayValue ?? '';
              }
              qrCodeNotifier.getQrCode(barcode.barcodes.toString());
              await showOkAlertDialog(
                context: context,
                title: Constants.qrCode,
                message: message,
              );
            },
          ),
          // Build button turn on/off flash and switch front/rear camera
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button turn on/off flash
                _buildButtonScannerQrCode(
                  icon: ValueListenableBuilder(
                    valueListenable: cameraController.torchState,
                    builder: (BuildContext context, TorchState state, child) {
                      switch (state) {
                        case TorchState.off:
                          return const Icon(
                            Icons.flash_off,
                            color: Colors.grey,
                          );
                        case TorchState.on:
                          return const Icon(
                            Icons.flash_on,
                            color: Colors.yellow,
                          );
                      }
                    },
                  ),
                  onPressed: () => cameraController.toggleTorch(),
                ),
                const SizedBox(width: 24),
                // Button switch front/rear camera
                _buildButtonScannerQrCode(
                  icon: ValueListenableBuilder(
                    valueListenable: cameraController.cameraFacingState,
                    builder: (BuildContext context, CameraFacing state, child) {
                      switch (state) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  onPressed: () => cameraController.switchCamera(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build button turn on/off flash and switch front/rear camera
  Widget _buildButtonScannerQrCode({
    required Widget icon,
    required void Function()? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.white,
        icon: icon,
        iconSize: 32.0,
        onPressed: onPressed,
      ),
    );
  }
}
