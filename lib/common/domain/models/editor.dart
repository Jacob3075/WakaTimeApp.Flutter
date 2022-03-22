import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/domain/models/time.dart";

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

  @override
  Editors topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: Editor.none,
        itemMerger: (previousValue, element) => Editor(
          name: "Others",
          percent: previousValue.percent + element.percent,
          timeSpent: previousValue.timeSpent + element.timeSpent,
        ),
        finalListCreator: Editors.new,
      );

  @override
  String get statsType => "Operating Systems";
}
