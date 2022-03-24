import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/post/post_screen.dart';
import 'package:provider_base/utils/analytics_utils.dart';
import 'package:provider_base/utils/utils.dart';

import 'home_state_notifier.dart';

class HomeScreen extends HookConsumerWidget with Utils {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(homeProvider);
    // if declare state here entire HomeScreen will be rebuild when state change
    AnalyticsUtil analyticsUtil = AnalyticsUtil();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter example',
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer(
            builder: (_, ref, child) {
              final state = ref.watch(homeProvider);

              return Column(
                children: [
                  Center(child: Text('${state.counter}')),
                  Text('Get random num: ${state.random}'),
                  TextButton(
                    onPressed: () =>
                        ref.read(homeProvider.notifier).getRandom(),
                    child: const Text('Get Random'),
                  ),
                  Text(
                    'Rebuild when state change: $secondNow',
                  ),
                ],
              );
            },
          ),
          Text(
            'NOT rebuild: $secondNow',
          ),
          ElevatedButton(
            onPressed: () {
              analyticsUtil.setCurrentScreen('post_list_screen');
              push(context, const PostScreen());
            },
            child: const Text('Post List'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          analyticsUtil.setCurrentScreen('post_list_screen');
          analyticsUtil.logLogin(loginMethod: 'test_google_analytic');
          analyticsUtil.logEvent(AnalyticsEventType.loginWithApple);

          ref.read(homeProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String get secondNow {
    return DateTime.now().second.toString();
  }
}
