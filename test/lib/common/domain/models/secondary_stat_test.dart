import "package:flutter_test/flutter_test.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";

main() {
  late SecondaryStat stat1;
  late SecondaryStat stat2;
  late SecondaryStat stat3;

  setUp(() {
    stat1 = const SecondaryStat(
      name: "Stat 1",
      timeSpent: Time(hours: 1, minutes: 30, decimal: 1.5),
      percent: 0,
    );

    stat2 = const SecondaryStat(
      name: "Stat 2",
      timeSpent: Time(hours: 0, minutes: 30, decimal: 0.5),
      percent: 0,
    );

    stat3 = const SecondaryStat(
      name: "Stat 2",
      timeSpent: Time(hours: 0, minutes: 30, decimal: 0.5),
      percent: 0,
    );
  });

  group(
    "Secondary Stat Tests",
    () {
      group("Check if equals works", () {
        test(
          "When same instances are compared",
          () => expect(stat1, stat1),
        );

        test(
          "When instances with same values are compared",
          () => expect(stat2, stat3),
        );

        test(
          "When instances with different values are compared",
          () => expect(stat1, isNot(stat3)),
        );
      });
    },
  );

  group(
    "Secondary Stats Tests",
    () {
      late SecondaryStats stats1;
      late SecondaryStats stats2;
      late SecondaryStats stats3;

      setUp(() {
        stats1 = SecondaryStats([stat1, stat2, stat3]);
        stats2 = SecondaryStats([stat2, stat2, stat3]);
        stats3 = SecondaryStats([stat2, stat2, stat3]);
      });

      group(
        "Check if equals works",
        () {
          test(
            "When same instances are compared",
            () => expect(stats1, stats1),
          );

          test(
            "When instances with same values are compared",
            () => expect(stats2, stats3),
          );

          test(
            "When instances with different values are compared",
            () => expect(stats1, isNot(stats2)),
          );
        },
      );

      group(
        "Get most used stat",
        () {
          test(
            "returns None when stats are empty",
            () => expect(SecondaryStats<SecondaryStat>([]).mostUsed, null),
          );

          test(
            "returns the correct value when stats are present",
            () => expect(stats1.mostUsed, stat1),
          );
        },
      );

      group(
        "Top n and combine other method",
        () {
          test(
            "when number of stats is less than the number passed in, all the stats should be shown",
            () => expect(stats1.topNAndCombineOthers(5), stats1),
          );

          test(
            "when number passed in is less than length of values, correct value is returned",
            () {
              final stats = SecondaryStats(stats1.values + stats2.values + stats3.values);

              expect(
                stats.topNAndCombineOthers(4),
                SecondaryStats([
                  stat1,
                  stat2,
                  stat2,
                  stat2,
                  const SecondaryStat(
                    percent: 0,
                    name: "Others",
                    timeSpent: Time(hours: 2, minutes: 30, decimal: 2.5),
                  )
                ]),
              );
            },
          );
        },
      );
    },
  );
}
