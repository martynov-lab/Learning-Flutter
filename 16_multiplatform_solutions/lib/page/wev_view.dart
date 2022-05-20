import 'package:multiplatform_solutions/common/mock_webview.dart'
    if (dart.library.io) 'package:multiplatform_solutions/common/nonweb_platform_webview.dart'
    if (dart.library.io) 'package:multiplatform_solutions/common/web_platform_webview.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/common/app_platform.dart';

import 'package:multiplatform_solutions/service/service_load_url.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final TextEditingController _controllerInput =
      TextEditingController(text: '');
  ServiceLoadURL serviceLoadURL = ServiceLoadURL();
  String textHtml = '';
  String corsHeader = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: FutureBuilder(
                future: serviceLoadURL.loadHtmlPage(_controllerInput.text),
                builder: ((context, AsyncSnapshot<String> snapshot) {
                  //print('snapshot: ${snapshot.connectionState}');
                  if (snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasData == null) {
                    return const Center(
                      child: Text('Ошибка загрузки!'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    textHtml = snapshot.data ?? '';
                    // print('snapshot.data: ${snapshot.data}');
                    // print('textHtml: $textHtml');
                  }
                  return webView(textHtml);
                }),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 120,
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextFormField(
                              validator: (value) {
                                return (value == null || value.isEmpty)
                                    ? 'Введите URL'
                                    : null;
                              },
                              controller: _controllerInput,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                hintText: 'Ввежите URL',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          height: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {});
                                serviceLoadURL
                                    .loadHtmlPage(_controllerInput.text);
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //   content: Row(
                                //     children: const <Widget>[
                                //       Expanded(
                                //         child: Text(
                                //           'Загрузка...',
                                //           style: TextStyle(
                                //               fontSize: 18, color: Colors.white),
                                //         ),
                                //       ),
                                //       Icon(Icons.check_circle, color: Colors.white)
                                //     ],
                                //   ),
                                //   backgroundColor: Colors.green[300],
                                //   duration: const Duration(seconds: 2),
                                // ));
                              }
                            },
                            child: const Text('LOAD',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              primary: Colors.indigo[300],
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      'APPLICATION IN RUNNING ON ${AppPlatform.platform.name.toUpperCase()}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
