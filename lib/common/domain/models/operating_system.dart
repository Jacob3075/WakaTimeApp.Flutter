import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

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

  factory OperatingSystems.convertFromSuper(SecondaryStats<SecondaryStat> secondaryStats) =>
      secondaryStats.values.map(OperatingSystem.convertFromSuper).let(OperatingSystems.new);

  @override
  OperatingSystems topNAndCombineOthers(int count) =>
      super.topNAndCombineOthers(count).let(OperatingSystems.convertFromSuper);

  @override
  String get statsType => "Operating Systems";
}
