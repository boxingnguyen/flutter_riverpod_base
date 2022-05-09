import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_base/common/core/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecaptchaV2 extends StatefulWidget {
  const RecaptchaV2({
    Key? key,
    required this.apiKey,
    required this.apiSecret,
    this.pluginURL = Constants.pluginURL,
    this.visibleCancelBottom = false,
    this.textCancelButtom = Constants.cancelCaptcha,
    this.onVerifiedSuccessfully,
    this.onVerifiedError,
    required this.controller,
  }) : super(key: key);
  final String apiKey;
  final String apiSecret;
  final String pluginURL;
  final RecaptchaV2Controller controller;
  final bool visibleCancelBottom;
  final String textCancelButtom;
  final ValueChanged<bool>? onVerifiedSuccessfully;
  final ValueChanged<String>? onVerifiedError;

  @override
  State<StatefulWidget> createState() => _RecaptchaV2State();
}

class _RecaptchaV2State extends State<RecaptchaV2> {
  RecaptchaV2Controller controller = RecaptchaV2Controller();
  WebViewController? webViewController;

  void onListen() {
    if (controller.visible) {
      if (webViewController != null) {
        webViewController!.clearCache();
        webViewController!.reload();
      }
    }
    setState(() {
      controller.visible;
    });
  }

  void verifyToken(String token) async {
    String url = Constants.siteverify;
    http.Response response = await http.post(Uri.parse(url), body: {
      "secret": widget.apiSecret,
      "response": token,
    });

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      if (json['success']) {
        widget.onVerifiedSuccessfully!(true);
      } else {
        widget.onVerifiedSuccessfully!(false);
        widget.onVerifiedError!(json['error-codes'].toString());
      }
    }
  }

  @override
  void initState() {
    controller = widget.controller;
    controller.addListener(onListen);
    super.initState();
  }

  @override
  void didUpdateWidget(RecaptchaV2 oldWidget) {
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(onListen);
      controller = widget.controller;
      controller.removeListener(onListen);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.removeListener(onListen);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.visible
        ? Stack(
            children: <Widget>[
              SizedBox(
                height: 500,
                child: WebView(
                  initialUrl: "${widget.pluginURL}?api_key=${widget.apiKey}",
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: <JavascriptChannel>{
                    JavascriptChannel(
                      name: 'RecaptchaFlutterChannel',
                      onMessageReceived: (JavascriptMessage receiver) {
                        String _token = receiver.message;
                        if (_token.contains("verify")) {
                          _token = _token.substring(7);
                        }
                        verifyToken(_token);
                      },
                    ),
                  },
                  onWebViewCreated: (_controller) {
                    webViewController = _controller;
                  },
                ),
              ),
              if (widget.visibleCancelBottom)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text(widget.textCancelButtom),
                            onPressed: () {
                              controller.hide();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        : const SizedBox();
  }
}

class RecaptchaV2Controller extends ChangeNotifier {
  bool isDisposed = false;
  List<VoidCallback> _listeners = [];

  bool _visible = false;
  bool get visible => _visible;

  void show() {
    _visible = true;
    if (!isDisposed) notifyListeners();
  }

  void hide() {
    _visible = false;
    if (!isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _listeners = [];
    isDisposed = true;
    super.dispose();
  }

  @override
  void addListener(listener) {
    _listeners.add(listener);
    super.addListener(listener);
  }

  @override
  void removeListener(listener) {
    _listeners.remove(listener);
    super.removeListener(listener);
  }
}
