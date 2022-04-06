// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider_base/screens/login/login_state_notifier.dart';

void main() async {
  test('check generateNonce', () {
    final loginStateNotifier = LoginStateNotifier();
    final generateNonce = loginStateNotifier.generateNonce();

    expect(generateNonce.isNotEmpty, true);
  });
  test('check sha256', () {
    final loginStateNotifier = LoginStateNotifier();
    String input = 'sha256';
    final sha256 = loginStateNotifier.sha256ofString(input);

    expect((sha256.isNotEmpty) && (sha256 != input), true);
  });
}
