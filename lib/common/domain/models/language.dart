import "package:collection/collection.dart";
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

  static Language none = Language(
    name: "-",
    timeSpent: Time.zero,
    percent: Percent.zero,
  );

  @override
  Language operator +(SecondaryStat? other) => Language(
        name: name,
        timeSpent: timeSpent + (other?.timeSpent ?? Time.zero),
        percent: percent + (other?.percent ?? Percent.zero),
      );

  @override
  Language copyWith({
    String? name,
    Time? timeSpent,
    Percent? percent,
  }) =>
      Language(
        name: name ?? this.name,
        timeSpent: timeSpent ?? this.timeSpent,
        percent: percent ?? this.percent,
      );
}

class Languages extends SecondaryStats<Language> {
  Languages(Iterable<Language> values) : super(values);

  factory Languages.convertFromSuper(Iterable<SecondaryStat> secondaryStats) =>
      secondaryStats.map((it) => it as Language).let(Languages.new);

  factory Languages.mergeDuplicates(Iterable<SecondaryStat> values) =>
      SecondaryStats.mergeStatsByName(values).let(Languages.convertFromSuper);

  @override
  Languages topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: Language.none,
        itemMerger: (previousValue, element) => Language(
          name: "Others",
          timeSpent: previousValue.timeSpent + element.timeSpent,
          percent: previousValue.percent + element.percent,
        ),
        finalListCreator: Languages.new,
      );

  @override
  String get statsType => "Languages";

  @override
  Language get mostUsed => values.firstOrNull ?? Language.none;
}
