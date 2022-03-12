// ignore_for_file: unnecessary_overrides

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

  static const OperatingSystem none = OperatingSystem(name: "-", timeSpent: Time.zero, percent: 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is OperatingSystem && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class OperatingSystems extends SecondaryStats<OperatingSystem> {
  OperatingSystems(List<OperatingSystem> values) : super(values);

  @override
  OperatingSystems topNAndCombineOthers(int count) =>
      _convertFromBaseClass(super.topNAndCombineOthers(count));

  OperatingSystems _convertFromBaseClass(SecondaryStats stats) => OperatingSystems(
        stats.values
            .map((it) =>
                OperatingSystem(name: it.name, timeSpent: it.timeSpent, percent: it.percent))
            .toList(),
      );

  @override
  String get statsType => "Operating Systems";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is OperatingSystems && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
