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

  static const OperatingSystem none = OperatingSystem(name: "-", timeSpent: Time.zero, percent: 0);
}

class OperatingSystems extends SecondaryStats<OperatingSystem> {
  OperatingSystems(List<OperatingSystem> values) : super(values);

  @override
  OperatingSystems topNAndCombineOthers(int count) =>
      super.topNAndCombineOthers(count).let((it) => _convertFromBaseClass(it));

  OperatingSystems _convertFromBaseClass(SecondaryStats stats) => stats.values
      .map((it) => OperatingSystem(name: it.name, timeSpent: it.timeSpent, percent: it.percent))
      .toList()
      .let((it) => OperatingSystems(it));

  @override
  String get statsType => "Operating Systems";
}
