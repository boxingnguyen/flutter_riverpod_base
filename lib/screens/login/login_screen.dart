import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';

import '../../utils/utils.dart';

class LoginScreen extends HookConsumerWidget with Utils {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _fontSize = 15;
    double _paddingText = 15;
    double _sizeWith = 0.66;
    return Scaffold(
      backgroundColor: const Color(0xFFAFCEB3),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              boldText('Medium'),
              boldText('Smart stories for \n curious people.'),
              Column(
                children: [
                  normalText(
                    'Get started by creating your account',
                    textColor: const Color(0xFF000000),
                    fonSize: _fontSize,
                    padding: _paddingText,
                  ),
                  loginBtn(
                    context,
                    urlSvg: 'assets/svg/google_logo.svg',
                    txtLogin: 'Sign up with Google',
                    onTap: () {
                      _signInWithGoogle(context, ref);
                    },
                    sizeWith: _sizeWith,
                  ),
                  loginBtn(
                    context,
                    urlSvg: 'assets/svg/fb_logo.svg',
                    txtLogin: 'Sign up with Facebook',
                    onTap: () {
                      _signInWithFacebook(context, ref);
                    },
                    sizeWith: _sizeWith,
                  ),
                  loginBtn(
                    context,
                    urlSvg: 'assets/svg/gmail_logo.svg',
                    txtLogin: 'Sign up with Gmail',
                    onTap: () {},
                    sizeWith: _sizeWith,
                  ),
                  Platform.isIOS
                      ? loginBtn(
                          context,
                          urlSvg: 'assets/svg/apple_logo.svg',
                          txtLogin: 'Sign up with Apple',
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
                          color: const Color(0xFFAFCEB3),
                        ),
                      ),
                      const Center(
                          child: Text(
                        'Or',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      )),


                    ],
                  ),
                  loginBtn(
                    context,
                    urlSvg: 'assets/svg/qr_code.svg',
                    txtLogin: 'QR Scanner',
                    onTap: () {},
                    sizeWith: 0.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      normalText(
                        'Already have an account? ',
                        textColor: const Color(0xFF000000),
                        fonSize: _fontSize,
                        padding: _paddingText,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: normalText(
                          'Sign in.',
                          textColor: const Color.fromARGB(255, 255, 0, 0),
                          fonSize: _fontSize,
                          padding: _paddingText,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  normalText(
                    'By creating an account. I accept Medium\'s',
                    textColor: const Color(0xFF000000),
                    fonSize: 14,
                    padding: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Terms of Service',
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
      style: GoogleFonts.robotoSlab(
        fontWeight: FontWeight.w500,
        fontSize: 36,
      ),
    );
  }

  Widget normalText(String normalText,
      {required Color textColor,
      required double fonSize,
      required double padding}) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding, top: padding),
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
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 40,
        width: size.width * sizeWith,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        urlSvg,
                        height: 25,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(txtLogin,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithGoogle();
    final userState = ref.watch(loginProvider);
    if (userState.userDetail?.displayName == null) {
      snackBar(context, 'Login Failed', Colors.red);
    } else {
      snackBar(context, 'Login Successful', Colors.green);
      await pushReplacement(context, const HomeScreen(title: 'Base'));
    }
  }

  Future<void> _signInWithFacebook(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithFacebook();
    final userState = ref.watch(loginProvider);
    if (userState.userDetail?.displayName == null) {
      snackBar(context, 'Login Failed', Colors.red);
    } else {
      snackBar(context, 'Login Successful', Colors.green);
      await pushReplacement(context, const HomeScreen(title: 'Base'));
    }
  }
}
