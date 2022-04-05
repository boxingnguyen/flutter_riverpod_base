import 'dart:developer' as dev;
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
    (_) => HomeStateNotifier());

class HomeStateNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeStateNotifier() : super(HomeState());

  void increment() {
    var counter = state.counter;
    state = state.copyWith(counter: ++counter);
    dev.log('counter change: $counter');
  }

  void getRandom() {
    final random = Random().nextInt(100);
    state = state.copyWith(random: random);
  }

  Future<void> onGetCode(String phoneNumber, User? currentUser) async {
    if (currentUser == null) {
      return;
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(minutes: 1),
        verificationCompleted: (phoneCredential) async {
          await currentUser.updatePhoneNumber(phoneCredential);
          // either this occurs or the user needs to manually enter the SMS code
        },
        verificationFailed: (e) {},
        codeSent: (verificationId, [forceResendingToken]) async {
          String smsCode = '';
          // get the SMS code from the user somehow (probably using a text field)
          final AuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          // await (await FirebaseAuth.instance.currentUser())
          //     .updatePhoneNumberCredential(credential);
        },
        codeAutoRetrievalTimeout: (e) {});
  }
}
