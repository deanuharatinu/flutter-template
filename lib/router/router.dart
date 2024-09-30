import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/router/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Entry Routes
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
      ];
}
