import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/screens/home/home_state.dart';

import 'home_state_notifier.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>(
    (_) => HomeStateNotifier());

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(homeProvider);
    // if declare state here entire HomeScreen will be rebuild when state change

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter example',
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(homeProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }

  String get secondNow {
    return DateTime.now().second.toString();
  }
}