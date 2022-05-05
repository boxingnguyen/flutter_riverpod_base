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
    return Scaffold(
      appBar: getAppBar(context: context, title: 'Utilities Screen'),
      body: Center(
          child: Text(
        'Last App status: $_appStatus',
        style: AppStyles.textRegular,
      )),
    );
  }
}
