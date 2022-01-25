import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";

@module
abstract class DiModules {
  @singleton
  http.Client get client => http.Client();

  @singleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}
