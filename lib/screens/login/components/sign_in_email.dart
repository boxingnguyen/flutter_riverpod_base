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

// TODO(tupa1):
// - fix name
// - add forgot password -> screen forgot pass input email
// - if input password wrong > 5 times, show capcha
class SignInEmail extends HookConsumerWidget with Utils {
  const SignInEmail({Key? key}) : super(key: key);

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
                      Constants.signInWithEmail,
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
                    label: Constants.signInUp,
                    onTap: () async {
                      unFocusScope(context);
                      final isSignUp = await stateNotifier.onSignIn(
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
                        state.isSignUp ? AppStyles.green : AppStyles.grey6,
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
