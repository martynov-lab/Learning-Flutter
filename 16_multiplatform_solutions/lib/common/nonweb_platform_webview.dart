import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/common/app_platform.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String textHtml) => AppPlatform.isMobile
    ? WebViewPage(textHtml: textHtml)
    : Hyperlink(link: textHtml);

class Hyperlink extends StatelessWidget {
  final String link;
  const Hyperlink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(link));
      },
      child: Center(child: Text(link)),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String textHtml;
  const WebViewPage({Key? key, required this.textHtml}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) async {
        _controller = webViewController;
        _controller.loadHtmlString(textHtml);
      },
    );
  }
}
