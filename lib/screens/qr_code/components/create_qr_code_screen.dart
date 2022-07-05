import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/common_view/text_field_login.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/utils/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class CreateQRCodeScreen extends StatefulWidget {
  const CreateQRCodeScreen({Key? key}) : super(key: key);

  @override
  State<CreateQRCodeScreen> createState() => _CreateQRCodeScreenState();
}

class _CreateQRCodeScreenState extends State<CreateQRCodeScreen> with Utils {
  final qrDataController = TextEditingController();
  final screenshotController = ScreenshotController();

  @override
  void dispose() {
    qrDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: Constants.createQRCode),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: screenshotController,
                child: QrImage(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  data: qrDataController.text,
                  size: 200,
                ),
              ),
              TextFieldLogin(
                controller: qrDataController,
                hinText: Constants.inputDataQR,
              ),
              const SizedBox(height: 30),
              ButtonUpload(
                label: Constants.createQRCode,
                colorButton: AppStyles.primaryColor,
                onTap: () => setState(() {}),
              ),
              const SizedBox(height: 15),
              ButtonUpload(
                label: Constants.saveToLibrary,
                colorButton: AppStyles.primaryColor,
                onTap: _saveQR,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveQR() async {
    String path;

    /* get path device:
    - nếu device là ios thì path là ở ứng dụng Tệp
    - nếu device là android thì path là ở trong 
    bộ nhớ trong của ứng dụng => thư mực files,
    nếu không sẽ là bộ nhớ trong => thư mục Download
    */

    if (Platform.isIOS) {
      path = (await getApplicationDocumentsDirectory()).path;
    } else {
      path = (await getExternalStorageDirectory())?.path ??
          '/storage/emulated/0/Download/';
    }
    String fileName = "QR_Code_${DateTime.now().microsecondsSinceEpoch}.jpg";

    await screenshotController
        .captureAndSave(path, fileName: fileName)
        .whenComplete(() {
      showOkAlertDialog(
        context: context,
        title: Constants.saveQRCode,
        message: Constants.saveSuccess,
      );
    }).catchError((e) {
      showOkAlertDialog(
        context: context,
        title: Constants.saveQRCode,
        message: Constants.saveFailed,
      );
    });
  }
}
