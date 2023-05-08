import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/common_view/common_empty_indicator.dart';
import 'package:provider_base/common/common_view/text_field_login.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class ForgotPasswordScreen extends HookConsumerWidget with Utils {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();

    final state = ref.watch(loginProvider);

    return Stack(
      children: [
        GestureDetector(
          onTap: () => unFocusScope(context),
          child: Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      Constants.emailToFindYourPassword,
                      style: AppStyles.textMedium.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFieldLogin(
                    controller: emailController,
                    labelText: Constants.email,
                  ),
                  const SizedBox(height: 100),
                  ButtonUpload(
                    label: Constants.findPassword,
                    onTap: () => _onFindPassword(
                      context: context,
                      email: emailController.text,
                      ref: ref,
                    ),
                    colorButton: AppStyles.green,
                  )
                ],
              ),
            ),
          ),
        ),
        state.showLoadingIndicator
            ? const CommonEmptyIndicator()
            : const SizedBox(),
      ],
    );
  }

  void _onFindPassword({
    required BuildContext context,
    required String email,
    required WidgetRef ref,
  }) {
    ref.read(loginProvider.notifier).forgotPassword(email).then((statusFind) {
      if (statusFind.isNotEmpty) {
        snackBar(context, statusFind, Colors.red);
        return;
      }

      Navigator.of(context).pop();
      snackBar(context, Constants.findPasswordSuccess, Colors.green);
    });
  }
}
