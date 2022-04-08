import "package:freezed_annotation/freezed_annotation.dart";

part "network_errors.freezed.dart";
part "network_errors.g.dart";

@freezed
class NetworkErrors with _$NetworkErrors {
  const factory NetworkErrors({required String errorMessage}) = Data;

  const factory NetworkErrors.noConnection() = _NoConnection;

  factory NetworkErrors.unauthorized() =>
      const _ClientError(errorMessage: "Unauthorized", code: 401);

  const factory NetworkErrors.clientError({
    required String errorMessage,
    required int code,
  }) = _ClientError;

  const factory NetworkErrors.serverError({
    required String errorMessage,
    required int code,
  }) = _ServerError;

  factory NetworkErrors.fromJson(Map<String, dynamic> json) => _$NetworkErrorsFromJson(json);
}
