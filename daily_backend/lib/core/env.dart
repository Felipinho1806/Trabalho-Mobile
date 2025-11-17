import 'package:dotenv/dotenv.dart';

class Environment {
  static final _env = DotEnv()..load();

  static String get dbHost => _env['DB_HOST'] ?? 'localhost';
  static String get dbPort => _env['DB_PORT'] ?? '5432';
  static String get dbUser => _env['DB_USER'] ?? 'postgres';
  static String get dbPass => _env['DB_PASS'] ?? 'postgres';
  static String get dbName => _env['DB_NAME'] ?? 'daily_xp';
  static int get serverPort => int.parse(_env['SERVER_PORT'] ?? '8080');
}
