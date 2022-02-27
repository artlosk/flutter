import 'dart:html' as html;
import 'dart:ui' as ui;
import 'dart:math';

import 'package:flutter/material.dart';

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {
  final String link;

  const WebPlatformWebView({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    ui.platformViewRegistry.registerViewFactory(id, (int viewId) {
      return html.IFrameElement()..src = link;
    });
    return HtmlElementView(viewType: id);
  }
}
