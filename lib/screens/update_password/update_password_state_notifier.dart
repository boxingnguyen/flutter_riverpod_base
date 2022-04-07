import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:provider_base/screens/update_password/update_password_state.dart';

final updatePasswordProvider =
    StateNotifierProvider<UpdatePasswordStateNotifier, UpdatePasswordState>(
        (_) => UpdatePasswordStateNotifier());

class UpdatePasswordStateNotifier extends StateNotifier<UpdatePasswordState>
    with LocatorMixin {
  UpdatePasswordStateNotifier() : super(UpdatePasswordState());

  void isShowPassword() {
    state = state.copyWith(isShowPassword: !state.isShowPassword);
  }

  void isShowRePassword() {
    state = state.copyWith(isShowRePassword: !state.isShowRePassword);
  }

  Future<bool> onSuccess(String pass1, String pass2) async {
    state = state.copyWith(showLoadingIndicator: true);
    if (pass1 != pass2) {
      state = state.copyWith(
        isSuccess: false,
        showLoadingIndicator: false,
      );
      return state.isSuccess;
    }
    state = state.copyWith(isSuccess: true);
    return state.isSuccess;
  }

  Future<bool> updatePasswordForAccount(
      String password, User? currentUser) async {
    if (currentUser == null) {
      state = state.copyWith(showLoadingIndicator: false);
      return false;
    }
    currentUser.updatePassword(password);
    state = state.copyWith(showLoadingIndicator: false);
    return true;
  }
}
