import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/button_upload.dart';
import 'package:provider_base/common/common_view/common_empty_indicator.dart';
import 'package:provider_base/common/common_view/common_text_field.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';
import 'package:provider_base/screens/update_password/update_password_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';
import 'package:provider_base/utils/validate.dart';

class UpdatePasswordScreen extends HookConsumerWidget with Utils {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Body(formKey: _formKey),
    );
  }
}

class Body extends HookConsumerWidget with Utils {
  const Body({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStateNotifier = ref.read(loginProvider.notifier);
    final updatePasswordState = ref.watch(updatePasswordProvider);
    final updatePasswordStateNotifier =
        ref.read(updatePasswordProvider.notifier);
    final passwordController = useTextEditingController();
    final rePasswordController = useTextEditingController();

    return Stack(
      children: [
        GestureDetector(
          onTap: () => unFocusScope(context),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.horizontalSpace),
            child: Column(
              children: [
                Center(
                  child: Text(
                    Constants.updatePasswordForYourAccount,
                    style: AppStyles.textBold.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormFieldCustom(
                          controller: passwordController,
                          obscureText: !updatePasswordState.isShowPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              updatePasswordState.isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed:
                                updatePasswordStateNotifier.isShowPassword,
                          ),
                          hintText: Constants.password,
                          validator: Validate.passwordValidator,
                        ),
                        const SizedBox(height: 10),
                        TextFormFieldCustom(
                          controller: rePasswordController,
                          obscureText: !updatePasswordState.isShowRePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              updatePasswordState.isShowRePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed:
                                updatePasswordStateNotifier.isShowRePassword,
                          ),
                          hintText: Constants.rePassword,
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                updatePasswordState.isSuccess
                    ? const SizedBox()
                    : Text(
                        Constants.reEnterPassword,
                        style: AppStyles.textMedium.copyWith(
                          color: AppStyles.errorColor,
                        ),
                      ),
                const SizedBox(height: 20),
                ButtonUpload(
                  label: Constants.updatePassword,
                  onTap: () => _onUpdatePassword(
                    context,
                    updatePasswordStateNotifier: updatePasswordStateNotifier,
                    loginStateNotifier: loginStateNotifier,
                    passwordController: passwordController,
                    rePasswordController: rePasswordController,
                  ),
                  colorButton: AppStyles.primaryColor,
                )
              ],
            ),
          ),
        ),
        updatePasswordState.showLoadingIndicator
            ? const CommonEmptyIndicator()
            : const SizedBox(),
      ],
    );
  }

  Future<void> _onUpdatePassword(
    BuildContext context, {
    required UpdatePasswordStateNotifier updatePasswordStateNotifier,
    required LoginStateNotifier loginStateNotifier,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
  }) async {
    final validate = formKey.currentState?.validate() ?? false;
    final isSuccess = await updatePasswordStateNotifier.onSuccess(
      passwordController.text,
      rePasswordController.text,
    );

    if (validate && isSuccess) {
      final updateStatus =
          await updatePasswordStateNotifier.updatePasswordForAccount(
        passwordController.text,
        loginStateNotifier.currentUser,
      );

      if (!updateStatus) {
        snackBar(
          context,
          Constants.reLoginToUpdate,
          AppStyles.primaryColor,
        );
        return;
      }
      push(context, const HomeScreen());
      snackBar(
        context,
        Constants.updatePasswordSuccess,
        AppStyles.primaryColor,
      );
    }
    updatePasswordStateNotifier.hideLoading();
  }
}
