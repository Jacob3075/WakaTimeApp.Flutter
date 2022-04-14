import "dart:io";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/errors/network_errors.dart";
import "package:waka_time_app/common/utils/extensions.dart";

/// Calls the [apiCall] function, if it throws an exception they are handled.
/// If no exceptions are thrown then the response status code is checked,
/// if it is in 200s series then [successResponseProcessing] is called
/// and appropriate response is returned
Future<Either<Errors, T>> getDataOrErrorFromApi<T>({
  required Future<http.Response> Function() apiCall,
  required Either<Errors, T> Function(http.Response response) successResponseProcessing,
}) async {
  try {
    return _getDataOrErrorFromResponse(
      response: await apiCall(),
      successResponseProcessing: successResponseProcessing,
    );
  } on SocketException {
    return const Left(Errors.networkError(NetworkErrors.noConnection()));
  } on HttpException {
    return const Left(Errors.networkError(NetworkErrors.noConnection()));
  } on FormatException catch (exception) {
    return Left(
      Errors.networkError(NetworkErrors(errorMessage: "Format Exception, ${exception.message}")),
    );
  } on Exception catch (exception) {
    return Left(
      Errors.networkError(NetworkErrors(errorMessage: "Exception: ${exception.toString()}")),
    );
  }
}

Either<Errors, T> _getDataOrErrorFromResponse<T>({
  required http.Response response,
  required Either<Errors, T> Function(http.Response response) successResponseProcessing,
}) {
  final statusCode = response.statusCode;
  if (statusCode.isBetween(200, 299)) return successResponseProcessing(response);

  if (statusCode == 401) return Left(Errors.networkError(NetworkErrors.unauthorized()));

  if (statusCode.isBetween(400, 499)) {
    return Left(
      Errors.networkError(
        NetworkErrors.clientError(
          errorMessage: "Client Error: ${response.body}",
          code: statusCode,
        ),
      ),
    );
  }

  if (statusCode.isBetween(500, 599)) {
    return Left(
      Errors.networkError(
        NetworkErrors.serverError(
          errorMessage: "Server Error: ${response.body}",
          code: statusCode,
        ),
      ),
    );
  }

  return Left(Errors.networkError(NetworkErrors(errorMessage: response.body)));
}
