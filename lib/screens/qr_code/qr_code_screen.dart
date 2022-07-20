import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/qr_code/components/create_qr_code_screen.dart';
import 'package:provider_base/screens/qr_code/components/qr_scan_screen.dart';
import 'package:provider_base/screens/qr_code/qr_code_state.dart';
import 'package:provider_base/screens/qr_code/qr_code_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class QrCodeScreen extends HookConsumerWidget with Utils {
  const QrCodeScreen({Key? key}) : super(key: key);
  static const routeName = '/qr_code_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Variable for notifier of QR Code
    final qrCodeNotifier = ref.read(qrCodeProvider.notifier);
    final qrCodeState = ref.read(qrCodeProvider);

    return Scaffold(
      appBar: getAppBar(context: context, title: Constants.qrCode),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonUpload(
                  colorButton: AppStyles.primaryColor,
                  label: Constants.selectFromFile,
                  onTap: () =>
                      _scanQRFromFile(context, qrCodeState, qrCodeNotifier),
                ),
                const SizedBox(height: 15),
                ButtonUpload(
                  colorButton: AppStyles.primaryColor,
                  label: Constants.cameraScan,
                  onTap: () => push(context, const QrCodeScanScreen()),
                ),
                const SizedBox(height: 15),
                ButtonUpload(
                  colorButton: AppStyles.primaryColor,
                  label: Constants.createQRCode,
                  onTap: () => push(context, const CreateQRCodeScreen()),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scanQRFromFile(
    BuildContext context,
    QrCodeState qrCodeState,
    QrCodeStateNotifier qrCodeNotifier,
  ) async {
    final scanValue = await qrCodeNotifier.scanQRCodeFromFile();

    if (scanValue == null) {
      return;
    }

    await showOkAlertDialog(
      context: context,
      title: Constants.qrCode,
      message: scanValue.isEmpty ? Constants.scanQRFailed : scanValue,
    );
  }
}
