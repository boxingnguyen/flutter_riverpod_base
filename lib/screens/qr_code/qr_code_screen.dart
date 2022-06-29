import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider_base/screens/qr_code/qr_code_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScreen extends HookConsumerWidget with Utils {
  const QrCodeScreen({Key? key}) : super(key: key);
  static const routeName = '/qr_code_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Variable for notifier of QR Code
    final qrCodeNotifier = ref.read(qrCodeProvider.notifier);
    // Variable for mobile scanner controller
    final cameraController = MobileScannerController();

    return Scaffold(
      appBar: getAppBar(context: context, title: 'Scanner QR Code Screen'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Build scanner view
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) async {
              qrCodeNotifier.getQrCode(barcode.rawValue);
              await showOkAlertDialog(
                context: context,
                title: 'QR Code',
                message: barcode.rawValue,
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
                    builder: (context, state, child) {
                      switch (state as TorchState) {
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
                    builder: (context, state, child) {
                      switch (state as CameraFacing) {
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
