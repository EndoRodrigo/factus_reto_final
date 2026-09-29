import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get clientId => dotenv.env['FACTUS_CLIENT_ID'] ?? '';

  static String get clientSecret => dotenv.env['FACTUS_CLIENT_SECRET'] ?? '';

  static String get username => dotenv.env['FACTUS_USERNAME'] ?? '';

  static String get password => dotenv.env['FACTUS_PASSWORD'] ?? '';
}
