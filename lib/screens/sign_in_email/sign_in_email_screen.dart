import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/common_view/captcha_screen.dart';
import 'package:provider_base/common/common_view/common_empty_indicator.dart';
import 'package:provider_base/common/common_view/common_text_field.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/components/forgot_password_screen.dart';
import 'package:provider_base/screens/sign_in_email/sign_in_email_state.dart';
import 'package:provider_base/screens/sign_in_email/sign_in_email_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';
import 'package:provider_base/utils/validate.dart';

class SignInEmailScreen extends HookConsumerWidget {
  const SignInEmailScreen({Key? key, this.formKey}) : super(key: key);
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    return _Body(
      formKey: _formKey,
    );
  }
}

class _Body extends HookConsumerWidget with Utils {
  const _Body({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final state = ref.watch(signInEmailProvider);
    final stateNotifier = ref.read(signInEmailProvider.notifier);

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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormFieldCustom(
                          controller: emailController,
                          hintText: Constants.email,
                          validator: Validate.emailValidator,
                          onChanged: (text) => stateNotifier.onTextFieldChange(
                            emailController.text,
                            passwordController.text,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormFieldCustom(
                          controller: passwordController,
                          obscureText: !state.isShowPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: stateNotifier.isShowPassword,
                          ),
                          onChanged: (text) => stateNotifier.onTextFieldChange(
                            emailController.text,
                            passwordController.text,
                          ),
                          hintText: Constants.password,
                          validator: Validate.passwordValidator,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => push(context, const ForgotPasswordScreen()),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      color: Colors.transparent,
                      child: Text(
                        Constants.forgotPassword,
                        style: AppStyles.textMedium.copyWith(
                          color: ColorApp.black0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  state.isCaptcha
                      ? CaptchaScreen(
                          onVerifiedError: (error) =>
                              snackBar(context, error, AppStyles.errorColor),
                          onVerifiedSuccessfully: (success) {
                            snackBar(context, success, Colors.green);
                            stateNotifier.onCaptchaSuccess();
                          },
                        )
                      : const SizedBox(),
                  SizedBox(height: state.isCaptcha ? 20 : 0),
                  ButtonUpload(
                    label: Constants.signInUp,
                    onTap: () => _onSignIn(
                      context: context,
                      passwordController: passwordController,
                      emailController: emailController,
                      state: state,
                      stateNotifier: stateNotifier,
                    ),
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

  Future<void> _onSignIn({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required SignInEmailState state,
    required SignInEmailStateNotifier stateNotifier,
  }) async {
    unFocusScope(context);
    final validate = formKey.currentState?.validate() ?? false;

    final isSignUp = await stateNotifier.onSignIn(
      emailController.text,
      passwordController.text,
    );

    if (state.isCaptcha || !validate) {
      return;
    }

    if (isSignUp.isNotEmpty) {
      snackBar(context, isSignUp, AppStyles.errorColor);
      return;
    }
    snackBar(context, Constants.loginSuccessful, Colors.green);
    await pushReplacement(context, const HomeScreen());
  }
}
