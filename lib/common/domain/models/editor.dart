import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class Editor extends SecondaryStat {
  const Editor({
    required String name,
    required Time timeSpent,
    required double percent,
  }) : super(
          name: name,
          timeSpent: timeSpent,
          percent: percent,
        );

  factory Editor.convertFromSuper(SecondaryStat secondaryStat) => Editor(
        name: secondaryStat.name,
        timeSpent: secondaryStat.timeSpent,
        percent: secondaryStat.percent,
      );

  static const Editor none = Editor(name: "-", timeSpent: Time.zero, percent: 0);
}

class Editors extends SecondaryStats<Editor> {
  Editors(Iterable<Editor> values) : super(values);

  factory Editors.convertFromSuper(SecondaryStats<SecondaryStat> secondaryStats) =>
      secondaryStats.values.map((e) => Editor.convertFromSuper(e)).let(Editors.new);

  @override
  Editors topNAndCombineOthers(int count) =>
      super.topNAndCombineOthers(count).let(Editors.convertFromSuper);

  @override
  String get statsType => "Operating Systems";
}
