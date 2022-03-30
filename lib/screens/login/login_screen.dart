import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';

import '../../utils/utils.dart';

class LoginScreen extends HookConsumerWidget with Utils {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _fontSize = 15;
    double _paddingText = 15;
    double _sizeWith = 0.66;
    return Scaffold(
      backgroundColor: ColorApp.green0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              boldText(Constants.medium),
              boldText(Constants.smartStoriesForCuriousPeople),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: normalText(
                      Constants.getStartedByCreatingYourAccount,
                      textColor: ColorApp.black0,
                      fonSize: _fontSize,
                      vertical: _paddingText,
                    ),
                  ),
                  loginBtn(
                    context,
                    urlSvg: Asset.googleLogo,
                    txtLogin: Constants.signUpWithGoogle,
                    onTap: () {
                      _signInWithGoogle(context, ref);
                    },
                    sizeWith: _sizeWith,
                  ),
                  loginBtn(
                    context,
                    urlSvg: Asset.fbLogo,
                    txtLogin: Constants.signUpWithFacebook,
                    onTap: () {
                      _signInWithFacebook(context, ref);
                    },
                    sizeWith: _sizeWith,
                  ),
                  loginBtn(
                    context,
                    urlSvg: Asset.gmailLogo,
                    txtLogin: Constants.signUpWithGmail,
                    onTap: () {},
                    sizeWith: _sizeWith,
                  ),
                  Platform.isIOS
                      ? loginBtn(
                          context,
                          urlSvg: Asset.appleLogo,
                          txtLogin: Constants.signUpWithApple,
                          onTap: () {},
                          sizeWith: _sizeWith,
                        )
                      : const SizedBox(),
                  Stack(
                    children: [
                      const Divider(
                        color: Colors.black,
                        thickness: 3,
                        height: 25,
                        indent: 120,
                        endIndent: 120,
                      ),
                      Center(
                        child: Container(
                          width: 40,
                          height: 25,
                          color: ColorApp.green0,
                        ),
                      ),
                      const Center(
                          child: Text(
                        Constants.or,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      )),
                    ],
                  ),
                  loginBtn(
                    context,
                    urlSvg: Asset.qrLogo,
                    txtLogin: Constants.qrScanner,
                    onTap: () {},
                    sizeWith: 0.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normalText(
                        Constants.alreadyHaveAnAccount,
                        textColor: ColorApp.black0,
                        fonSize: _fontSize,
                        vertical: _paddingText,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: normalText(
                          Constants.signIn,
                          textColor: ColorApp.red0,
                          fonSize: _fontSize,
                          vertical: _paddingText,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  normalText(
                    Constants.byCreatingAnAccountAcceptMedium,
                    textColor: ColorApp.black0,
                    fonSize: 14,
                    vertical: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      Constants.termsOfService,
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget boldText(String boldText) {
    return Text(
      boldText,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 36,
      ),
    );
  }

  Widget normalText(String normalText,
      {required Color textColor,
      required double fonSize,
      required double vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: Text(
        normalText,
        style: TextStyle(
          color: textColor,
          fontSize: fonSize,
        ),
      ),
    );
  }

  Widget loginBtn(
    BuildContext context, {
    required double sizeWith,
    required String urlSvg,
    required String txtLogin,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              urlSvg,
              height: 25,
              width: 25,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(txtLogin,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithGoogle();
    final userState = ref.watch(loginProvider);
    if (userState.userDetail?.displayName == null) {
      snackBar(context, Constants.loginFailed, Colors.red);
    } else {
      snackBar(context, Constants.loginSuccessful, Colors.green);
      await pushReplacement(context, const HomeScreen(title: Constants.base));
    }
  }

  Future<void> _signInWithFacebook(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithFacebook();
    final userState = ref.watch(loginProvider);
    if (userState.userDetail?.displayName == null) {
      snackBar(context, Constants.loginFailed, Colors.red);
    } else {
      snackBar(context, Constants.loginSuccessful, Colors.green);
      await pushReplacement(context, const HomeScreen(title: Constants.base));
    }
  }
}
