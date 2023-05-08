import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_base/screens/form_and_dialog/form_state.dart';

final formNotifierProvider =
    StateNotifierProvider<FormStateNotifier, FormState>((ref) {
  return FormStateNotifier();
});

class FormStateNotifier extends StateNotifier<FormState> {
  FormStateNotifier() : super(FormState());

  void showPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}
