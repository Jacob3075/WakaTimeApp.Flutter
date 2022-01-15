import "package:waka_time_app/common/data/network/dtos/common_dtos.dart";
import "package:waka_time_app/common/data/network/dtos/summaries_dto.dart";
import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/data/network/mappers/summaries_mapper.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/features/detailed_stats/by_project/data/dtos/project_summaries_dto.dart";

class ProjectSummariesMapper extends BaseDtoMapper<Summaries, ProjectSummariesDTO> {
  @override
  Summaries fromDto(ProjectSummariesDTO dto) =>
      SummariesMapper().fromDto(_mapProjectSummariesToSummaries(dto));

  SummariesDTO _mapProjectSummariesToSummaries(ProjectSummariesDTO dto) => SummariesDTO(
        cumulativeTotal: dto.cumulativeTotal,
        data: dto.data
            .map((it) => DataDTO(
                  machines: it.machines,
                  languages: it.languages,
                  editors: it.editors,
                  dependencies: it.dependencies,
                  projects: List.empty(growable: false),
                  categories: it.categories,
                  operatingSystems: it.operatingSystems,
                  range: it.range,
                  grandTotal: it.grandTotal,
                ))
            .toList(),
        end: dto.end,
        start: dto.start,
      );

  @override
  ProjectSummariesDTO fromModel(Summaries model) => throw UnimplementedError();
}
