import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_summaries_dto.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";

class ProjectSummariesMapper extends BaseDtoMapper<ProjectSummaries, ProjectSummariesDTO> {
  @override
  ProjectSummaries fromDto(ProjectSummariesDTO dto) => ProjectSummaries(
        dailyProjectStats: dto.data
            .map((it) => DailyProjectStats(
                  timeSpent: it.grandTotal.timeSpent,
                  entities: [],
                  languages: it.languages
                      .map((language) => language.convertToModel())
                      .let((it) => Languages(it)),
                  editors:
                      it.editors.map((editor) => editor.convertToModel()).let((it) => Editors(it)),
                  operatingSystems: it.operatingSystems
                      .map((os) => os.convertToModel())
                      .let((it) => OperatingSystems(it)),
                  date: DateTime.parse(it.range.date),
                ))
            .toList(),
        range: StatsRange(
          startDate: DateTime.parse(dto.start),
          endDate: DateTime.parse(dto.end),
        ),
        totalTime: dto.cumulativeTotal.totalTimeSpent,
      );

  @override
  ProjectSummariesDTO fromModel(ProjectSummaries model) => throw UnimplementedError();
}
