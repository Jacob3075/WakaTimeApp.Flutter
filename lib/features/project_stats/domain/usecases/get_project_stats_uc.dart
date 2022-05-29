import "dart:async";
import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:intl/intl.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/domain/errors/domain_errors.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/project_stats/data/dtos/project_summaries_dto.dart";
import "package:waka_time_app/features/project_stats/data/mappers/project_stats_mapper.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";

typedef _P = GetProjectStatsUCParameters;
typedef _R = Either<Errors, ProjectStats>;

@singleton
class GetProjectStatsUC extends BaseUseCase<_P, _R> {
  final http.Client _client;

  GetProjectStatsUC({required http.Client client}) : _client = client;

  @override
  call(_P parameters) async => (await getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      ))
          .let((response) => _checkErrorType(response, parameters));

  Future<_R> _handleDateRangeTooLarge(_P parameters) async {
    final difference = parameters.end.difference(parameters.start).inDays / 2;

    // TODO: CREATE EXTENSION ON DATE
    final firstHalfParameters =
        parameters.updateEndDate(parameters.start.add(Duration(days: difference.toInt())));
    final secondHalfParameters =
        parameters.updateStartDate(parameters.start.add(Duration(days: difference.toInt() + 1)));

    final firstHalfFuture = _processDataForHalf(firstHalfParameters);
    final secondHalfFuture = _processDataForHalf(secondHalfParameters);

    final firstHalf = await firstHalfFuture;
    final secondHalf = await secondHalfFuture;

    if (firstHalf.isLeft()) return firstHalf;
    if (secondHalf.isLeft()) return secondHalf;

    final first = firstHalf.getRight()!;
    final second = secondHalf.getRight()!;

    return Right(_combiner(first, second));
  }

  Future<_R> _processDataForHalf(_P parameters) async {
    final half = await getDataOrErrorFromApi(
      apiCall: () => _apiCall(parameters),
      successResponseProcessing: _successResponseProcessing,
    );

    return _checkErrorType(half, parameters);
  }

  Future<_R> _checkErrorType(_R response, _P parameters) async => response.fold(
        (error) async => error.getErrorType() != DateRangeTooLarge
            ? Left(error)
            : await _handleDateRangeTooLarge(parameters),
        (data) => Right(data),
      );

  ProjectStats _combiner(ProjectStats first, ProjectStats second) => ProjectStats(
        totalTime: first.totalTime + second.totalTime,
        dailyProjectStats: first.dailyProjectStats + second.dailyProjectStats,
        range: first.range + second.range,
        languages: Languages.mergeDuplicates(
          first.languages.values + second.languages.values,
          first.totalTime + second.totalTime,
        ),
        operatingSystems: OperatingSystems.mergeDuplicates(
          first.operatingSystems.values + second.operatingSystems.values,
          first.totalTime + second.totalTime,
        ),
        editors: Editors.mergeDuplicates(
          first.editors.values + second.editors.values,
          first.totalTime + second.totalTime,
        ),
      );

  Future<http.Response> _apiCall(_P parameters) async => await _client.get(
        ApiEndpoints.getStatsForProject(
          apiKey: parameters.apiKey,
          project: parameters.project,
          start: parameters.startDateString,
          end: parameters.endDateString,
        ),
      );

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
  final DateFormat _formatter = DateFormat("yyyy-MM-dd");

  String get startDateString => _formatter.format(start);

  String get endDateString => _formatter.format(end);

  GetProjectStatsUCParameters({
    required this.apiKey,
    required this.start,
    required this.end,
    required this.project,
  });

  GetProjectStatsUCParameters updateEndDate(DateTime newEndDate) => GetProjectStatsUCParameters(
        apiKey: apiKey,
        start: start,
        end: newEndDate,
        project: project,
      );

  GetProjectStatsUCParameters updateStartDate(DateTime newStartDate) => GetProjectStatsUCParameters(
        apiKey: apiKey,
        start: newStartDate,
        end: end,
        project: project,
      );
}
