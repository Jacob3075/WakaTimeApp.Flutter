import "dart:io";

import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/data/errors.dart";
import "package:waka_time_app/features/login/data/login_api.dart";

import "login_api_test.mocks.dart";

@GenerateMocks([http.Client])
main() {
  late LoginApi loginApi;
  late MockClient client;

  setUp(() {
    client = MockClient();
    loginApi = LoginApi(client: client);
  });

  group(
    "When http client throws exceptions",
    () {
      test(
        "When http client throws SocketException, calling login method will return Network Error",
        () async {
          when(client.get(any)).thenThrow(const SocketException(""));

          final result = await loginApi.getUserDetails("");

          expect(result, isA<Left>());
          result.fold(
            (errors) => expect(errors, const Errors.network()),
            (_) => null,
          );
        },
      );

      test(
        "When http client throws HttpException, calling login method will return Network Error",
        () async {
          when(client.get(any)).thenThrow(const HttpException(""));

          final result = await loginApi.getUserDetails("");

          expect(result, isA<Left>());
          result.fold(
            (errors) => expect(errors, const Errors.network()),
            (_) => null,
          );
        },
      );

      test(
        "When http client throws general Exception, calling login method will return Errors object",
        () async {
          when(client.get(any)).thenThrow(Exception(""));

          final result = await loginApi.getUserDetails("");

          expect(result, isA<Left>());
          result.fold(
            (errors) =>
                expect(errors, const Errors(errorMessage: "Exception: ")),
            (_) => null,
          );
        },
      );
    },
  );

  // TODO: FINISH TESTS
  group(
    "When http client returns data",
    () {
      test(
        "when data is valid, correct object is returned",
        () {},
      );

      test(
        "when api key is invalid, appropriate error is returned",
        () {},
      );

      test(
        "when server or client error happens, appropriate error is returned",
        () {},
      );
    },
  );
}
