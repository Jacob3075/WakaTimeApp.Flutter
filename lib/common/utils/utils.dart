import "dart:io";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/errors.dart";

extension Range on num {
  /// Checks if number is between [from] and [to] parameters.
  /// Both [from] and [to] are inclusive
  /// [Source](https://stackoverflow.com/questions/53797581/easily-check-if-a-number-is-in-a-given-range-in-dart)
  bool isBetween(num from, num to) => from <= this && this <= to;
}

Either<Errors, T> getDataOrErrorFromResponse<T>({
  required http.Response response,
  required Either<Errors, T> Function(http.Response response) successBody,
}) {
  final statusCode = response.statusCode;
  Either<Errors, T> result;
  if (statusCode.isBetween(200, 299)) {
    result = successBody(response);
  } else if (statusCode == 401) {
    result = Left(Errors.unauthorized());
  } else if (statusCode.isBetween(400, 499)) {
    result = Left(Errors.clientError(
      errorMessage: response.body,
      code: statusCode,
    ));
  } else if (statusCode.isBetween(500, 599)) {
    result = Left(Errors.serverError(
      errorMessage: response.body,
      code: statusCode,
    ));
  } else {
    result = Left(Errors(errorMessage: response.body));
  }

  return result;
}

Future<Either<Errors, T>> getDataOrErrorFromApi<T>({
  required String apiKey,
  required Future<Either<Errors, T>> Function(String apiKey) tryBody,
}) async {
  Either<Errors, T> result;
  try {
    result = await tryBody(apiKey);
  } on SocketException {
    result = const Left(Errors.network());
  } on HttpException {
    result = const Left(Errors.network());
  } on FormatException catch (exception) {
    result =
        Left(Errors(errorMessage: "Format Exception, ${exception.message}"));
  } on Exception catch (exception) {
    result = Left(Errors(errorMessage: exception.toString()));
  }
  return result;
}

extension ErrorMessage on Errors {
  String getErrorMessage() => map(
        (value) => value.errorMessage,
        network: (error) => "Network Error",
        clientError: (error) => error.errorMessage,
        serverError: (error) => error.errorMessage,
      );
}