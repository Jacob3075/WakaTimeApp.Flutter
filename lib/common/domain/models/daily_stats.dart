import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "daily_stats.freezed.dart";

@freezed
class DailyStats with _$DailyStats, EditorStats, OperatingSystemStats {
  const DailyStats._();

  const factory DailyStats({
    required Time timeSpent,
    required List<Project> projectsWorkedOn,
    required Languages languages,
    required List<Editor> editors,
    required List<OperatingSystem> operatingSystems,
    required DateTime date,
  }) = _DailyStats;
}
