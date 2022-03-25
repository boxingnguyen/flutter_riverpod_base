import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/utils/analytics_utils.dart';

final analyticsUtilProvider = Provider((ref) => AnalyticsUtil(App.analytics));
final firebaseAnalyticsProvider = Provider((ref) => FirebaseAnalytics());

class App {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
}
