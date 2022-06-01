import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/screens/home/components/update_phone.dart';
import 'package:provider_base/screens/home/home_screen.dart';
import 'package:provider_base/screens/home/home_state_notifier.dart';
import 'package:provider_base/screens/login/login_screen.dart';

void main() {
  group('HomeScreen tests', () {
    testWidgets('HomeScreen UI tests', (tester) async {
      await mockNetworkImagesFor(
          () async => await tester.pumpWidget(testingWidget()));
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsNWidgets(8));
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('Drawer UI tests', (tester) async {
      await mockNetworkImagesFor(
          () async => await tester.pumpWidget(testingWidget()));
      final ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle();
      expect(find.text(Constants.logOut), findsOneWidget);
      expect(find.text(Constants.updatePhoneNumber), findsOneWidget);
    });

    testWidgets('Drawer function tests - on tap open update number',
        (tester) async {
      await mockNetworkImagesFor(
          () async => await tester.pumpWidget(testingWidget()));
      final ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle();

      await tester.tap(find.text(Constants.updatePhoneNumber));
      await tester.pumpAndSettle();
      expect(find.byType(UpdatePhone), findsOneWidget);
    });

    testWidgets('Drawer function tests - on tap log out', (tester) async {
      await mockNetworkImagesFor(
          () async => await tester.pumpWidget(testingWidget()));
      final ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle();

      await tester.tap(find.text(Constants.logOut));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    test('Home function tests', () async {
      final homeStateNotifier = HomeStateNotifier();
      int oldCounter = homeStateNotifier.state.counter;
      homeStateNotifier.increment();
      int newCounter = homeStateNotifier.state.counter;
      expect(oldCounter < newCounter, true);

      int oldRandom = homeStateNotifier.state.random;
      homeStateNotifier.getRandom();
      int newRandom = homeStateNotifier.state.random;
      expect(oldRandom != newRandom, true);
    });
  });
}

Widget testingWidget() {
  return const ProviderScope(
    child: MaterialApp(
      home: HomeScreen(title: 'home'),
    ),
  );
}
