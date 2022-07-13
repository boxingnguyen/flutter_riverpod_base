import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
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
  final _screenshotController = ScreenshotController();

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
                controller: _screenshotController,
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
    await _screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List? image) async {
      if (image != null) {
        final fileName = "Qr_${DateTime.now().microsecondsSinceEpoch}.png";
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/$fileName').create();
        await imagePath.writeAsBytes(image);

        try {
          // save to gallery
          await ImageGallerySaver.saveFile(imagePath.path);
          imagePath.exists().then((value) => log('file ton tai $value'));

          showOkAlertDialog(
            context: context,
            title: Constants.saveQRCode,
            message: Constants.saveSuccess,
          );
        } catch (e) {
          showOkAlertDialog(
            context: context,
            title: Constants.saveFailed,
            message: '$e',
          );
        }
      }
    });
  }
}
