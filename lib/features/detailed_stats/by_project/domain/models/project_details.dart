import "package:freezed_annotation/freezed_annotation.dart";

part "project_details.freezed.dart";
part "project_details.g.dart";

@freezed
class ProjectDetails with _$ProjectDetails {
  const factory ProjectDetails({
    required String projectName,
    required DateTime createdDate,
    required DateTime lastHeartBeat,
    required String id,
  }) = _ProjectDetails;

  factory ProjectDetails.fromJson(Map<String, dynamic> json) => _$ProjectDetailsFromJson(json);
}
