import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/router/router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: _navigatorKey,
      routerDelegate: AutoRouterDelegate(
        _appRouter,
      ),
    );
  }
}
