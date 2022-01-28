import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";

part "project_summaries.freezed.dart";

part "project_summaries.g.dart";

@freezed
class ProjectSummaries with _$ProjectSummaries {
  const factory ProjectSummaries({
    required Time totalTime,
    required Time averageTime,
    required List<ProjectStats> dailyStats,
    required StatsRange range,
    required DaysWorked daysWorked,
  }) = _ProjectSummaries;

  factory ProjectSummaries.fromJson(Map<String, dynamic> json) => _$ProjectSummariesFromJson(json);
}

@freezed
class DaysWorked with _$DaysWorked {
  const factory DaysWorked({
    required int days,
    required int months,
  }) = _DaysWorked;

  factory DaysWorked.fromJson(Map<String, dynamic> json) => _$DaysWorkedFromJson(json);
}
