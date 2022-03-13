import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

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
}

class Languages extends SecondaryStats<Language> {
  Languages(List<Language> values) : super(values);

  @override
  Languages topNAndCombineOthers(int count) =>
      super.topNAndCombineOthers(count).let((it) => _convertFromBaseClass(it));

  Languages _convertFromBaseClass(SecondaryStats stats) => stats.values
      .map((it) => Language(name: it.name, timeSpent: it.timeSpent, percent: it.percent))
      .toList()
      .let((it) => Languages(it));

  @override
  String get statsType => "Languages";
}
