import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {
  final String link;
  const WebPlatformWebView({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = math.Random().nextInt.toString();
    ui.platformViewRegistry
        .registerViewFactory(id, (int viewId) => IFrameElement()..src = link);
    return HtmlElementView(viewType: link);
    // return Text('link');
  }
}
