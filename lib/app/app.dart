import 'package:flutter/material.dart';
import 'package:flutter_template/core/router/router.dart';
import 'package:flutter_template/core/services/service_locator/service_locator.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = sl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: _navigatorKey,
      routerConfig: _appRouter.config(),
    );
  }
}
