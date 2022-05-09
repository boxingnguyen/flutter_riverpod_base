import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/models/user/user_detail.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'login_state.dart';

enum LoginGoogleStatus {
  success,
  cancel,
  created,
  failed,
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>(
        (_) => LoginStateNotifier());

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  // TODO(tupa1) add Google Analytics when catch exeption
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  UserDetail? userDetail;
  Map? userData;
  bool loginDone = false;
  User? currentUser;
  bool isNewUser = false;
  String? errorLogin;

  Future<LoginGoogleStatus> signInWithGoogle(bool isSignUp) async {
    final googleSignInAccount = await googleSignIn.signIn();
    final _auth = FirebaseAuth.instance;
    final googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    if (googleSignInAuthentication?.accessToken == null ||
        googleSignInAuthentication?.idToken == null) {
      return LoginGoogleStatus.cancel;
    }
    final authResult = await _auth.signInWithCredential(credential);
    isNewUser = authResult.additionalUserInfo?.isNewUser ?? false;
    currentUser = authResult.user;
    final userDetail = UserDetail(
      displayName: currentUser?.displayName,
      email: currentUser?.email,
      photoUrl: currentUser?.photoURL,
    );
    state = state.copyWith(userDetail: userDetail);

    if (currentUser == null) {
      return LoginGoogleStatus.failed;
    }
    return LoginGoogleStatus.success;
  }

  Future<LoginStatus> signUpWithFacebook(bool isSignUp) async {
    final result = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email'],
    );
    try {
      if (result.status == LoginStatus.success) {
        final accessToken = await FacebookAuth.instance.accessToken;
        if (accessToken == null) {
          return LoginStatus.failed;
        }
        final facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);
        final loginValue = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        currentUser = loginValue.user;
        isNewUser = loginValue.additionalUserInfo?.isNewUser ?? false;
        errorLogin = null;
        final userDetail = UserDetail(
          displayName: currentUser?.displayName,
          email: currentUser?.email,
          photoUrl: currentUser?.photoURL,
        );
        state = state.copyWith(userDetail: userDetail);
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        errorLogin = e.message;
      }
      return result.status;
    }
    return result.status;
  }

  String sha256ofString(String input) {
    if (input.isEmpty) {
      return '';
    }
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String generateNonce() {
    final random = math.Random.secure();
    return List.generate(32,
            (_) => Constants.charset[random.nextInt(Constants.charset.length)])
        .join();
  }

  Future<void> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final appleCredential =
          await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ], nonce: nonce);

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.userIdentifier,
        rawNonce: rawNonce,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (e) {
      log('$e');
    }
  }

  Future<String> forgotPassword(String email) async {
    state = state.copyWith(showLoadingIndicator: true);
    try {
      final _auth = FirebaseAuth.instance;

      await _auth.sendPasswordResetEmail(email: email);
      state = state.copyWith(
        showLoadingIndicator: false,
      );
      return '';
    } catch (e) {
      log(e.toString());
      state = state.copyWith(showLoadingIndicator: false);
      return e.toString().split('] ').last;
    }
  }

  Future<void> logOut() async {
    await googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userData = null;
    state = state.copyWith(userDetail: null);
  }

  void changeToSign() {
    state = state.copyWith(isSignUp: !state.isSignUp);
  }
}
