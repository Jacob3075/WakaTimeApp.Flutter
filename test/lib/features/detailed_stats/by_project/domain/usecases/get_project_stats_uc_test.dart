import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/usecases/get_project_stats_uc.dart";

import "../../../../../../mocks.mocks.dart";
import "../../../../../fixtures/sample_project_stats_data.dart";

main() {
  late GetProjectStatsUC getProjectStatsUC;
  late MockClient client;

  setUp(
    () {
      client = MockClient();
      getProjectStatsUC = GetProjectStatsUC(client: client);
    },
  );

  test(
    "When api returns valid data, correct data is returned from use case",
    () async {
      when(client.get(any))
          .thenAnswer((realInvocation) async => http.Response(sampleProjectStatsJson, 200));

      final result = await getProjectStatsUC(const GetProjectStatsUCParameters(
        apiKey: "",
        project: "",
        start: "",
        end: "",
      ));

      expect(result, isA<Right>());

      result.fold(
        (_) => expect(false, true),
        (data) => expect(data, sampleProjectStatsData),
      );
    },
  );

  test(
    "Correct query parameters are added when getting project details stats endpoint is called",
    () async {
      when(client.get(any))
          .thenAnswer((realInvocation) async => http.Response(sampleProjectStatsJson, 200));
      final parametersMap = {
        "api_key": "abcd-1234-efgh",
        "start": "2021-08-30",
        "end": "2022-01-12",
        "project": "Waka Time App",
      };

      await getProjectStatsUC(GetProjectStatsUCParameters.fromJson(parametersMap));

      final Uri calledUri = verify(client.get(captureAny)).captured.first;

      expect(calledUri.hasQuery, true);
      expect(calledUri.queryParameters, parametersMap);
    },
  );
}
