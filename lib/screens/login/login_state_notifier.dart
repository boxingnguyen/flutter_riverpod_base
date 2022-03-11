import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider_base/models/user_model/user.dart';
import 'package:provider_base/screens/login/login_state.dart';

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
  final _auth = FirebaseAuth.instance;

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
      assert(!user!.isAnonymous);
      assert(await user?.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user?.uid == currentUser?.uid);
      userDetail = UserDetail(
        displayName: user?.displayName,
        email: user?.email,
        photoUrl: user?.photoURL,
      );
      state = LoginState(userDetail: userDetail);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithFacebook() async {
    final result = await FacebookAuth.i.login(
      permissions: ['public_profile', 'email'],
    );

    if (result.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.token,
      );
      final user = (await _auth.signInWithCredential(credential)).user;
      final newUser = UserDetail(
        displayName: user?.displayName ?? '',
        email: user?.email ?? '',
        photoUrl: user?.photoURL ?? '',
      );
      state = state.copyWith(userDetail: newUser);
    } else {
      print(result.status);
    }
  }

  Future<void> logOut() async {
    googleSignInAccount = await googleSignIn.signOut();
    await _auth.signOut();
    //await FacebookAuth.i.logOut();
    userData = null;
    state = state.copyWith(userDetail: null);
  }
}
