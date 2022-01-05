import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/data/user_details_store.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";

import "../../fixtures/sample_user_details.dart";
import "user_details_store_test.mocks.dart";

@GenerateMocks([FlutterSecureStorage])
main() {
  late MockFlutterSecureStorage mockStorage;
  late UserDetailsStore store;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    store = UserDetailsStore(storage: mockStorage);
  });

  const userDetailsKey = "KEY_USER_DETAILS";
  const apiKeyKey = "KEY_API_KEY";
  const apiKey = "e15618f1-bbfc-42e9-9fb9-c4a82e0b23ec";

  group("Reading values", () {
    group(
      "When store contains values",
      () {
        test(
          "for user details reading it should return a valid object",
          () async {
            when(mockStorage.read(key: userDetailsKey))
                .thenAnswer((realInvocation) async => sampleUserDetailsJson);

            UserDetails? userDetails = await store.getUserDetails();

            expect(userDetails, isNotNull);
            expect(userDetails, equals(userDetails));
          },
        );

        test(
          "for api key then reading it should return the key",
          () async {
            when(mockStorage.read(key: apiKeyKey))
                .thenAnswer((realInvocation) async => apiKey);

            String? apiKeyFromStore = await store.getApiKey();

            expect(apiKeyFromStore, isNotNull);
            expect(apiKeyFromStore, equals(apiKey));
          },
        );
      },
    );

    group(
      "When store does not contain values",
      () {
        test(
          "for user details reading it should return null",
          () async {
            when(mockStorage.read(key: userDetailsKey))
                .thenAnswer((realInvocation) async => null);

            UserDetails? userDetails = await store.getUserDetails();

            expect(userDetails, isNull);
          },
        );

        test(
          "for api key then reading it should return null",
          () async {
            when(mockStorage.read(key: apiKeyKey))
                .thenAnswer((realInvocation) async => null);

            String? apiKeyFromStore = await store.getApiKey();

            expect(apiKeyFromStore, isNull);
          },
        );
      },
    );
  });

  group("Writing values", () {
    test("to user details", () async {
      await store.saveUserDetails(sampleUserDetails);

      verify(mockStorage.write(
        key: userDetailsKey,
        value: sampleUserDetailsJson,
      ));
    });

    test("to api key", () async {
      await store.saveApiKey(apiKey);

      verify(mockStorage.write(
        key: apiKeyKey,
        value: apiKey,
      ));
    });
  });
}
