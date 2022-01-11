import "package:collection/collection.dart";
import "package:waka_time_app/common/data/network/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/features/home/data/dtos/daily_stats_dto.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

class DailyStatsMapper extends BaseDtoMapper<DailyStats, DailyStatsDTO> {
  @override
  DailyStats fromDto(DailyStatsDTO dto) => DailyStats(
        date: DateTime.parse(dto.data.first.range.date),
        projectsWorkedOn: _getProjectsFromDto(dto),
        timeSpent: Time(
          hours: dto.data.first.grandTotal.hours,
          minutes: dto.data.first.grandTotal.minutes,
          decimal: dto.data.first.grandTotal.decimal,
        ),
        mostUsedLanguage: dto.data.first.languages
                .sortedBy<num>((element) => element.decimal)
                .reversed
                .firstOrNull
                ?.name ??
            "",
        mostUsedEditor: dto.data.first.editors
                .sortedBy<num>((element) => element.decimal)
                .reversed
                .firstOrNull
                ?.name ??
            "",
        mostUsedOs: dto.data.first.operatingSystems
                .sortedBy<num>((element) => element.decimal)
                .reversed
                .firstOrNull
                ?.name ??
            "",
      );

  @override
  DailyStatsDTO fromModel(DailyStats model) => throw UnimplementedError();

  List<Project> _getProjectsFromDto(DailyStatsDTO dto) => dto.data.first.projects
      .map((project) => Project(
            name: project.name,
            percent: project.percent,
            time: Time(
              decimal: project.decimal,
              hours: project.hours,
              minutes: project.minutes,
            ),
          ))
      .toList(growable: false);
}
