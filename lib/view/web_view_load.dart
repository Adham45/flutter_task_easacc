import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';

class WebViewLoad extends StatelessWidget {
  const WebViewLoad({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Easacc Task'),
          backgroundColor: primaryColor,
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
