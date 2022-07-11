import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        primarySwatch: Colors.blueGrey,
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
  late WebViewController _controller;
  final CookieManager _cookieManager = CookieManager();
  String urlValur = '';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  void _loadURL(String url) {
    setState(() {
      isLoading = true;
    });
    _controller.loadUrl(url).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            _loadURL('https://google.com/');
          },
        ),
        title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  child: const Icon(Icons.navigate_before),
                  onTap: () {
                    _controller.goBack();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: isLoading
                    ? GestureDetector(
                        child: const Icon(Icons.replay),
                        onTap: () {
                          _controller.reload();
                          setState(() {
                            isLoading = true;
                          });
                        },
                      )
                    : GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          //_controller.;
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  child: const Icon(Icons.navigate_next),
                  onTap: () {
                    _controller.goForward();
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: Colors.grey,
                    autocorrect: false,
                    maxLines: 1,
                    autofocus: true,
                    onChanged: (value) {
                      setState(() {
                        urlValur = value;
                      });
                    },
                    onEditingComplete: () {
                      _loadURL(urlValur);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 88, 95, 130), width: 2),
                      ),
                      hintText: 'Введите URL',
                    ),
                  ),
                ),
              ),
            ]),
      ),
      body: WebView(
        initialUrl: 'https://google.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
      ),
    );
  }
}
