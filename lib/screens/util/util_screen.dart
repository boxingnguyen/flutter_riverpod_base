import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
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
        Center(
          child: ElevatedButton(
              onPressed: () => Utils.handleUnauthorizedError(),
              child: const Text(
                'Test session expired',
                style: AppStyles.textRegular,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
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
