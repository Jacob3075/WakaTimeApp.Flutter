import "package:flutter_test/flutter_test.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/time.dart";

main() {
  late Language lang1;
  late Language lang2;
  late Language lang3;

  setUp(() {
    lang1 = Language(
      name: "Stat 1",
      timeSpent: Time(hours: 1, minutes: 30, decimal: 1.5),
      percent: Percent.zero,
    );

    lang2 = Language(
      name: "Stat 2",
      timeSpent: Time(hours: 0, minutes: 30, decimal: 0.5),
      percent: Percent.zero,
    );

    lang3 = Language(
      name: "Stat 2",
      timeSpent: Time(hours: 0, minutes: 30, decimal: 0.5),
      percent: Percent.zero,
    );
  });
  group("Language Tests", () {
    group("Check if equals works", () {
      test(
        "When same instances are compared",
        () => expect(lang1, lang1),
      );

      test(
        "When instances with same values are compared",
        () => expect(lang2, lang3),
      );

      test(
        "When instances with different values are compared",
        () => expect(lang1, isNot(lang3)),
      );
    });
  });

  group("Secondary Stats Tests", () {
    late Languages langs1;
    late Languages langs2;
    late Languages langs3;

    setUp(() {
      langs1 = Languages([lang1, lang2, lang3]);
      langs2 = Languages([lang2, lang2, lang3]);
      langs3 = Languages([lang2, lang2, lang3]);
    });

    group("Check if equals works", () {
      test(
        "When same instances are compared",
        () => expect(langs1, langs1),
      );

      test(
        "When instances with same values are compared",
        () => expect(langs2, langs3),
      );

      test(
        "When instances with different values are compared",
        () => expect(langs1, isNot(langs2)),
      );
    });

    group("Get most used lang", () {
      test(
        "returns None when langs are empty",
        () => expect(Languages([]).mostUsed, null),
      );

      test(
        "returns the correct value when langs are present",
        () => expect(langs1.mostUsed, lang1),
      );
    });

    group("Top n and combine other method", () {
      test(
        "when number of langs is less than the number passed in, all the langs should be shown",
        () => expect(langs1.topNAndCombineOthers(5), langs1),
      );

      test(
        "when number passed in is less than length of values, correct value is returned",
        () {
          final langs = Languages(langs1.values + langs2.values + langs3.values);

          expect(
            langs.topNAndCombineOthers(4),
            Languages([
              lang1,
              lang2,
              lang2,
              lang2,
              Language(
                percent: Percent.zero,
                name: "Others",
                timeSpent: Time(hours: 2, minutes: 30, decimal: 2.5),
              )
            ]),
          );
        },
      );
    });
  });
}
