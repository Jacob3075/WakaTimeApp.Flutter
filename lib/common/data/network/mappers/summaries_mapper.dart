import "package:waka_time_app/common/data/network/dtos/common_dtos.dart";
import "package:waka_time_app/common/data/network/dtos/summaries_dto.dart";
import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_systems.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class SummariesMapper extends BaseDtoMapper<Summaries, SummariesDTO> {
  @override
  Summaries fromDto(SummariesDTO dto) => Summaries(
        totalTime: dto.cumulativeTotal.totalTimeSpent,
        dailyStats: _getDailyStatsFromDTO(dto.data),
        range: StatsRange(
          startDate: DateTime.parse(dto.start),
          endDate: DateTime.parse(dto.end),
        ),
      );

  List<DailyStats> _getDailyStatsFromDTO(List<DataDTO> dtos) => dtos
      .map(
        (data) => DailyStats(
          timeSpent: data.grandTotal.timeSpent,
          projectsWorkedOn: data.projects
              .map(
                (project) => Project(
                  time: Time(
                    hours: project.hours,
                    minutes: project.minutes,
                    decimal: project.decimal,
                  ),
                  name: project.name,
                  percent: project.percent,
                ),
              )
              .toList(),
          languages:
              Languages(data.languages.map((language) => language.convertToModel()).toList()),
          editors: data.editors.map((editor) => editor.convertToModel()).toList(),
          operatingSystems: OperatingSystems(
            data.operatingSystems.map((os) => os.convertToModel()).toList(),
          ),
          date: DateTime.parse(data.range.date),
        ),
      )
      .toList();

  @override
  SummariesDTO fromModel(Summaries model) => throw UnimplementedError();
}
