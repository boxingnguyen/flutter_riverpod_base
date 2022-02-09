import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';

import '../../common/common_view/common_button.dart';
import '../../utils/utils.dart';

class LoginScreen extends HookConsumerWidget with Utils {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton.customBtn(
                label: 'Login with Google',
                iconColor: const Color(0xFFf44336),
                iconData: FontAwesomeIcons.google,
                onTap: () {
                  _signInWithGoogle(context, ref);
                }),
            CommonButton.customBtn(
                label: 'Login with Facebook',
                iconColor: const Color(0xFF2986cc),
                iconData: FontAwesomeIcons.facebook,
                onTap: () {
                  _signInWithFacebook(context, ref);
                }),
          ],
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
      snackBar(context, 'Login Succesfully', Colors.green);
      await pushReplacement(context, const HomeScreen(title: 'Base'));
    }
  }

  Future<void> _signInWithFacebook(BuildContext context, WidgetRef ref) async {
    await ref.read(loginProvider.notifier).signInWithFacebook();
    final userState = ref.watch(loginProvider);
    if (userState.userDetail?.displayName == null) {
      snackBar(context, 'Login Failed', Colors.red);
    } else {
      snackBar(context, 'Login Succesfully', Colors.green);
      await pushReplacement(context, const HomeScreen(title: 'Base'));
    }
  }
}
