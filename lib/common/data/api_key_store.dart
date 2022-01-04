import "package:flutter_secure_storage/flutter_secure_storage.dart";

class ApiKeyStore {
  final FlutterSecureStorage storage;

  ApiKeyStore({required this.storage});
}

abstract class _ApiKeyStoreKeys {
  static const keyApiKey = "";
}
