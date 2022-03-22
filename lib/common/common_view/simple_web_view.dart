import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebView extends StatefulWidget {
  const SimpleWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String? url;

  @override
  _SimpleWebViewState createState() => _SimpleWebViewState();
}

class _SimpleWebViewState extends State<SimpleWebView> {
  bool isFinished = false;
  late Completer<WebViewController> _controllerCompleter;

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<WebViewController>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // handle web page back
        // If you wrap SimpleWebView by WillPopScope, it never be called.
        if (_controllerCompleter.isCompleted) {
          final controller = await _controllerCompleter.future;
          if (await controller.canGoBack()) {
            await controller.goBack();
            return false;
          }
        }

        return true;
      },
      child: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                isFinished = true;
              });
            },
            onWebViewCreated: (_controller) {
              _controllerCompleter.complete(_controller);
            },
          ),
          isFinished ? const SizedBox() : const LoadingIndicator(),
        ],
      ),
    );
  }
}
