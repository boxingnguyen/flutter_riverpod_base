import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';

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
            customBtn(
                label: 'Login with Google',
                iconColor: const Color(0xFFf44336),
                iconData: FontAwesomeIcons.google,
                onTap: () {
                  _signInWithGoogle(context, ref);
                }),
            customBtn(
                label: 'Login with Facebook',
                iconColor: const Color(0xFF2986cc),
                iconData: FontAwesomeIcons.facebook,
                onTap: () {
                  _signInWithFacebook();
                }),
          ],
        ),
      ),
    );
  }

  _signInWithGoogle(BuildContext context, WidgetRef ref) async{
    final userState = ref.watch(loginProvider);
    await ref.read(loginProvider.notifier).signInWithGoogle();
    if(userState.loginStatus == true) {
      snackBar(context, 'Login Succesfully', Colors.green);
      await pushReplacement(context, const HomeScreen(title: 'Base'));
    } else {
      snackBar(context, 'Login Failed', Colors.red);
    }
  }

  Future<void> _signInWithFacebook() async {}
}
