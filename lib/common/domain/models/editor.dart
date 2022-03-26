import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class Editor extends SecondaryStat {
  const Editor({
    required String name,
    required Time timeSpent,
    required Percent percent,
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

  static const Editor none = Editor(
    name: "-",
    timeSpent: Time.zero,
    percent: Percent.zero,
  );
}

class Editors extends SecondaryStats<Editor> {
  Editors(Iterable<Editor> values) : super(values);

  factory Editors.convertFromSuper(Iterable<SecondaryStat> secondaryStats) =>
      secondaryStats.map(Editor.convertFromSuper).let(Editors.new);

  @override
  Editors topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: Editor.none,
        itemMerger: (previousValue, element) => Editor(
          name: "Others",
          timeSpent: previousValue.timeSpent + element.timeSpent,
          percent: previousValue.percent.add(element.percent),
        ),
        finalListCreator: Editors.new,
      );

  @override
  String get statsType => "Operating Systems";
}
