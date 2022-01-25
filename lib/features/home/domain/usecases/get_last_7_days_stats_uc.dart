import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/dtos/summaries_dto.dart";
import "package:waka_time_app/common/data/network/mappers/summaries_mapper.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";

typedef _Parameters = GetLast7DaysStatsUCParameters;
typedef _ReturnType = Future<Either<Errors, Summaries>>;

@singleton
class GetLast7DaysStatsUC extends BaseUseCase<_Parameters, _ReturnType> {
  final http.Client _client;

  GetLast7DaysStatsUC({required http.Client client}) : _client = client;

  @override
  _ReturnType call(_Parameters parameters) async => await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_Parameters parameters) async =>
      await _client.get(ApiEndpoints.getWeeklyStats(parameters.apiKey));

  Either<Errors, Summaries> _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final SummariesDTO summariesDTO = SummariesDTO.fromJson(jsonMap);
    return Right(SummariesMapper().fromDto(summariesDTO));
  }
}

class GetLast7DaysStatsUCParameters extends BaseUseCaseParameters {
  final String apiKey;

  const GetLast7DaysStatsUCParameters({required this.apiKey});
}
