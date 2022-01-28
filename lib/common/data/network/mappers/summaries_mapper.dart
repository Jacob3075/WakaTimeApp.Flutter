import "package:collection/collection.dart";
import "package:waka_time_app/common/data/network/dtos/common_dtos.dart";
import "package:waka_time_app/common/data/network/dtos/summaries_dto.dart";
import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";

class SummariesMapper extends BaseDtoMapper<Summaries, SummariesDTO> {
  @override
  Summaries fromDto(SummariesDTO dto) => Summaries(
        totalTime: Time.fromDigital(dto.cumulativeTotal.digital, dto.cumulativeTotal.decimal),
        dailyStats: _getDailyStatsFromDTO(dto.data),
        range: StatsRange(
          startDate: DateTime.parse(dto.start),
          endDate: DateTime.parse(dto.end),
        ),
      );

  List<DailyStats> _getDailyStatsFromDTO(List<DataDTO> dtos) => dtos
      .map(
        (data) => DailyStats(
          timeSpent: Time(
            hours: data.grandTotal.hours,
            minutes: data.grandTotal.minutes,
            decimal: data.grandTotal.decimal,
          ),
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
          mostUsedLanguage: data.languages
                  .sortedBy<num>((element) => element.decimal)
                  .reversed
                  .firstOrNull
                  ?.name ??
              "-",
          mostUsedEditor:
              data.editors.sortedBy<num>((element) => element.decimal).reversed.firstOrNull?.name ??
                  "-",
          mostUsedOs: data.operatingSystems
                  .sortedBy<num>((element) => element.decimal)
                  .reversed
                  .firstOrNull
                  ?.name ??
              "-",
          date: DateTime.parse(data.range.date),
        ),
      )
      .toList();

  @override
  SummariesDTO fromModel(Summaries model) => throw UnimplementedError();
}
