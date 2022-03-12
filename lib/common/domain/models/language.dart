// ignore_for_file: unnecessary_overrides

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

  static const Language none = Language(name: "-", timeSpent: Time.zero, percent: 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Language && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class Languages extends SecondaryStats<Language> {
  Languages(List<Language> values) : super(values);

  @override
  Languages topNAndCombineOthers(int count) =>
      _convertFromBaseClass(super.topNAndCombineOthers(count));

  Languages _convertFromBaseClass(SecondaryStats stats) => Languages(
        stats.values
            .map((it) => Language(name: it.name, timeSpent: it.timeSpent, percent: it.percent))
            .toList(),
      );

  @override
  String get statsType => "Languages";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Languages && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
