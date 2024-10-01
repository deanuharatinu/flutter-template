import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true, allowOptionalFields: true)
abstract class Env {
  @EnviedField(varName: 'ENVIRONMENT')
  static String environment = _Env.environment;
}
