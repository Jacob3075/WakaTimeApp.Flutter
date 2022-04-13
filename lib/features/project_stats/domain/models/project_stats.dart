import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class ProjectStats {
  final Time totalTime;
  final List<DailyProjectStats> dailyProjectStats;
  final StatsRange range;
  final Languages languages;
  final OperatingSystems operatingSystems;
  final Editors editors;

  @override
  String toString() =>
      "ProjectSummaries(totalTime:$totalTime, dailyProjectStats: dailyProjectStats, $range: range,"
      " languages: $languages, operatingSystems: $operatingSystems, editors: $editors)";

  ProjectStats({
    required this.totalTime,
    required Iterable<DailyProjectStats> dailyProjectStats,
    required this.range,
    required this.languages,
    required this.operatingSystems,
    required this.editors,
  }) : dailyProjectStats = dailyProjectStats.toList(growable: false);

  Time get averageTime => totalTime / daysWorked.totalDays;

  DaysWorked get daysWorked {
    final totalDays = dailyProjectStats.where((element) => element.timeSpent.decimal != 0).length;
    return DaysWorked(months: totalDays ~/ 30, days: totalDays % 30);
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ProjectStats &&
          const DeepCollectionEquality().equals(other.totalTime, totalTime) &&
          const DeepCollectionEquality().equals(other.dailyProjectStats, dailyProjectStats) &&
          const DeepCollectionEquality().equals(other.languages, languages) &&
          const DeepCollectionEquality().equals(other.operatingSystems, operatingSystems) &&
          const DeepCollectionEquality().equals(other.editors, editors) &&
          const DeepCollectionEquality().equals(other.range, range));

  @override
  int get hashCode => Object.hash(
    runtimeType,
        const DeepCollectionEquality().hash(totalTime),
        const DeepCollectionEquality().hash(dailyProjectStats),
        const DeepCollectionEquality().hash(languages),
        const DeepCollectionEquality().hash(operatingSystems),
        const DeepCollectionEquality().hash(editors),
        const DeepCollectionEquality().hash(range),
      );
}

class DaysWorked {
  final int days;
  final int months;

  const DaysWorked({
    required this.days,
    required this.months,
  });

  int get totalDays => (months * 30) + days;

  String formattedPrint() => "${months}M, ${days}D";
}
