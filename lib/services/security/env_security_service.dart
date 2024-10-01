import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_template/core/configs/env.dart';

class EnvSecurityService {
  EnvSecurityService._();

  static Future<bool> isEnvSafe() async {
    if (kDebugMode && Env.environment == "development") {
      return true;
    }

    var isJailbroken = false;
    var isDeveloperMode = false;
    try {
      isJailbroken = await FlutterJailbreakDetection.jailbroken;
      // Android only
      isDeveloperMode = await FlutterJailbreakDetection.developerMode;
    } on PlatformException {
      isJailbroken = true;
      isDeveloperMode = true;
    }

    var isEnvNotSafe = false;
    if (Platform.isAndroid) {
      isEnvNotSafe = isJailbroken || isDeveloperMode;
    } else {
      isEnvNotSafe = isJailbroken;
    }

    return !isEnvNotSafe;
  }
}
