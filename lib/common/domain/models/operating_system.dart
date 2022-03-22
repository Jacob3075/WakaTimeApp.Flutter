import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class OperatingSystem extends SecondaryStat {
  const OperatingSystem({
    required String name,
    required Time timeSpent,
    required double percent,
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

  static const OperatingSystem none = OperatingSystem(name: "-", timeSpent: Time.zero, percent: 0);
}

class OperatingSystems extends SecondaryStats<OperatingSystem> {
  OperatingSystems(Iterable<OperatingSystem> values) : super(values);

  @override
  OperatingSystems topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: OperatingSystem.none,
        itemMerger: (previousValue, element) => OperatingSystem(
          name: "Others",
          percent: previousValue.percent + element.percent,
          timeSpent: previousValue.timeSpent + element.timeSpent,
        ),
        finalListCreator: OperatingSystems.new,
      );

  @override
  String get statsType => "Operating Systems";
}
