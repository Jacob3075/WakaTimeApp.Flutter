import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/common/domain/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/home/data/dtos/daily_stats_dto.dart";
import "package:waka_time_app/features/home/data/mappers/daily_stats_mapper.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

class GetDailyStatsUC
    extends BaseUseCase<GetDailyStatsUCParameters, Future<Either<Errors, DailyStats>>> {
  final http.Client _client;

  GetDailyStatsUC({required http.Client client}) : _client = client;

  @override
  Future<Either<Errors, DailyStats>> call(GetDailyStatsUCParameters parameters) async =>
      getDataOrErrorFromApi<DailyStats>(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(GetDailyStatsUCParameters parameters) async =>
      await _client.get(ApiEndpoints.getDailyStats(parameters.apiKey));

  Either<Errors, DailyStats> _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    final DailyStatsDTO dailyStatsDTO = DailyStatsDTO.fromJson(jsonMap);
    return Right(DailyStatsMapper().fromDto(dailyStatsDTO));
  }
}

class GetDailyStatsUCParameters extends BaseUseCaseParameters {
  final String apiKey;

  const GetDailyStatsUCParameters({required this.apiKey});
}
