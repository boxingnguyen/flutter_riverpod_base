import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/models/user/user_detail.dart';
import 'package:provider_base/screens/sign_in_email/sign_in_email_state.dart';

final signInEmailProvider =
    StateNotifierProvider<SignInEmailStateNotifier, SignInEmailState>(
        (_) => SignInEmailStateNotifier());

class SignInEmailStateNotifier extends StateNotifier<SignInEmailState> {
  SignInEmailStateNotifier() : super(SignInEmailState());

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  UserDetail? userDetail;
  User? currentUser;

  void onTextFieldChange(
      String emailControllerText, String passwordControllerText) {
    if (emailControllerText.isEmpty ||
        passwordControllerText.isEmpty ||
        state.isCaptcha) {
      if (mounted) {
        state = state.copyWith(isEmptyInput: false);
      }
      return;
    }

    if (mounted) {
      state = state.copyWith(isEmptyInput: true);
    }
  }

  void isShowPassword() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }

  void onCaptchaSuccess() {
    state = state.copyWith(isCaptcha: false);
  }

  Future<String> onSignIn(
    String emailControllerText,
    String passwordControllerText,
  ) async {
    state = state.copyWith(showLoadingIndicator: true);
    try {
      final _auth = FirebaseAuth.instance;
      final result = await _auth.signInWithEmailAndPassword(
        email: emailControllerText,
        password: passwordControllerText,
      );

      final user = result.user;
      assert(!(user?.isAnonymous ?? true));
      assert(await user?.getIdToken() != null);

      currentUser = _auth.currentUser;
      assert(user?.uid == currentUser?.uid);
      userDetail = UserDetail(
        displayName: user?.displayName,
        email: user?.email,
        photoUrl: user?.photoURL,
      );
      state = state.copyWith(
        userDetail: userDetail,
        showLoadingIndicator: false,
      );
      return '';
    } catch (e) {
      log('$e');
      state = state.copyWith(
        showLoadingIndicator: false,
        numberShowCaptcha: state.numberShowCaptcha + 1,
      );
      if (state.numberShowCaptcha >= 5) {
        state = state.copyWith(isCaptcha: true);
      }
      return e.toString().split('] ').last;
    }
  }
}
