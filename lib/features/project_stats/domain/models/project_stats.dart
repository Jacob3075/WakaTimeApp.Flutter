import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";

part "project_stats.freezed.dart";
part "project_stats.g.dart";

@freezed
class ProjectStats with _$ProjectStats {
  const factory ProjectStats({
    required Time timeSpent,
    required List<Entity> entities,
    required String mostUsedLanguage,
    required String mostUsedEditor,
    required String mostUsedOs,
    required DateTime date,
  }) = _ProjectStats;

  factory ProjectStats.fromJson(Map<String, dynamic> json) => _$ProjectStatsFromJson(json);
}
