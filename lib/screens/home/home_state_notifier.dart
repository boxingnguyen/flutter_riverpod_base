import 'dart:developer' as dev;
import 'dart:math';

import 'package:state_notifier/state_notifier.dart';

import 'home_state.dart';

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
}
