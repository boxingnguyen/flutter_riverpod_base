import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_login.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/components/sign_in_email.dart';
import 'package:provider_base/screens/login/components/sign_up_email.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class LoginScreen extends HookConsumerWidget with Utils {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';
  /* TODO(:tupa1) Refactor code
    - change branch to rs/feat/social_media_authourize
    - name variable correctly 
    - use underscore if function is private
    - format code
    - fix bug sigin flutter with facebook
    - merge sigin in apple
    - add sign up screen
  */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorApp.green0,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
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
              const SizedBox(height: 10),
              ButtonLogin(
                urlSvg: Asset.googleLogo,
                message: Constants.signUpWithGoogle,
                onTap: () {
                  _signInWithGoogle(context, ref);
                },
              ),
              ButtonLogin(
                urlSvg: Asset.fbLogo,
                message: Constants.signUpWithFacebook,
                onTap: () {
                  _signInWithFacebook(context, ref);
                },
              ),
              ButtonLogin(
                urlSvg: Asset.gmailLogo,
                message: Constants.signUpWithEmail,
                onTap: () => push(context, const SignUpEmail()),
              ),
              Platform.isIOS
                  ? ButtonLogin(
                      urlSvg: Asset.appleLogo,
                      message: Constants.signUpWithApple,
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
                    onTap: () => push(context, const SignInEmail()),
                    child: Text(
                      Constants.signIn,
                      style: AppStyles.textMedium.copyWith(
                        color: ColorApp.red0,
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
                onTap: () {},
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

  Future<void> _signInWithGoogle(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithGoogle();
    final userState = ref.watch(loginProvider);

    if (userState.userDetail?.displayName == null) {
      snackBar(context, Constants.loginFailed, Colors.red);
      return;
    }
    snackBar(context, Constants.loginSuccessful, Colors.green);
    await pushReplacement(context, const HomeScreen(title: Constants.base));
  }

  Future<void> _signInWithFacebook(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithFacebook();
    final userState = ref.watch(loginProvider);

    if (userState.userDetail?.displayName == null) {
      snackBar(context, Constants.loginFailed, Colors.red);
      return;
    }
    snackBar(context, Constants.loginSuccessful, Colors.green);
    await pushReplacement(context, const HomeScreen(title: Constants.base));
  }

  Future<void> _signInWithApple(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithApple();
    final userState = ref.watch(loginProvider);

    if (userState.userDetail?.displayName == null) {
      snackBar(context, Constants.loginFailed, Colors.red);
      return;
    }
    snackBar(context, Constants.loginSuccessful, Colors.green);
    await pushReplacement(context, const HomeScreen(title: Constants.base));
  }
}
