import 'package:flutter/material.dart';
import 'package:lesson16/platforms.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String link) => Platforms.isMobile
    ? CustomWebView(initialUrl: link)
    : Hyperlink(link: link);

class CustomWebView extends StatelessWidget {
  final String initialUrl;

  const CustomWebView({Key? key, required this.initialUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: initialUrl,
    );
  }
}

class Hyperlink extends StatelessWidget {
  final String link;

  const Hyperlink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        link,
        style: const TextStyle(
            decoration: TextDecoration.underline, color: Colors.blue),
      ),
    );
  }
}
