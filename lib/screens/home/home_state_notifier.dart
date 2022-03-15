import 'dart:developer' as dev;
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/utils/analytics_utils.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
    (_) => HomeStateNotifier());

class HomeStateNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeStateNotifier() : super(HomeState());
  AnalyticsUtil analyticsUtil = AnalyticsUtil();
  Future<void> increment() async {
    var counter = state.counter;
    analyticsUtil.logEvent(AnalyticsEventType.increment);
    state = state.copyWith(counter: ++counter);
    dev.log('counter change: $counter');
  }

  Future<void> getRandom() async {
    final random = Random().nextInt(100);
    analyticsUtil.logEvent(AnalyticsEventType.getRandom);
    state = state.copyWith(random: random);
  }
}
