import 'package:flutter_template/core/bootstrap/commands/command.dart';

class Invoker {
  List<String> history = [];

  Future execute(Command command) async {
    await command.execute();
    history.add("[${DateTime.now()}] Executed $command");
  }

  @override
  String toString() => history.fold("", (events, event) => "$events$event\r");
}
