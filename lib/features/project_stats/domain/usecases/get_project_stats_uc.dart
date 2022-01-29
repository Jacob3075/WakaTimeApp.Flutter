import "dart:convert";

import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_summaries_dto.dart";
import "package:waka_time_app/features/project_stats/data/mappers/project_summaries_mapper.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";

part "get_project_stats_uc.freezed.dart";
part "get_project_stats_uc.g.dart";

typedef _Parameters = GetProjectStatsUCParameters;
typedef _ReturnType = Either<Errors, ProjectSummaries>;

@singleton
class GetProjectStatsUC extends BaseUseCase<_Parameters, Future<_ReturnType>> {
  final http.Client _client;

  GetProjectStatsUC({required http.Client client}) : _client = client;

  @override
  Future<_ReturnType> call(_Parameters parameters) async => await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_Parameters parameters) async =>
      await _client.get(ApiEndpoints.getStatsForProject(parameters.toJson()));

  _ReturnType _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final dailyStatsDTO = ProjectSummariesDTO.fromJson(jsonMap);
    return Right(ProjectSummariesMapper().fromDto(dailyStatsDTO));
  }
}

@freezed
class GetProjectStatsUCParameters extends BaseUseCaseParameters
    with _$GetProjectStatsUCParameters {
  const factory GetProjectStatsUCParameters({
    @JsonKey(name: "api_key") required String apiKey,
    required String start,
    required String end,
    required String project,
  }) = _GetProjectStatsUCParameters;

  factory GetProjectStatsUCParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProjectStatsUCParametersFromJson(json);
}
