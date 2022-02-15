import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../models/user/user_detail.dart';
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

  Future<void> signInWithGoogle() async {
    googleSignInAccount = await googleSignIn.signIn();
    userDetail = UserDetail(
      displayName: googleSignInAccount?.displayName,
      email: googleSignInAccount?.email,
      photoUrl: googleSignInAccount?.photoUrl,
    );
    if(userDetail != null) {
      state = LoginState(userDetail: userDetail);
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
        email: requestData["email"],
        photoUrl: requestData['picture']['data']['url'],
      );
      state = state.copyWith(userDetail: newUser);
    }
  }

  Future<void> logOut() async {
    googleSignInAccount = await googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userData = null;
    state = state.copyWith(userDetail: null);
  }
}
