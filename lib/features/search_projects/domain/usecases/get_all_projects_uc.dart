import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/dtos/project_details_dto.dart";
import "package:waka_time_app/common/data/network/mappers/project_details_mapper.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";

typedef _P = GetAllProjectsUCParameters;
typedef _R = Either<Errors, List<ProjectDetails>>;

@singleton
class GetAllProjectsUC extends BaseUseCase<_P, _R> {
  final http.Client _client;

  GetAllProjectsUC({required http.Client client}) : _client = client;

  // TODO: HANDLE PAGINATED DATA
  @override
  call(_P parameters) async => await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_P parameters) async =>
      await _client.get(ApiEndpoints.getAllProjects(parameters.apiKey));

  _R _successResponseProcessing(http.Response response) {
    final jsonMap = jsonDecode(response.body);
    final projectDetailsDTO = ProjectDetailsDTO.fromJson(jsonMap);
    final projectDetailsList = ProjectDetailsMapper().fromDto(projectDetailsDTO);

    return Right(projectDetailsList);
  }
}

class GetAllProjectsUCParameters extends BaseUseCaseParameters {
  final String apiKey;

  const GetAllProjectsUCParameters({required this.apiKey});
}
