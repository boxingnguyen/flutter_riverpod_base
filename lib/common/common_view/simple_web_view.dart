import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebView extends StatefulWidget {
  const SimpleWebView({
    Key? key,
    required this.url,
    this.controllerCompleter,
  }) : super(key: key);

  final String url;
  final Completer<WebViewController>? controllerCompleter;

  @override
  // ignore: library_private_types_in_public_api
  _SimpleWebViewState createState() => _SimpleWebViewState();
}

class _SimpleWebViewState extends State<SimpleWebView> {
  bool isFinished = false;
  late Completer<WebViewController>? _controllerCompleter;
  late bool _validURL = true;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    _controllerCompleter =
        widget.controllerCompleter ?? Completer<WebViewController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _validURL = Uri.parse(widget.url).isAbsolute;
    if (_controllerCompleter == null) {
      return const SizedBox();
    }

    if (!_validURL) {
      return const Center(
        child: Text('Url is not valid'),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        // handle web page back
        // If you wrap SimpleWebView by WillPopScope, it never be called.
        if (_controllerCompleter!.isCompleted) {
          final controller = await _controllerCompleter!.future;
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
            onWebViewCreated: (webViewCtrl) {
              _controllerCompleter!.complete(webViewCtrl);
            },
          ),
          isFinished ? const SizedBox() : const LoadingIndicator(),
        ],
      ),
    );
  }
}
