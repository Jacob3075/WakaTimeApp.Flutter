import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class Language extends SecondaryStat {
  const Language({
    required String name,
    required Time timeSpent,
    required double percent,
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

  static const Language none = Language(name: "-", timeSpent: Time.zero, percent: 0);
}

class Languages extends SecondaryStats<Language> {
  Languages(Iterable<Language> values) : super(values);

  @override
  Languages topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: Language.none,
        itemMerger: (previousValue, element) => Language(
          name: "Others",
          percent: previousValue.percent + element.percent,
          timeSpent: previousValue.timeSpent + element.timeSpent,
        ),
        finalListCreator: Languages.new,
      );

  @override
  String get statsType => "Languages";
}
