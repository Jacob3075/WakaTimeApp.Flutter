import "package:freezed_annotation/freezed_annotation.dart";

part "domain_errors.freezed.dart";
part "domain_errors.g.dart";

@freezed
class DomainErrors with _$DomainErrors {
  const factory DomainErrors({required String errorMessage}) = DomainErrorData;

  const factory DomainErrors.invalidData({required String errorMessage}) = InvalidData;

  const factory DomainErrors.dateRangeTooLarge({required String errorMessage}) = DateRangeTooLarge;

  factory DomainErrors.fromJson(Map<String, dynamic> json) => _$DomainErrorsFromJson(json);
}
