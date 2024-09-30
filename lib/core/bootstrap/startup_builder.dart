import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/bootstrap/commands/command.dart';
import 'package:flutter_template/core/bootstrap/invoker.dart';
import 'package:logger/web.dart';

class StartupBuilder {
  static Future build() async {
    List<Command> commands = [
      // TODO list of commands
    ];

    var logger = Logger();
    var invoker = Invoker();

    for (var command in commands) {
      await invoker.execute(command);

      if (kDebugMode) logger.d(invoker.toString());
    }
  }
}
