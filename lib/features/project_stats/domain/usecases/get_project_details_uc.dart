import "dart:convert";

import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/dtos/project_details_dto.dart";
import "package:waka_time_app/common/data/network/mappers/project_details_mapper.dart";
import "package:waka_time_app/common/domain/errors/domain_errors.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/common/utils/utils.dart";

part "get_project_details_uc.freezed.dart";
part "get_project_details_uc.g.dart";

typedef _P = GetProjectDetailsUCParameters;
typedef _R = Either<Errors, ProjectDetails>;

@singleton
class GetProjectDetailsUC extends BaseUseCase<_P, _R> {
  final http.Client _client;

  GetProjectDetailsUC({required http.Client client}) : _client = client;

  @override
  call(_P parameters) async => await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_P parameters) async =>
      await _client.get(ApiEndpoints.getProjectDetails(parameters.toJson()));

  _R _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final projectDetailsDTO = ProjectDetailsDTO.fromJson(jsonMap);
    final projectDetailsList = ProjectDetailsMapper().fromDto(projectDetailsDTO);

    if (projectDetailsList.isEmpty) {
      return const Left(
        Errors.domainError(DomainErrors(errorMessage: "No projects found.")),
      );
    }

    if (projectDetailsList.length == 1) return Right(projectDetailsList.first);

    final projectDetailsParameters = GetProjectDetailsUCParameters.fromResponse(response);
    return projectDetailsList
            .firstWhereOrNull((it) => it.projectName == projectDetailsParameters.project)
            ?.let(Right.new) ??
        const Left(Errors.domainError(DomainErrors(errorMessage: "No projects found.")));
  }
}

@freezed
class GetProjectDetailsUCParameters extends BaseUseCaseParameters
    with _$GetProjectDetailsUCParameters {
  const GetProjectDetailsUCParameters._();

  const factory GetProjectDetailsUCParameters({
    @JsonKey(name: "api_key") required String apiKey,
    @JsonKey(name: "q") required String project,
  }) = _GetProjectDetailsUCParameters;

  factory GetProjectDetailsUCParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProjectDetailsUCParametersFromJson(json);

  factory GetProjectDetailsUCParameters.fromResponse(http.Response response) =>
      GetProjectDetailsUCParameters.fromJson(response.request!.url.queryParameters);
}
