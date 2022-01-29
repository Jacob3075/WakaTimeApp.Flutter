import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";

part "daily_project_stats.freezed.dart";
part "daily_project_stats.g.dart";

@freezed
class DailyProjectStats with _$DailyProjectStats {
  const DailyProjectStats._();

  const factory DailyProjectStats({
    required Time timeSpent,
    required List<Entity> entities,
    required List<Language> languages,
    required List<Editor> editors,
    required List<OperatingSystem> operationSystems,
    required DateTime date,
  }) = _DailyProjectStats;

  factory DailyProjectStats.fromJson(Map<String, dynamic> json) =>
      _$DailyProjectStatsFromJson(json);

  Option<Language> get mostUsedLanguage => optionOf(
        languages.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull!,
      );

  Option<OperatingSystem> get mostUsedOS => optionOf(
        operationSystems
            .sortedBy<num>((element) => element.timeSpent.decimal)
            .reversed
            .firstOrNull!,
      );

  Option<Editor> get mostUsedEditor => optionOf(
        editors.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull!,
      );
}
