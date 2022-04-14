import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_summaries_dto.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";

class ProjectStatsMapper extends BaseDtoMapper<ProjectStats, ProjectSummariesDTO> {
  late final Time _totalTime;

  @override
  ProjectStats fromDto(ProjectSummariesDTO dto) {
    _totalTime = dto.cumulativeTotal.totalTimeSpent;
    final dailyProjectStats = dto.data.map((it) => DailyProjectStats(
          timeSpent: it.grandTotal.timeSpent,
          entities: [],
          languages: it.languages
              .map((language) => language.convertToModel(it.grandTotal.totalSeconds))
              .let(Languages.new),
          editors: it.editors
              .map((editor) => editor.convertToModel(it.grandTotal.totalSeconds))
              .let(Editors.new),
          operatingSystems: it.operatingSystems
              .map((os) => os.convertToModel(it.grandTotal.totalSeconds))
              .let(OperatingSystems.new),
          date: DateTime.parse(it.range.date),
        ));

    return ProjectStats(
      totalTime: _totalTime,
      dailyProjectStats: dailyProjectStats,
      languages: _extractLanguages(dailyProjectStats),
      editors: _extractEditors(dailyProjectStats),
      operatingSystems: _extractOperatingSystems(dailyProjectStats),
      range: StatsRange(
        startDate: DateTime.parse(dto.start),
        endDate: DateTime.parse(dto.end),
      ),
    );
  }

  Languages _extractLanguages(Iterable<DailyProjectStats> dailyProjectStats) => dailyProjectStats
      .expand((element) => element.languages.values)
      .map(_updatePercentOfStat)
      .let(Languages.mergeDuplicates);

  OperatingSystems _extractOperatingSystems(Iterable<DailyProjectStats> dailyProjectStats) =>
      dailyProjectStats
          .expand((element) => element.operatingSystems.values)
          .map(_updatePercentOfStat)
          .let(OperatingSystems.mergeDuplicates);

  Editors _extractEditors(Iterable<DailyProjectStats> dailyProjectStats) => dailyProjectStats
      .expand((element) => element.editors.values)
      .map(_updatePercentOfStat)
      .let(Editors.mergeDuplicates);

  T _updatePercentOfStat<T extends SecondaryStat>(T it) => it.copyWith(
        percent: Percent(it.percent.numerator, _totalTime.totalSeconds),
      ) as T;

  @override
  ProjectSummariesDTO fromModel(ProjectStats model) => throw UnimplementedError();
}