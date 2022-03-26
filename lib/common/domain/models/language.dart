import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class Language extends SecondaryStat {
  const Language({
    required String name,
    required Time timeSpent,
    required Percent percent,
  }) : super(
          name: name,
          timeSpent: timeSpent,
          percent: percent,
        );

  factory Language.convertFromSuper(SecondaryStat secondaryStat) => Language(
        name: secondaryStat.name,
        timeSpent: secondaryStat.timeSpent,
        percent: secondaryStat.percent,
      );

  static const Language none = Language(
    name: "-",
    timeSpent: Time.zero,
    percent: Percent.zero,
  );
}

class Languages extends SecondaryStats<Language> {
  Languages(Iterable<Language> values) : super(values);

  factory Languages.convertFromSuper(Iterable<SecondaryStat> secondaryStats) =>
      secondaryStats.map(Language.convertFromSuper).let(Languages.new);

  @override
  Languages topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: Language.none,
        itemMerger: (previousValue, element) => Language(
          name: "Others",
          timeSpent: previousValue.timeSpent + element.timeSpent,
          percent: previousValue.percent.add(element.percent),
        ),
        finalListCreator: Languages.new,
      );

  @override
  String get statsType => "Languages";
}
