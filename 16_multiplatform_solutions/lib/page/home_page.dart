import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/common/adaptive_widget.dart';
import 'package:multiplatform_solutions/page/list_page.dart';
import 'package:multiplatform_solutions/page/wev_view.dart';
import 'package:multiplatform_solutions/widgets/popum_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String corsHeader = '';
  bool isShowWebView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: isShowWebView
            ? Column(
                children: [
                  Text('Multiplatform',
                      style: TextStyle(color: Colors.grey[900])),
                  Text('CORS header: $corsHeader',
                      style: TextStyle(color: Colors.red[900])),
                ],
              )
            : AdaptiveWidget(
                ultraWide: null,
                wide: null,
                narrow:
                    Text('Adaptive', style: TextStyle(color: Colors.grey[900])),
              ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey[800],
            ),
            onSelected: (result) {
              if (result == 0) {
                setState(() {
                  isShowWebView = true;
                });
              }
              if (result == 1) {
                setState(() {
                  isShowWebView = false;
                });
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            itemBuilder: (context) => [
              popupMenuItem(
                  0, Icons.arrow_forward_ios_rounded, 'Multiplatform'),
              popupMenuItem(1, Icons.arrow_forward_ios_rounded, 'Adaptive'),
            ],
          ),
        ],
      ),
      body: isShowWebView ? const WebViewPage() : const ListPage(),
    );
  }
}
