import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/page/wev_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: Text('Multiplatform', style: TextStyle(color: Colors.grey[900])),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey[900],
              )),
        ],
      ),
      body: const WebViewPage(),
    );
  }
}
