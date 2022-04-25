import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/dashboard/dashboard_screen.dart';
import 'package:provider_base/screens/form_and_dialog/form_screen.dart';
import 'package:provider_base/screens/todo/todo_screen.dart';

void main() {
  group('Dashboard UI tests', () {
    testWidgets('Change tab', (tester) async {
      await tester.pumpWidget(testingWidget());

      expect(find.byType(CupertinoTabBar), findsOneWidget);
      expect(find.byType(TodoScreen), findsOneWidget);

      await tester.tap(find.byIcon(Icons.text_fields));
      await tester.pumpAndSettle();
      expect(find.byType(FormScreen), findsOneWidget);

      //cannot test display home screen when tap this icon because every http requests always return status 400
      // await tester.tap(find.byIcon(Icons.web));
      // await tester.pumpAndSettle();
      // expect(find.byType(SimpleWebView), findsOneWidget);

      await tester.tap(find.byIcon(Icons.window));
      await tester.pumpAndSettle();
      // TODO(mint): check lai giup a man DialogScreen gio doi ten la gi
      // expect(find.byType(DialogScreen), findsOneWidget);

      //cannot test display home screen when tap this icon because every http requests always return status 400
      // await tester.tap(find.byIcon(Icons.settings));
      // await tester.pumpAndSettle();
      // expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}

Widget testingWidget() {
  return const ProviderScope(
    child: MaterialApp(
      home: DashboardScreen(),
    ),
  );
}
