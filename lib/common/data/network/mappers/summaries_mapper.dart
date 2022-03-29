import "package:waka_time_app/common/data/network/dtos/common_dtos.dart";
import "package:waka_time_app/common/data/network/dtos/summaries_dto.dart";
import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

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
                    totalSeconds: project.totalSeconds,
                    decimal: project.decimal,
                  ),
                  name: project.name,
                  percent: project.percent,
                ),
              )
              .toList(),
          languages: data.languages
              .map((language) => language.convertToModel(data.grandTotal.totalSeconds))
              .let(Languages.new),
          editors: data.editors
              .map((editor) => editor.convertToModel(data.grandTotal.totalSeconds))
              .let(Editors.new),
          operatingSystems: data.operatingSystems
              .map((os) => os.convertToModel(data.grandTotal.totalSeconds))
              .let(OperatingSystems.new),
          date: DateTime.parse(data.range.date),
        ),
      )
      .toList();

  @override
  SummariesDTO fromModel(Summaries model) => throw UnimplementedError();
}
