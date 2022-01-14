import "dart:convert";

import "package:http/http.dart" as http;
import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/domain/errors/domain_errors.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/detailed_stats/by_project/data/dtos/project_details_dto.dart";
import "package:waka_time_app/features/detailed_stats/by_project/data/mappers/project_details_mapper.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/models/project_details.dart";

part "get_project_details_uc.freezed.dart";

part "get_project_details_uc.g.dart";

typedef _Parameters = GetProjectDetailsUCParameters;
typedef _ReturnType = Future<Either<Errors, ProjectDetails>>;

class GetProjectDetailsUC extends BaseUseCase<_Parameters, _ReturnType> {
  final http.Client _client;

  GetProjectDetailsUC({required client}) : _client = client;

  @override
  _ReturnType call(_Parameters parameters) async => await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_Parameters parameters) async =>
      await _client.get(ApiEndpoints.getStatsForProject(parameters.toJson()));

  Either<Errors, ProjectDetails> _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final projectDetailsDTO = ProjectDetailsDTO.fromJson(jsonMap);
    final projectDetailsList = ProjectDetailsMapper().fromDto(projectDetailsDTO);
    return projectDetailsList.length == 1
        ? Right(projectDetailsList.first)
        : const Left(Errors.domainError(
            domainErrors: DomainErrors(errorMessage: "More than 1 project with given name"),
          ));
  }
}

@freezed
class GetProjectDetailsUCParameters extends BaseUseCaseParameters
    with _$GetProjectDetailsUCParameters {
  const factory GetProjectDetailsUCParameters({
    @JsonKey(name: "api_key") required String apiKey,
    required String project,
  }) = _GetProjectDetailsUCParameters;

  factory GetProjectDetailsUCParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProjectDetailsUCParametersFromJson(json);
}