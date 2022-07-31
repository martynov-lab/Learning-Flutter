import 'package:flutter/material.dart';
import 'package:integration_with_native/platform_view_mobile.dart';

import 'package:integration_with_native/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _service = PlatformService();
  final _controller = TextEditingController();

  String _text = '';

  void _getValue(String text) async {
    var _textFromNative = await _service.callMethodChannel(text);
    setState(() {
      _text = _textFromNative;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                //color: Colors.green[200],
                //width: 200,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                child: PlatformView(textFromNative: _text),
              ),
            ),
            Text(
              _text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                style: Theme.of(context).inputDecorationTheme.labelStyle,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _getValue(_controller.text);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
