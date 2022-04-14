import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/loading_indicator.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/screens/util/util_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class UtilScreen extends StatelessWidget {
  const UtilScreen({Key? key}) : super(key: key);
  static String routeName = '/util';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppLifecycleReactor(),
    );
  }
}

class AppLifecycleReactor extends StatefulWidget {
  const AppLifecycleReactor({Key? key}) : super(key: key);

  @override
  State<AppLifecycleReactor> createState() => _AppLifecycleReactorState();
}

class _AppLifecycleReactorState extends State<AppLifecycleReactor>
    with WidgetsBindingObserver, Utils {
  AppLifecycleState? _appStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      log(state.toString());
      _appStatus = state;
      log(state.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    log(isPortrait(context) ? 'Portrait' : 'Landscape');
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Utilities Screen'),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Example of navigation without context
        const UtilBody(),
        Center(
          child: Text(
            'Last App status: $_appStatus',
            style: AppStyles.textRegular,
          ),
        )
      ]),
    );
  }
}

class UtilBody extends HookConsumerWidget {
  const UtilBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final utilState = ref.watch(utilNotifierProvider);
    final utilStateNotifier = ref.read(utilNotifierProvider.notifier);

    return Column(children: [
      Center(
        child: ElevatedButton(
            onPressed: () async => await utilStateNotifier.fetchData(),
            child: utilState.showLoadingIndicator
                ? const LoadingIndicator()
                : const Text(
                    'Test session expired - Login',
                    style: AppStyles.textRegular,
                  )),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(utilState.status),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
