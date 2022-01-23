import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_details_dto.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_details.dart";

class ProjectDetailsMapper extends BaseDtoMapper<List<ProjectDetails>, ProjectDetailsDTO> {
  @override
  List<ProjectDetails> fromDto(ProjectDetailsDTO dto) => dto.data
      .map(
        (it) => ProjectDetails(
          id: it.id,
          projectName: it.name,
          createdDate: DateTime.parse(it.createdAt),
          lastHeartBeat: DateTime.parse(it.lastHeartbeatAt),
        ),
      )
      .toList();

  @override
  ProjectDetailsDTO fromModel(List<ProjectDetails> model) => throw UnimplementedError();
}
