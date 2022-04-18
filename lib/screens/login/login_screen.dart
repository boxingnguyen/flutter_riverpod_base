import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_login.dart';
import 'package:provider_base/common/common_view/simple_web_view.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/components/account_created_screen.dart';
import 'package:provider_base/screens/login/components/sign_in_email.dart';
import 'package:provider_base/screens/login/components/sign_up_email.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/screens/update_password/update_password_screen.dart';
import 'package:provider_base/utils/utils.dart';

class LoginScreen extends HookConsumerWidget with Utils {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignUp = ref.watch(loginProvider).isSignUp;

    return Scaffold(
      backgroundColor: ColorApp.green0,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 35),
              Text(
                Constants.medium,
                style: AppStyles.textBold.copyWith(
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                Constants.flutterBSD,
                style: AppStyles.textBold.copyWith(fontSize: 18),
              ),
              const Spacer(),
              ButtonLogin(
                urlSvg: Asset.googleLogo,
                message: isSignUp
                    ? Constants.signUpWithGoogle
                    : Constants.signInWithGoogle,
                onTap: () =>
                    _signInWithGoogle(context, ref, isSignUp: isSignUp),
              ),
              ButtonLogin(
                urlSvg: Asset.fbLogo,
                message: isSignUp
                    ? Constants.signUpWithFacebook
                    : Constants.signInWithFacebook,
                onTap: () =>
                    _signUpWithFacebook(context, ref, isSignUp: isSignUp),
              ),
              ButtonLogin(
                urlSvg: Asset.gmailLogo,
                message: isSignUp
                    ? Constants.signUpWithEmail
                    : Constants.signInWithEmail,
                onTap: isSignUp
                    ? () => push(context, const SignUpEmail())
                    : () => push(context, const SignInEmail()),
              ),
              Platform.isIOS
                  ? ButtonLogin(
                      urlSvg: Asset.appleLogo,
                      message: isSignUp
                          ? Constants.signUpWithApple
                          : Constants.signInWithApple,
                      onTap: () => _signInWithApple(context, ref),
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Constants.alreadyHaveAnAccount,
                    style: AppStyles.textMedium,
                  ),
                  GestureDetector(
                    onTap: ref.read(loginProvider.notifier).changeToSign,
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        isSignUp ? Constants.signUp : Constants.signIn,
                        style: AppStyles.textMedium.copyWith(
                          color: ColorApp.red0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                Constants.byCreatingAnAccountAcceptMedium,
                style: AppStyles.textMedium,
              ),
              GestureDetector(
                onTap: () => push(context, const TermOfService()),
                child: const Text(
                  Constants.termsOfService,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(
    BuildContext context,
    WidgetRef ref, {
    bool isSignUp = false,
  }) async {
    final loginStatus =
        await ref.read(loginProvider.notifier).signInWithGoogle(isSignUp);
    final isNewUser = ref.read(loginProvider.notifier).isNewUser;

    switch (loginStatus) {
      case LoginGoogleStatus.failed:
        snackBar(context, Constants.loginFailed, Colors.red);
        break;
      case LoginGoogleStatus.cancel:
        break;
      case LoginGoogleStatus.success:
        _loginSuccess(context, isSignUp, isNewUser);
        break;
      default:
    }
  }

  // email đã được tạo từ provider khác thì sẽ không login được bằng facebook

  Future<void> _signUpWithFacebook(
    BuildContext context,
    WidgetRef ref, {
    bool isSignUp = false,
  }) async {
    final loginStatus =
        await ref.read(loginProvider.notifier).signUpWithFacebook(isSignUp);
    final isNewUser = ref.read(loginProvider.notifier).isNewUser;
    final errorLogin = ref.read(loginProvider.notifier).errorLogin;

    if ((errorLogin) != null) {
      snackBar(context, errorLogin, Colors.red);
      return;
    }

    switch (loginStatus) {
      case LoginStatus.failed:
        snackBar(context, Constants.loginFailed, Colors.red);
        break;
      case LoginStatus.cancelled:
        break;
      case LoginStatus.success:
        _loginSuccess(context, isSignUp, isNewUser);
        break;
      default:
    }
  }

  Future<void> _loginSuccess(
      BuildContext context, bool isSignUp, bool isNewUser) async {
    if (isSignUp) {
      if (!isNewUser) {
        await push(context, const AccountCreatedScreen());
        return;
      }
      await pushReplacement(context, const UpdatePasswordScreen());
      return;
    }

    if (!isNewUser) {
      await push(context, const HomeScreen());
      return;
    }
    await pushReplacement(context, const UpdatePasswordScreen());
    return;
  }

  Future<void> _signInWithApple(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithApple();
    final userState = ref.watch(loginProvider);

    if (userState.userDetail?.displayName == null) {
      snackBar(context, Constants.loginFailed, Colors.red);
      return;
    }
    snackBar(context, Constants.loginSuccessful, Colors.green);
    await pushReplacement(context, const HomeScreen());
  }
}

class TermOfService extends StatelessWidget {
  const TermOfService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const SimpleWebView(
          url: 'https://translate.google.com/',
        ));
  }
}
