import "package:freezed_annotation/freezed_annotation.dart";

part "user_details.freezed.dart";

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    required String bio,
    required String email,
    required String id,
    required int timeout,
    required String timezone,
    required String username,
    required String displayName,
    required String lastProject,
    required String fullName,
    required String durationsSliceBy,
    required String createdAt,
    required String dateFormat,
    required String photoUrl,
  }) = _UserDetails;
}
