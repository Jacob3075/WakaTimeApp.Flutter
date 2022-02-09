import "dart:io";

import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/errors/network_errors.dart";
import "package:waka_time_app/features/login/domain/usecases/get_user_details_uc.dart";

import "../../../../mocks.mocks.dart";
import "../../../fixtures/sample_user_details.dart";

main() {
  late GetUserDetailsUC loginApi;
  late MockClient client;
  const loginUCParameters = GetUserDetailsUCParameters(apiKey: "");

  setUp(() {
    client = MockClient();
    loginApi = GetUserDetailsUC(client: client);
  });

  group(
    "When http client throws exceptions",
    () {
      test(
        "When http client throws SocketException, calling login method will return Network Error",
        () async {
          when(client.get(any)).thenThrow(const SocketException(""));

          final result = await loginApi(loginUCParameters);

          expect(result, isA<Left>());
          result.fold(
            (errors) => expect(errors, const Errors.networkError(NetworkErrors.network())),
            (_) => null,
          );
        },
      );

      test(
        "When http client throws HttpException, calling login method will return Network Error",
        () async {
          when(client.get(any)).thenThrow(const HttpException(""));

          final result = await loginApi(loginUCParameters);

          expect(result, isA<Left>());
          result.fold(
            (errors) => expect(errors, const Errors.networkError(NetworkErrors.network())),
            (_) => null,
          );
        },
      );

      test(
        "When http client throws general Exception, calling login method will return Errors object",
        () async {
          when(client.get(any)).thenThrow(Exception(""));

          final result = await loginApi(loginUCParameters);

          expect(result, isA<Left>());
          result.fold(
            (errors) => expect(
              errors,
              const Errors.networkError(NetworkErrors(errorMessage: "Exception: ")),
            ),
            (_) => null,
          );
        },
      );
    },
  );

  group(
    "When http client returns data",
    () {
      test(
        "when data is valid, correct object is returned",
        () async {
          when(client.get(any))
              .thenAnswer((_) async => http.Response(sampleUserDetailsResponse, 200));

          final result = await loginApi(loginUCParameters);

          expect(result, isA<Right>());
          result.fold(
            (_) => null,
            (data) => expect(data, sampleUserDetails),
          );
        },
      );

      test(
        "when api key is invalid, appropriate error is returned",
        () async {
          when(client.get(any))
              .thenAnswer((_) async => http.Response("""{"error":"Unauthorized"}""", 401));

          final result = await loginApi(loginUCParameters);

          expect(result, isA<Left>());
          result.fold(
            (error) => expect(error, Errors.networkError(NetworkErrors.unauthorized())),
            (_) => null,
          );
        },
      );

      test(
        "when server or client error happens, appropriate error is returned",
        () async {
          when(client.get(any))
              .thenAnswer((_) async => http.Response("""{"error":"Not found"}""", 404));

          final result = await loginApi(loginUCParameters);

          expect(result, isA<Left>());
          result.fold(
            (error) => expect(
              error,
              const Errors.networkError(
                NetworkErrors.clientError(
                  errorMessage: """{"error":"Not found"}""",
                  code: 404,
                ),
              ),
            ),
            (_) => null,
          );
        },
      );
    },
  );
}
