import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/loading_indicator.dart';
import 'package:provider_base/models/todo_model/todo.dart';
import 'package:provider_base/screens/todo/todo_screen.dart';
import 'package:provider_base/screens/todo/todo_state_notifier.dart';

void main() {
  group('TodoScreen functionality tests', () {
    test('Fetch to do list', () async {
      final todoStateNotifier = TodoStateNotifier();
      final List<Todo> todosList = await todoStateNotifier.fetchData(limit: 15);
      if (todoStateNotifier.state.showErrorIndicator) {
        expect(todosList.length, 0);
      } else {
        expect(todosList.length, 15);
      }
    });

    testWidgets('Load more to do ', (tester) async {
      await tester.pumpWidget(testingWidget());
      expect(find.byType(LoadingIndicator), findsOneWidget);

      // load more and re-render
      await tester.drag(
          find.byKey(const ValueKey('RefreshIndicator')), const Offset(0, 200));
      expect(find.byType(LoadingIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      // Find the values on screen representing updated state
      expect(find.byType(ListTile), findsNWidgets(30));
    });
  });
}

Widget testingWidget() {
  return const ProviderScope(
    child: MaterialApp(
      home: TodoScreen(),
    ),
  );
}
