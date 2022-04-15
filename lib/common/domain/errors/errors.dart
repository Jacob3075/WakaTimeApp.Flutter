import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/errors/domain_errors.dart";
import "package:waka_time_app/common/domain/errors/network_errors.dart";

part "errors.freezed.dart";
part "errors.g.dart";

@freezed
class Errors with _$Errors {
  const Errors._();

  const factory Errors.networkError(NetworkErrors networkError) = NetworkError;

  const factory Errors.domainError(DomainErrors domainError) = DomainError;

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  String getErrorMessage() => map(
        networkError: (networkError) => networkError.networkError.map(
          (value) => value.errorMessage,
          noConnection: (error) => "No Network Connection",
          clientError: (error) => "Client Error: ${error.errorMessage}",
          serverError: (error) => "Server Error: ${error.errorMessage}",
        ),
        domainError: (domainError) => domainError.domainError.errorMessage,
      );
}
