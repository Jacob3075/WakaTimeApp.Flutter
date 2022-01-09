import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/features/home/domain/get_daily_stats_uc.dart";

import "../../../fixtures/sample_daily_stats_data.dart";
import "get_daily_stats_uc_test.mocks.dart";

@GenerateMocks([http.Client])
main() {
  late GetDailyStatsUC getDailyStatsUC;
  late MockClient client;
  setUp(() {
    client = MockClient();
    getDailyStatsUC = GetDailyStatsUC(client: client);
  });

  group(
    "When api returns valid data",
    () {
      test(
        "When api returns data with no coding activity on that day",
        () async {
          when(client.get(any)).thenAnswer((realInvocation) async => http.Response(
                sampleEmptyDailyStatsDataJson,
                200,
              ));

          final Either<Errors, Object> result =
              await getDailyStatsUC(const GetDailyStatsUCParameters(apiKey: ""));

          expect(result, isA<Right>());
          result.fold(
            (_) => null,
            (data) => expect(data, sampleEmptyDailyStatsData),
          );
        },
      );

      test(
        "When api returns data with coding activity on that day",
        () async {
          when(client.get(any)).thenAnswer((realInvocation) async => http.Response(
                sampleDailyStatsDataJson,
                200,
              ));

          final Either<Errors, Object> result =
              await getDailyStatsUC(const GetDailyStatsUCParameters(apiKey: ""));

          result.fold(
            (_) => null,
            (data) => expect(data, sampleDailyStatsData),
          );
        },
      );
    },
  );
}
