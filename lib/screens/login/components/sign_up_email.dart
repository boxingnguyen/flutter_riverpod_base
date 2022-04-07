import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/common_view/common_empty_indicator.dart';
import 'package:provider_base/common/common_view/text_field_login.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class SignUpEmail extends HookConsumerWidget with Utils {
  const SignUpEmail({
    Key? key,
  }) : super(key: key);

  // TODO(tupa1): fix design, use validator of textfield
  // password secure
  // add privacy, & term of service
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final state = ref.watch(loginProvider);
    final stateNotifier = ref.read(loginProvider.notifier);

    return Stack(
      children: [
        GestureDetector(
          onTap: () => unFocusScope(context),
          child: Scaffold(
            backgroundColor: ColorApp.green0,
            appBar: AppBar(
              backgroundColor: ColorApp.green0,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      Constants.signUpWithEmail,
                      style: AppStyles.textMedium.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFieldLogin(
                    controller: emailController,
                    labelText: Constants.email,
                    onTextFieldChange: (text) =>
                        stateNotifier.onTextFieldChange(
                      emailController.text,
                      passwordController.text,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFieldLogin(
                    controller: passwordController,
                    labelText: Constants.password,
                    onTextFieldChange: (text) =>
                        stateNotifier.onTextFieldChange(
                      emailController.text,
                      passwordController.text,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonUpload(
                    label: Constants.signUp,
                    onTap: () async {
                      unFocusScope(context);
                      final isSignUp = await stateNotifier.onSignUp(
                        emailController.text,
                        passwordController.text,
                      );
                      if (isSignUp.isNotEmpty) {
                        snackBar(context, isSignUp, AppStyles.errorColor);
                        return;
                      }
                      snackBar(
                          context, Constants.loginSuccessful, Colors.green);
                      await pushReplacement(
                          context, const HomeScreen(title: Constants.base));
                    },
                    colorButton:
                        state.isSignUp ? AppColors.green : AppColors.grey6,
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
}
