import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/home/data/dtos/last_7_days_stats_dto.dart";
import "package:waka_time_app/features/home/data/mappers/last_7_days_stats_mapper.dart";
import "package:waka_time_app/features/home/domain/models/last_7_days_stats.dart";

typedef _Parameters = GetLast7DaysStatsUCParameters;
typedef _ReturnType = Future<Either<Errors, Last7DaysStats>>;

class GetLast7DaysStatsUC extends BaseUseCase<_Parameters, _ReturnType> {
  final http.Client _client;

  GetLast7DaysStatsUC({required http.Client client}) : _client = client;

  @override
  _ReturnType call(_Parameters parameters) async {
    return await getDataOrErrorFromApi<Last7DaysStats>(
      apiCall: () => _apiCall(parameters),
      successResponseProcessing: _successResponseProcessing,
    );
  }

  Future<http.Response> _apiCall(_Parameters parameters) async =>
      await _client.get(ApiEndpoints.getWeeklyStats(parameters.apiKey));

  Either<Errors, Last7DaysStats> _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final Last7DaysStatsDTO dailyStatsDTO = Last7DaysStatsDTO.fromJson(jsonMap);
    return Right(Last7DaysStatsMapper().fromDto(dailyStatsDTO));
  }
}

class GetLast7DaysStatsUCParameters extends BaseUseCaseParameters {
  final String apiKey;

  const GetLast7DaysStatsUCParameters({required this.apiKey});
}