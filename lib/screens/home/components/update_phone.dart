import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/common_view/common_empty_indicator.dart';
import 'package:provider_base/common/common_view/text_field_login.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_state_notifier.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class UpdatePhone extends HookConsumerWidget with Utils {
  const UpdatePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final codeController = useTextEditingController();

    final state = ref.watch(homeProvider);
    final loginStateNotifier = ref.watch(loginProvider.notifier);
    final stateNotifier = ref.read(homeProvider.notifier);

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
                      Constants.updatePhoneNumber,
                      style: AppStyles.textMedium.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFieldLogin(
                    controller: phoneController,
                    labelText: Constants.phone,
                    suffixIcon: _suffixIcon(
                      onGetCode: () async {
                        final message = await stateNotifier.onGetCode(
                          phoneController.text,
                          loginStateNotifier.currentUser,
                        );
                        snackBar(context, message, AppStyles.errorColor);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFieldLogin(
                    controller: codeController,
                    labelText: Constants.code,
                  ),
                  const SizedBox(height: 80),
                  ButtonUpload(
                    label: Constants.signInUp,
                    onTap: () async {
                      unFocusScope(context);
                      final message = await stateNotifier.codeSent(
                        currentUser: loginStateNotifier.currentUser,
                        smsCode: codeController.text,
                      );
                      if (message == Constants.updatePhoneNumberSuccessful) {
                      //  Navigator.of(context).pop();
                        popWithoutContext();
                      }
                    },
                    colorButton:
                        state.updatePhone ? AppColors.green : AppColors.grey6,
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

  Widget _suffixIcon({required void Function() onGetCode}) {
    return GestureDetector(
      onTap: onGetCode,
      child: Container(
        alignment: Alignment.center,
        width: 80,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.blackCard)),
        child: Text(
          Constants.getCode,
          style: AppStyles.textBold,
        ),
      ),
    );
  }
}
