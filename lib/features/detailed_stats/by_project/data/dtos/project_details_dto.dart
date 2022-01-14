import "package:freezed_annotation/freezed_annotation.dart";

part "project_details_dto.freezed.dart";
part "project_details_dto.g.dart";

@freezed
class ProjectDetailsDTO with _$ProjectDetailsDTO {
  const factory ProjectDetailsDTO({
    required List<ProjectDataDTO> data,
    required int page,
    required int total,
    @JsonKey(name: "prev_page") required int prevPage,
    @JsonKey(name: "next_page") required int nextPage,
    @JsonKey(name: "total_pages") required int totalPages,
  }) = _ProjectDetailsDTO;

  factory ProjectDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsDTOFromJson(json);
}

@freezed
class ProjectDataDTO with _$ProjectDataDTO {
  const factory ProjectDataDTO({
    required String? badge,
    required String id,
    required String name,
    required RepositoryDTO? repository,
    required String url,
    @JsonKey(name: "last_heartbeat_at") required String lastHeartbeatAt,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "has_public_url") required bool hasPublicUrl,
    @JsonKey(name: "human_readable_last_heartbeat_at") required String humanReadableLastHeartbeatAt,
    @JsonKey(name: "urlencoded_name") required String urlencodedName,
  }) = _ProjectDataDTO;

  factory ProjectDataDTO.fromJson(Map<String, dynamic> json) => _$ProjectDataDTOFromJson(json);
}

@freezed
class RepositoryDTO with _$RepositoryDTO {
  const factory RepositoryDTO({
    required String? badge,
    required String description,
    required String? homepage,
    required String id,
    required String name,
    required String provider,
    required String url,
    @JsonKey(name: "star_count") required int starCount,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "default_branch") required String defaultBranch,
    @JsonKey(name: "fork_count") required int forkCount,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "html_url") required String htmlUrl,
    @JsonKey(name: "image_icon_url") required String imageIconUrl,
    @JsonKey(name: "is_fork") required bool isFork,
    @JsonKey(name: "is_private") required bool isPrivate,
    @JsonKey(name: "last_synced_at") required String? lastSyncedAt,
    @JsonKey(name: "modified_at") required String modifiedAt,
    @JsonKey(name: "urlencoded_name") required String urlencodedName,
    @JsonKey(name: "wakatime_project_name") required String wakatimeProjectName,
    @JsonKey(name: "watch_count") required int watchCount,
  }) = _RepositoryDTO;

  factory RepositoryDTO.fromJson(Map<String, dynamic> json) => _$RepositoryDTOFromJson(json);
}
