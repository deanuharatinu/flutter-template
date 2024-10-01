import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/router/router.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => AppRouter());

  if (kDebugMode) {
    sl.registerLazySingleton(
      () => Alice(showInspectorOnShake: true, showNotification: true),
    );
  }

  
}
