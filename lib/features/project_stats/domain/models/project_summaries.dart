import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class ProjectSummaries {
  final Time totalTime;
  final List<DailyProjectStats> dailyProjectStats;
  final StatsRange range;
  late final Languages languages;
  late final OperatingSystems operatingSystems;
  late final Editors editors;

  ProjectSummaries({
    required this.totalTime,
    required this.dailyProjectStats,
    required this.range,
  }) {
    languages = _extractLanguages();
    operatingSystems = _extractOperatingSystems();
    editors = _extractEditors();
  }

  Time get averageTime => totalTime / daysWorked.totalDays;

  DaysWorked get daysWorked {
    final totalDays = dailyProjectStats.where((element) => element.timeSpent.decimal != 0).length;
    return DaysWorked(months: totalDays ~/ 30, days: totalDays % 30);
  }

  Languages _extractLanguages() => dailyProjectStats
      .expand((element) => element.languages.values)
      .map((it) => it.updatePercentDenominator(totalTime.decimal))
      .let(Languages.mergeDuplicates);

  OperatingSystems _extractOperatingSystems() => dailyProjectStats
      .expand((element) => element.operatingSystems.values)
      .map((it) => it.updatePercentDenominator(totalTime.decimal))
      .let(OperatingSystems.mergeDuplicates);

  Editors _extractEditors() => dailyProjectStats
      .expand((element) => element.editors.values)
      .map((it) => it.updatePercentDenominator(totalTime.decimal))
      .let(Editors.mergeDuplicates);

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is ProjectSummaries &&
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
