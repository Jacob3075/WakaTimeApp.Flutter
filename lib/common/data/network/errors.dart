import "package:freezed_annotation/freezed_annotation.dart";

part "errors.freezed.dart";

@freezed
class Errors with _$Errors {
  const factory Errors({required String errorMessage}) = Data;

  const factory Errors.network() = _Network;

  factory Errors.unauthorized() =>
      const _ClientError(errorMessage: "Unauthorized", code: 401);

  const factory Errors.clientError({
    required String errorMessage,
    required int code,
  }) = _ClientError;

  const factory Errors.serverError({
    required String errorMessage,
    required int code,
  }) = _ServerError;
}
