import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/features/home/domain/get_last_7_days_stats_uc.dart";

import "../../../fixtures/sample_daily_stats_data.dart";
import "get_last_7_days_stats_uc_test.mocks.dart";

@GenerateMocks([http.Client])
main() {
  late GetLast7DaysStatsUC getLast7DaysStatsUC;
  late MockClient client;
  const getLast7DaysStatsUCParameters = GetLast7DaysStatsUCParameters(apiKey: "");

  setUp(() {
    client = MockClient();
    getLast7DaysStatsUC = GetLast7DaysStatsUC(client: client);
  });

  test(
    "When api returns data with coding activity on that day",
    () async {
      when(client.get(any)).thenAnswer((realInvocation) async => http.Response(
            sampleLast7DaysStatsDataJson,
            200,
          ));

      final Either<Errors, Object> result =
          await getLast7DaysStatsUC(getLast7DaysStatsUCParameters);

      result.fold(
        (_) => null,
        (data) => expect(data.toString(), sampleLast7DaysStats.toString()),
      );
    },
  );
}
