import 'package:flutter/material.dart';

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
    with WidgetsBindingObserver {
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
      _appStatus = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Last App status: $_appStatus'));
  }
}
