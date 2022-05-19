import 'package:http/http.dart' as http;

class ServiceLoadURL {
  Future<String> loadHtmlPage(String url) async {
    //print('url: $url');
    var response = await http.get(Uri.parse(url));
    var result = response.body;
    //print('response.body: ${response.body}');
    return result;
  }
}
