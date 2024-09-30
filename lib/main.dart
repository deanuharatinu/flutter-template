import 'package:flutter/material.dart';
import 'package:flutter_template/core/bootstrap/app_bootstraper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBootstraper.init(
    mainAppWidget: const MainApp(),
    runApp: runApp,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
