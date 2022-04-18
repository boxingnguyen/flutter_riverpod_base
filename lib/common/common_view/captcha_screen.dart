import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/captcha_v2.dart';

class CaptchaScreen extends StatefulWidget {
  const CaptchaScreen({
    Key? key,
    required this.onVerifiedError,
    required this.onVerifiedSuccessfully,
  }) : super(key: key);
  final void Function(String) onVerifiedError;
  final void Function(String) onVerifiedSuccessfully;

  @override
  _CaptchaScreenState createState() => _CaptchaScreenState();
}

class _CaptchaScreenState extends State<CaptchaScreen> {
  String verifyResult = "";

  RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  @override
  void initState() {
    recaptchaV2Controller.show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecaptchaV2(
      apiKey: '6LdO8n8fAAAAAAFW6EMmqQ1YNz55dbyGoDX5tSWo',
      apiSecret: '6LdO8n8fAAAAADx7b0yuhsZypI2wF1QHEOvaBaql',
      controller: recaptchaV2Controller,
      onVerifiedError: widget.onVerifiedError,
      onVerifiedSuccessfully: (success) {
        setState(() {
          if (success) {
            widget.onVerifiedSuccessfully("You've been verified successfully.");
          } else {
            widget.onVerifiedError('Failed to verify.');
          }
        });
      },
    );
  }
}
