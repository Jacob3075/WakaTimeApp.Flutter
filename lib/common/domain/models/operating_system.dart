import "package:collection/collection.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class OperatingSystem extends SecondaryStat {
  const OperatingSystem({
    required String name,
    required Time timeSpent,
    required Percent percent,
  }) : super(
          name: name,
          timeSpent: timeSpent,
          percent: percent,
        );

  factory OperatingSystem.convertFromSuper(SecondaryStat secondaryStat) => OperatingSystem(
        name: secondaryStat.name,
        timeSpent: secondaryStat.timeSpent,
        percent: secondaryStat.percent,
      );

  static const OperatingSystem none = OperatingSystem(
    name: "-",
    timeSpent: Time.zero,
    percent: Percent.zero,
  );

  @override
  OperatingSystem operator +(SecondaryStat? other) => OperatingSystem(
        name: name,
        timeSpent: timeSpent + (other?.timeSpent ?? Time.zero),
        percent: percent + (other?.percent ?? Percent.zero),
      );

  @override
  SecondaryStat updatePercentDenominator(double newDenominator) => OperatingSystem(
        name: name,
        timeSpent: timeSpent,
        percent: Percent(percent.numerator, newDenominator),
      );
}

class OperatingSystems extends SecondaryStats<OperatingSystem> {
  OperatingSystems(Iterable<OperatingSystem> values) : super(values);

  factory OperatingSystems.convertFromSuper(Iterable<SecondaryStat> secondaryStats) =>
      secondaryStats.map(OperatingSystem.convertFromSuper).let(OperatingSystems.new);

  factory OperatingSystems.mergeDuplicates(Iterable<SecondaryStat> values) =>
      SecondaryStats.mergeStatsByName(values).let(OperatingSystems.convertFromSuper);

  @override
  OperatingSystems topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: OperatingSystem.none,
        itemMerger: (previousValue, element) => OperatingSystem(
          name: "Others",
          timeSpent: previousValue.timeSpent + element.timeSpent,
          percent: previousValue.percent.add(element.percent),
        ),
        finalListCreator: OperatingSystems.new,
      );

  @override
  String get statsType => "Operating Systems";

  @override
  OperatingSystem get mostUsed => values.firstOrNull ?? OperatingSystem.none;
}
