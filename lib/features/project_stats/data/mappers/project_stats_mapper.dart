import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_summaries_dto.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";

class ProjectStatsMapper extends BaseDtoMapper<ProjectStats, ProjectSummariesDTO> {

  @override
  ProjectStats fromDto(ProjectSummariesDTO dto) {
    final totalTime = dto.cumulativeTotal.totalTimeSpent;
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
      totalTime: totalTime,
      dailyProjectStats: dailyProjectStats,
      languages: dailyProjectStats
          .expand((element) => element.languages.values)
          .let((stats) => Languages.mergeDuplicates(stats, totalTime)),
      editors: dailyProjectStats
          .expand((element) => element.editors.values)
          .let((stats) => Editors.mergeDuplicates(stats, totalTime)),
      operatingSystems: dailyProjectStats
          .expand((element) => element.operatingSystems.values)
          .let((stats) => OperatingSystems.mergeDuplicates(stats, totalTime)),
      range: StatsRange(
        startDate: DateTime.parse(dto.start),
        endDate: DateTime.parse(dto.end),
      ),
    );
  }

  @override
  ProjectSummariesDTO fromModel(ProjectStats model) => throw UnimplementedError();
}
