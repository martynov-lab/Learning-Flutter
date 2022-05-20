import 'dart:io';
import 'package:flutter/foundation.dart';

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'android': CustomPlatform.android,
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia,
  };
  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static CustomPlatform get platform => _getPlatform();
  static bool get isMobile =>
      platform == CustomPlatform.android || platform == CustomPlatform.android;
}

enum CustomPlatform {
  linux,
  macos,
  windows,
  ios,
  fuchsia,
  android,
  web,
  undefined,
}
