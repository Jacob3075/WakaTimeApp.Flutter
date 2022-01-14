import "dart:io";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/errors/network_errors.dart";

extension Range on num {
  /// Checks if number is between [from] and [to] parameters.
  /// Both [from] and [to] are inclusive
  /// [Source](https://stackoverflow.com/questions/53797581/easily-check-if-a-number-is-in-a-given-range-in-dart)
  bool isBetween(num from, num to) => from <= this && this <= to;
}

/// Calls the [apiCall] function, if it throws an exception they are handled.
/// If no exceptions are thrown then the response status code is checked,
/// if it is in 200s series then [successResponseProcessing] is called
/// and appropriate response is returned
Future<Either<Errors, T>> getDataOrErrorFromApi<T>({
  required Future<http.Response> Function() apiCall,
  required Either<Errors, T> Function(http.Response response) successResponseProcessing,
}) async {
  Either<Errors, T> result;
  try {
    result = _getDataOrErrorFromResponse(
      response: await apiCall(),
      successResponseProcessing: successResponseProcessing,
    );
  } on SocketException {
    result = const Left(Errors.networkError(networkError: NetworkErrors.network()));
  } on HttpException {
    result = const Left(Errors.networkError(networkError: NetworkErrors.network()));
  } on FormatException catch (exception) {
    result = Left(Errors.networkError(
        networkError: NetworkErrors(errorMessage: "Format Exception, ${exception.message}")));
  } on Exception catch (exception) {
    result =
        Left(Errors.networkError(networkError: NetworkErrors(errorMessage: exception.toString())));
  }
  return result;
}

Either<Errors, T> _getDataOrErrorFromResponse<T>({
  required http.Response response,
  required Either<Errors, T> Function(http.Response response) successResponseProcessing,
}) {
  final statusCode = response.statusCode;
  Either<Errors, T> result;
  if (statusCode.isBetween(200, 299)) {
    result = successResponseProcessing(response);
  } else if (statusCode == 401) {
    result = Left(Errors.networkError(networkError: NetworkErrors.unauthorized()));
  } else if (statusCode.isBetween(400, 499)) {
    result = Left(
      Errors.networkError(
        networkError: NetworkErrors.clientError(
          errorMessage: response.body,
          code: statusCode,
        ),
      ),
    );
  } else if (statusCode.isBetween(500, 599)) {
    result = Left(
      Errors.networkError(
        networkError: NetworkErrors.serverError(
          errorMessage: response.body,
          code: statusCode,
        ),
      ),
    );
  } else {
    result = Left(Errors.networkError(networkError: NetworkErrors(errorMessage: response.body)));
  }

  return result;
}

extension ErrorMessage on Errors {
  String getErrorMessage() => map(
        networkError: (networkError) => networkError.networkError.map(
          (value) => value.errorMessage,
          network: (error) => "Network Error",
          clientError: (error) => error.errorMessage,
          serverError: (error) => error.errorMessage,
        ),
        domainError: (domainError) => domainError.domainErrors.errorMessage,
      );
}

extension ObjectExt<T> on T {
  /// [Source](https://stackoverflow.com/a/58762538/13181948)
  R let<R>(R Function(T that) op) => op(this);
}
