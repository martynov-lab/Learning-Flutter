import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

Widget webView(String textHtml) => WebPlatformWebView(textHtml: textHtml);

class WebPlatformWebView extends StatelessWidget {
  final String textHtml;
  const WebPlatformWebView({Key? key, required this.textHtml})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final id = math.Random().nextInt.toString();
    // String _textHtml = textHtml;
    // _textHtml =
    //     "data:text/html;charset=utf-8," + Uri.encodeComponent(_textHtml);

    // ui.platformViewRegistry.registerViewFactory(
    //     id, (int viewId) => IFrameElement()..src = textHtml);

    // return HtmlElementView(viewType: _textHtml);

    return SingleChildScrollView(
        child: HtmlWidget(
      textHtml,
    ));

    //return SingleChildScrollView(child: Text(textHtml));
  }
}
