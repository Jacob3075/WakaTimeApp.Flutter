import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/usecases/get_project_details_uc.dart";

import "../../../../../../mocks.mocks.dart";
import "../../../../../fixtures/sample_project_details.dart";

main() {
  late GetProjectDetailsUC getProjectDetailsUC;
  late MockClient client;

  setUp(() {
    client = MockClient();
    getProjectDetailsUC = GetProjectDetailsUC(client: client);
  });

  test(
    "When api returns data with stats for 1 project should return Either.Right with the correct data",
    () async {
      when(client.get(any)).thenAnswer((realInvocation) async => http.Response(
            sampleSingleProjectDetailsJson,
            200,
          ));

      final result =
          await getProjectDetailsUC(const GetProjectDetailsUCParameters(apiKey: "", project: ""));

      expect(result, isA<Right>());

      result.fold(
        (l) => expect(false, true),
        (data) => expect(data, sampleSingleProjectDetails),
      );
    },
  );

  test(
    "When api returns data with stats for more than 1 project, use case should return Either.Left",
    () async {
      when(client.get(any)).thenAnswer((realInvocation) async => http.Response(
            sampleMultipleProjectsDetailsJson,
            200,
          ));

      final result =
          await getProjectDetailsUC(const GetProjectDetailsUCParameters(apiKey: "", project: ""));

      expect(result, isA<Left>());

      result.fold(
        (error) => error.when(
          networkError: (_) => expect(false, true),
          domainError: (data) => expect(data.errorMessage, "More than 1 project with given name"),
        ),
        (r) => null,
      );
    },
  );
}
