import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";

part "daily_stats.freezed.dart";
part "daily_stats.g.dart";

@freezed
class DailyStats with _$DailyStats {
  const factory DailyStats({
    required Time timeSpent,
    required List<Project> projectsWorkedOn,
    required String mostUsedLanguage,
    required String mostUsedEditor,
    required String mostUsedOs,
    required DateTime date,
  }) = _DailyStats;

  factory DailyStats.fromJson(Map<String, dynamic> json) => _$DailyStatsFromJson(json);
}
