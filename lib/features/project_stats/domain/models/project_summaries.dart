import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class ProjectSummaries {
  final Time totalTime;
  final List<DailyProjectStats> dailyProjectStats;
  final StatsRange range;
  late final Languages languages;

  ProjectSummaries({
    required this.totalTime,
    required this.dailyProjectStats,
    required this.range,
  }) {
    languages = Languages(
      dailyProjectStats
          .expand((it) => it.languages.values)
          .groupFoldBy<String, Language>(
            (it) => it.name,
            (it1, it2) {
              final timeSpent = (it1?.timeSpent ?? Time.zero) + it2.timeSpent;
              return Language(
                name: (it2).name,
                timeSpent: timeSpent,
                percent: ((timeSpent.decimal / totalTime.decimal) * 100).roundToDecimal(2),
              );
            },
          )
          .values
          .sortedBy<num>((element) => element.timeSpent.decimal)
          .reversed
          .toList(),
    );
  }

  Time get averageTime => totalTime / daysWorked.totalDays;

  DaysWorked get daysWorked {
    final totalDays = dailyProjectStats.where((element) => element.timeSpent.decimal != 0).length;
    return DaysWorked(months: totalDays ~/ 30, days: totalDays % 30);
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ProjectSummaries &&
          const DeepCollectionEquality().equals(other.totalTime, totalTime) &&
          const DeepCollectionEquality().equals(other.dailyProjectStats, dailyProjectStats) &&
          const DeepCollectionEquality().equals(other.range, range));

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalTime),
      const DeepCollectionEquality().hash(dailyProjectStats),
      const DeepCollectionEquality().hash(range));
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
