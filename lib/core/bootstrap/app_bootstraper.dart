import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/app/blocs/security/bloc/security_bloc.dart';
import 'package:flutter_template/core/bootstrap/startup_builder.dart';
import 'package:flutter_template/core/router/router.dart';
import 'package:flutter_template/core/services/service_locator/service_locator.dart'
    as service_locator;
import 'package:flutter_template/core/services/service_locator/service_locator.dart';

class AppBootstraper {
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    // TODO init all services on app startup

    service_locator.init();
    await StartupBuilder.build();

    if (kDebugMode) {
      final AppRouter router = sl();
      final Alice alice = sl();
      alice.setNavigatorKey(router.navigatorKey);
    }

    final provider = BlocProvider(
      create: (context) => SecurityBloc(),
      child: mainAppWidget,
    );

    runApp(provider);
  }
}
