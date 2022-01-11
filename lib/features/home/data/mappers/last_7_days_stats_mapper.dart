import "package:collection/collection.dart";
import "package:waka_time_app/common/data/network/base_dto_mapper.dart";
import "package:waka_time_app/common/data/network/common_dtos.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/features/home/data/dtos/last_7_days_stats_dto.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";
import "package:waka_time_app/features/home/domain/models/last_7_days_stats.dart";

class Last7DaysStatsMapper extends BaseDtoMapper<Last7DaysStats, Last7DaysStatsDTO> {
  @override
  Last7DaysStats fromDto(Last7DaysStatsDTO dto) => Last7DaysStats(
        totalTime: _getTotalTimeFromDTO(dto),
        dailyStats: _getDailyStatsFromDTO(dto.data),
        range: StatsRange(
          startDate: DateTime.now(),
          endDate: DateTime.now(),
        ),
      );

  Time _getTotalTimeFromDTO(Last7DaysStatsDTO dto) => dto.data.map((item) => item.grandTotal).fold(
        const Time(
          decimal: 0,
          minutes: 0,
          hours: 0,
        ),
        (Time previousValue, element) =>
            previousValue +
            Time(
              hours: element.hours,
              minutes: element.minutes,
              decimal: element.decimal,
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
              "",
          mostUsedEditor:
              data.editors.sortedBy<num>((element) => element.decimal).reversed.firstOrNull?.name ??
                  "",
          mostUsedOs: data.operatingSystems
                  .sortedBy<num>((element) => element.decimal)
                  .reversed
                  .firstOrNull
                  ?.name ??
              "",
          date: DateTime.now(),
        ),
      )
      .toList();

  @override
  Last7DaysStatsDTO fromModel(Last7DaysStats model) => throw UnimplementedError();
}
