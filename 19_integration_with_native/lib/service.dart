import 'dart:async';
import 'package:flutter/services.dart';

class PlatformService {
  static const method = MethodChannel('CALL_METHOD');

  Future<String> callMethodChannel(String text) async {
    try {
      var _text = await method.invokeMethod('CALL', {"text": text});
      return _text;
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
      return '';
    }
  }
}
