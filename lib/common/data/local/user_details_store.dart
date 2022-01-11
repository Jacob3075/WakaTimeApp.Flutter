import "dart:convert";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";

class UserDetailsStore {
  final FlutterSecureStorage _storage;

  UserDetailsStore({required FlutterSecureStorage storage}) : _storage = storage;

  Future<void> saveApiKey(String apiKey) async =>
      await _storage.write(key: _UserDetailsStoreKeys.keyApiKey, value: apiKey);

  Future<String?> getApiKey() async => await _storage.read(key: _UserDetailsStoreKeys.keyApiKey);

  Future<void> saveUserDetails(UserDetails userDetails) async => await _storage.write(
        key: _UserDetailsStoreKeys.keyUserDetails,
        value: jsonEncode(userDetails.toJson()),
      );

  Future<UserDetails?> getUserDetails() async {
    final userDetailsFromStore = await _storage.read(key: _UserDetailsStoreKeys.keyUserDetails);
    if (userDetailsFromStore == null) return null;

    return UserDetails.fromJsonString(userDetailsFromStore);
  }
}

abstract class _UserDetailsStoreKeys {
  static const keyApiKey = "KEY_API_KEY";
  static const keyUserDetails = "KEY_USER_DETAILS";
}
