import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
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
                      .map(
                        (e) => Language(
                          name: e.name,
                          timeSpent: Time(
                            minutes: e.minutes,
                            hours: e.hours,
                            decimal: e.decimal,
                          ),
                          percent: e.percent,
                        ),
                      )
                      .toList(),
                  editors: it.editors
                      .map((editor) => Editor(
                            name: editor.name,
                            timeSpent: Time(
                              minutes: editor.minutes,
                              hours: editor.hours,
                              decimal: editor.decimal,
                            ),
                            percent: editor.percent,
                          ))
                      .toList(),
                  operationSystems: it.operatingSystems
                      .map((os) => OperatingSystem(
                            name: os.name,
                            timeSpent: Time(
                              minutes: os.minutes,
                              hours: os.hours,
                              decimal: os.decimal,
                            ),
                            percent: os.percent,
                          ))
                      .toList(),
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
