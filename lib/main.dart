import 'package:flutter/material.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/core/bootstrap/app_bootstraper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBootstraper.init(
    mainAppWidget: const App(),
    runApp: runApp,
  );
}
