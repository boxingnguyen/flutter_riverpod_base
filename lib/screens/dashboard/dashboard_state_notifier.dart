import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardStateNotifier, void>((ref) {
  return DashboardStateNotifier();
});

enum TabItem {
  home,
  message,
  workflow,
  document,
  otherMenu,
}

typedef RefreshListener = Future<void> Function();

class DashboardStateNotifier extends StateNotifier<void> with LocatorMixin {
  DashboardStateNotifier() : super(null);

  Map<TabItem, RefreshListener> listeners = {};
  bool isUpdatingFcmToken = false;
  bool inProgress = false;

  void addRefreshListener(TabItem item, RefreshListener listener) {
    listeners[item] = listener;
  }

  void notifyRefresh(TabItem item) {
    if (inProgress) {
      return;
    }

    inProgress = true;
    listeners[item]?.call().then((_) => inProgress = false);
  }
}
