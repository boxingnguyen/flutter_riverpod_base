import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/common_view/common_button.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/screens/util/util_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class UtilScreen extends HookConsumerWidget with Utils {
  const UtilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilState = ref.watch(utilNotifierProvider);
    final utilStateNotifier = ref.read(utilNotifierProvider.notifier);

    return Scaffold(
      appBar: getAppBar(title: 'Utilities Screen'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CommonButton.submitBtn(
            'Test session expired - Login',
            () async => await utilStateNotifier.fetchData(),
          ),
          Text(
            utilState.status,
            style: const TextStyle(
              color: Colors.red,
              fontSize: AppStyles.fontSizeH,
            ),
          ),
          const AppLifecycleReactor()
        ],
      ),
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
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
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

    return Center(
      child: Text(
        'Last App status: $_appStatus',
        style: AppStyles.textRegular,
      ),
    );
  }
}
