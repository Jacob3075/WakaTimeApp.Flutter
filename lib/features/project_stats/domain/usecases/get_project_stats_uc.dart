import "dart:convert";

import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_summaries_dto.dart";
import "package:waka_time_app/features/project_stats/data/mappers/project_stats_mapper.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";

part "get_project_stats_uc.freezed.dart";

part "get_project_stats_uc.g.dart";

typedef _P = GetProjectStatsUCParameters;
typedef _R = Either<Errors, ProjectStats>;

@singleton
class GetProjectStatsUC extends BaseUseCase<_P, _R> {
  final http.Client _client;

  GetProjectStatsUC({required http.Client client}) : _client = client;

  @override
  call(_P parameters) async => await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_P parameters) async =>
      await _client.get(ApiEndpoints.getStatsForProject(parameters.toJson()));

  _R _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final dailyStatsDTO = ProjectSummariesDTO.fromJson(jsonMap);
    return Right(ProjectStatsMapper().fromDto(dailyStatsDTO));
  }
}

class GetProjectStatsUCParameters extends BaseUseCaseParameters {
  final String apiKey;
  final DateTime start;
  final DateTime end;
  final String project;
  final _formatter = DateFormat("yyyy-MM-dd");

  String get startDateString => _formatter.format(start);

  String get endDateString => _formatter.format(end);

  GetProjectStatsUCParameters({
    required this.apiKey,
    required this.start,
    required this.end,
    required this.project,
  });

  factory GetProjectStatsUCParameters.fromJson(Map<String, dynamic> json) =>
      _$GetProjectStatsUCParametersFromJson(json);
}
