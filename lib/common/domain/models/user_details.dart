import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";

part "user_details.freezed.dart";
part "user_details.g.dart";

@freezed
@JsonSerializable()
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

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  factory UserDetails.fromJsonString(String jsonString) =>
      _$_UserDetails.fromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
