import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

class Get7DaysStatsUC extends BaseUseCase<GetWeeklyStatsUCParameters, void> {
  final http.Client _client;

  Get7DaysStatsUC({required http.Client client}) : _client = client;

  @override
  void call(GetWeeklyStatsUCParameters parameters) {
    getDataOrErrorFromApi<DailyStats>(
      apiCall: () => _apiCall(parameters),
      successResponseProcessing: _successResponseProcessing,
    );
  }

  Future<http.Response> _apiCall(GetWeeklyStatsUCParameters parameters) async =>
      await _client.get(ApiEndpoints.getWeeklyStats(parameters.apiKey));

  Either<Errors, DailyStats> _successResponseProcessing(
    http.Response response,
  ) {
    final jsonMap = jsonDecode(response.body);
    // final DailyStatsDTO dailyStatsDTO = DailyStatsDTO.fromJson(jsonMap);
    // return Right(DailyStatsMapper().fromDto(dailyStatsDTO));
    throw UnimplementedError();
  }
}

class GetWeeklyStatsUCParameters extends BaseUseCaseParameters {
  final String apiKey;

  const GetWeeklyStatsUCParameters(this.apiKey);
}
