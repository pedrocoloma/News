import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
  final String url;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  ArticleScreen({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        elevation: 0,
      ),
      body: Container(
        child: WebView(
          initialUrl: url,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}
