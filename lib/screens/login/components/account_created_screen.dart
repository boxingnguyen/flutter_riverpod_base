import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/utils/utils.dart';

class AccountCreatedScreen extends HookConsumerWidget with Utils {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The email address is already in use by another account.',
              style: AppStyles.textMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 150,
              child: ButtonUpload(
                  label: 'Sign In',
                  onTap: () => push(context, const HomeScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
