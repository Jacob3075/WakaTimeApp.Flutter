import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import 'package:waka_time_app/common/utils/extensions.dart';
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

part "project_summaries.freezed.dart";
part "project_summaries.g.dart";

@freezed
class ProjectSummaries with _$ProjectSummaries {
  const ProjectSummaries._();

  const factory ProjectSummaries({
    required Time totalTime,
    required List<DailyProjectStats> dailyProjectStats,
    required StatsRange range,
  }) = _ProjectSummaries;

  factory ProjectSummaries.fromJson(Map<String, dynamic> json) => _$ProjectSummariesFromJson(json);

  Time get averageTime => totalTime / daysWorked.totalDays;

  DaysWorked get daysWorked {
    final totalDays = dailyProjectStats.where((element) => element.timeSpent.decimal != 0).length;
    return DaysWorked(months: totalDays ~/ 30, days: totalDays % 30);
  }

  List<Language> languagesUsed() => dailyProjectStats
      .expand((it) => it.languages)
      .groupFoldBy(
        (it) => it.name,
        (it1, it2) {
          final timeSpent = ((it1 as Language?)?.timeSpent ?? Time.zero) + it2.timeSpent;
          return Language(
            name: (it2).name,
            timeSpent: timeSpent,
            percent: ((timeSpent.decimal / totalTime.decimal) * 100).roundToDecimal(2),
          );
        },
      )
      .values
      .toList();
}

@freezed
class DaysWorked with _$DaysWorked {
  const DaysWorked._();

  const factory DaysWorked({
    required int days,
    required int months,
  }) = _DaysWorked;

  factory DaysWorked.fromJson(Map<String, dynamic> json) => _$DaysWorkedFromJson(json);

  int get totalDays => (months * 30) + days;

  String formattedPrint() => "${months}M, ${days}D";
}
