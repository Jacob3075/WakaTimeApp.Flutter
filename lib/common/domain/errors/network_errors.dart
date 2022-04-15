import "package:freezed_annotation/freezed_annotation.dart";

part "network_errors.freezed.dart";
part "network_errors.g.dart";

@freezed
class NetworkErrors with _$NetworkErrors {
  const factory NetworkErrors({required String errorMessage}) = NetworkErrorData;

  const factory NetworkErrors.noConnection() = NoConnection;

  factory NetworkErrors.unauthorized() =>
      const ClientError(errorMessage: "Unauthorized", code: 401);

  const factory NetworkErrors.clientError({
    required String errorMessage,
    required int code,
  }) = ClientError;

  const factory NetworkErrors.serverError({
    required String errorMessage,
    required int code,
  }) = ServerError;

  factory NetworkErrors.fromJson(Map<String, dynamic> json) => _$NetworkErrorsFromJson(json);
}
