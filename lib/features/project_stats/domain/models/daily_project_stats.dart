import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "daily_project_stats.freezed.dart";
part "daily_project_stats.g.dart";

@freezed
class DailyProjectStats with _$DailyProjectStats, LanguageStats, OperatingSystemStats, EditorStats {
  const DailyProjectStats._();

  const factory DailyProjectStats({
    required Time timeSpent,
    required List<Entity> entities,
    required List<Language> languages,
    required List<Editor> editors,
    required List<OperatingSystem> operatingSystems,
    required DateTime date,
  }) = _DailyProjectStats;

  factory DailyProjectStats.fromJson(Map<String, dynamic> json) =>
      _$DailyProjectStatsFromJson(json);
}
