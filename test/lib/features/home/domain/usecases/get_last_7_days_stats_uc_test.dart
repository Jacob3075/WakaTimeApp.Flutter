import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/features/home/domain/usecases/get_last_7_days_stats_uc.dart";

import "../../../../../mocks.mocks.dart";
import "../../../../fixtures/sample_daily_stats_data.dart";

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
