import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";

part "daily_stats.freezed.dart";
part "daily_stats.g.dart";

@freezed
class DailyStats with _$DailyStats, LanguageStats, EditorStats, OperatingSystemStats {
  const DailyStats._();

  const factory DailyStats({
    required Time timeSpent,
    required List<Project> projectsWorkedOn,
    required List<Language> languages,
    required List<Editor> editors,
    required List<OperatingSystem> operatingSystems,
    required DateTime date,
  }) = _DailyStats;

  factory DailyStats.fromJson(Map<String, dynamic> json) => _$DailyStatsFromJson(json);
}
