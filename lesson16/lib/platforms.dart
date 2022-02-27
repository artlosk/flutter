import 'dart:io';
import 'package:flutter/foundation.dart';

class Platforms {
  static bool isMobile = false;

  static const Map<String, CustomPlatform> _platformMap = {
    'android': CustomPlatform.android,
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia
  };

  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      isMobile = true;
    }

    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static CustomPlatform get platform => _getPlatform();
}

enum CustomPlatform {
  android,
  linux,
  macos,
  windows,
  ios,
  fuchsia,
  web,
  undefined
}
