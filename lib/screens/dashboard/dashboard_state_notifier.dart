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

  //late StreamSubscription<String>? _fcmTokenStreamSubscription;

  Map<TabItem, RefreshListener> listeners = {};
  bool isUpdatingFcmToken = false;
  bool inProgress = false;

  // @override
  // void dispose() {
  //   _fcmTokenStreamSubscription?.cancel();
  //   super.dispose();
  // }
  //
  // @override
  // void initState() {
  //   _updateFcmTokenIfRequired();
  // }

  // Future<void> _updateFcmTokenIfRequired() async {
  //   final token =
  //   await read<FlutterSecureStorage>().read(key: SecureStorageKeys.Token);
  //   if (token == null || token.isEmpty) {
  //     return;
  //   }
  //   await NotificationUtil.updateFcmTokenIfRequired(
  //     prefs: read<SharedPreferencesClient>(),
  //     graphQLApiClient: read<GraphQLApiClient>(),
  //   );
  //   _fcmTokenStreamSubscription =
  //       FirebaseMessaging.instance.onTokenRefresh.listen(_setFcmToken);
  // }
  //
  // Future<void> _setFcmToken(String token) async {
  //   await NotificationUtil.updateFcmTokenIfRequired(
  //     prefs: read<SharedPreferencesClient>(),
  //     graphQLApiClient: read<GraphQLApiClient>(),
  //     token: token,
  //   );
  // }

  void addRefreshListener(TabItem item, RefreshListener listener) {
    listeners[item] = listener;
  }

  void removeRefreshListener(TabItem item) {
    listeners.remove(item);
  }

  void notifyRefresh(TabItem item) {
    if (inProgress) {
      return;
    }

    inProgress = true;
    listeners[item]?.call().then((_) => inProgress = false);
  }
}
