import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/bootstrap/startup_builder.dart';

class AppBootstraper {
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    // TODO init all services on app startup

    await StartupBuilder.build();

    if (kDebugMode) {
      // TODO do something related to debugging
    }

    runApp(mainAppWidget);
  }
}
