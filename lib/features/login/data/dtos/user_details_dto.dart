// ignore_for_file: invalid_annotation_target

import "package:freezed_annotation/freezed_annotation.dart";

part "user_details_dto.freezed.dart";
part "user_details_dto.g.dart";

@freezed
class UserDetailsDTO with _$UserDetailsDTO {
  const factory UserDetailsDTO(Data data) = _UserDetailsDTO;

  factory UserDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsDTOFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data(
    String? bio,
    String email,
    String id,
    int timeout,
    String timezone,
    String username,
    @JsonKey(name: "display_name") String displayName,
    @JsonKey(name: "last_project") String lastProject,
    @JsonKey(name: "full_name") String fullName,
    @JsonKey(name: "durations_slice_by") String durationsSliceBy,
    @JsonKey(name: "created_at") String createdAt,
    @JsonKey(name: "date_format") String dateFormat,
    @JsonKey(name: "photo") String photoUrl,
  ) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
