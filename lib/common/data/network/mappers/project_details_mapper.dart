import "package:waka_time_app/common/data/network/dtos/project_details_dto.dart";
import "package:waka_time_app/common/data/network/mappers/base_dto_mapper.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class ProjectDetailsMapper extends BaseDtoMapper<List<ProjectDetails>, ProjectDetailsDTO> {
  @override
  List<ProjectDetails> fromDto(ProjectDetailsDTO dto) => dto.data
      .map(
        (it) => ProjectDetails(
      id: it.id,
          projectName: it.name,
          createdDate: DateTime.parse(it.createdAt),
          lastHeartBeat: it.lastHeartbeatAt?.let(DateTime.parse),
        ),
      )
      .toList();

  @override
  ProjectDetailsDTO fromModel(List<ProjectDetails> model) => throw UnimplementedError();
}
