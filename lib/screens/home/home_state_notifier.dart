import 'dart:developer' as dev;
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
    (_) => HomeStateNotifier());

class HomeStateNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeStateNotifier() : super(HomeState());

  String currentVerificationId = '';

  void increment() {
    var counter = state.counter;
    state = state.copyWith(counter: ++counter);
    dev.log('counter change: $counter');
  }

  void getRandom() {
    final random = Random().nextInt(100);
    state = state.copyWith(random: random);
  }

  Future<String> onGetCode(String phoneNumber, User? currentUser) async {
    String failed = '';

    if (currentUser == null) {
      return failed;
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(minutes: 1),
        verificationCompleted: (phoneCredential) async {
          await currentUser.updatePhoneNumber(phoneCredential);
          // either this occurs or the user needs to manually enter the SMS code
        },
        verificationFailed: (e) {
          failed = e.message ?? '';
        },
        codeSent: (verificationId, [forceResendingToken]) {
          currentVerificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (e) {
          failed = e;
        });
    return failed;
  }

  Future<String> codeSent({
    required User? currentUser,
    required String smsCode,
    int? forceResendingToken,
  }) async {
    if (currentUser == null) {
      return Constants.updatePhoneNumberFailed;
    }
    // get the SMS code from the user somehow (probably using a text field)
    final phoneCredential = PhoneAuthProvider.credential(
        verificationId: currentVerificationId, smsCode: smsCode);
    print(phoneCredential.providerId);
    print(phoneCredential.signInMethod);
    print(phoneCredential.token);
    print(phoneCredential.hashCode);
    await currentUser.updatePhoneNumber(phoneCredential);
    return Constants.updatePhoneNumberSuccessful;
  }
}
