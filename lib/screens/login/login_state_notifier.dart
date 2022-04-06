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

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
    (_) => LoginStateNotifier());

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  GoogleSignInAccount? googleSignInAccount;
  UserDetail? userDetail;
  Map? userData;
  bool loginDone = false;
  User? currentUser;

  Future<void> signInWithGoogle() async {
    try {
      googleSignInAccount = await googleSignIn.signIn();
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      final authResult = await _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      assert(!(user?.isAnonymous ?? true));
      assert(await user?.getIdToken() != null);

      currentUser = _auth.currentUser;
      assert(user?.uid == currentUser?.uid);
      userDetail = UserDetail(
        displayName: user?.displayName,
        email: user?.email,
        photoUrl: user?.photoURL,
      );
      state = LoginState(userDetail: userDetail);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    final result = await FacebookAuth.i.login(
      permissions: ['public_profile', 'email'],
    );

    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: 'email, name, picture',
      );
      userData = requestData;
      final newUser = UserDetail(
        displayName: requestData['name'],
        email: requestData['email'],
        photoUrl: requestData['picture']['data']['url'],
      );
      state = state.copyWith(userDetail: newUser);
    } else {
      log(result.status.name);
    }

    if (result.accessToken == null) {
      return;
    }
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  String sha256ofString(String input) {
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

      final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: nonce
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.userIdentifier,
        rawNonce: rawNonce,
      );

      await FirebaseAuth.instance.signInWithCredential(
          oauthCredential);
    } catch (e) {
      log('$e');
    }
  }

  Future<String> onSignUp(
    String emailControllerText,
    String passwordControllerText,
  ) async {
    state = state.copyWith(showLoadingIndicator: true);
    try {
      final _auth = FirebaseAuth.instance;
      final result = await _auth.createUserWithEmailAndPassword(
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
      state = LoginState(userDetail: userDetail);
      state = state.copyWith(showLoadingIndicator: false);
      return '';
    } catch (e) {
      log('$e');
      state = state.copyWith(showLoadingIndicator: false);
      return e.toString().split(']').last;
    }
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
      state = LoginState(userDetail: userDetail);
      state = state.copyWith(showLoadingIndicator: false);
      return '';
    } catch (e) {
      log('$e');
      state = state.copyWith(showLoadingIndicator: false);
      return e.toString().split(']').last;
    }
  }

  void onTextFieldChange(
      String emailControllerText, String passwordControllerText) {
    if (emailControllerText.isEmpty || passwordControllerText.isEmpty) {
      if (mounted) {
        state = state.copyWith(
          isSignUp: false,
        );
      }
      return;
    }
    if (mounted) {
      state = state.copyWith(
        isSignUp: true,
      );
    }
  }

  Future<void> logOut() async {
    googleSignInAccount = await googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userData = null;
    state = state.copyWith(userDetail: null);
  }
}
