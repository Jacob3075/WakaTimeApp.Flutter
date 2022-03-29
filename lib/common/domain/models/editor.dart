import "package:collection/collection.dart";
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

  static Editor none = Editor(
    name: "-",
    timeSpent: Time.zero,
    percent: Percent.zero,
  );

  @override
  Editor operator +(SecondaryStat? other) => Editor(
        name: name,
        timeSpent: timeSpent + (other?.timeSpent ?? Time.zero),
        percent: percent + (other?.percent ?? Percent.zero),
      );

  @override
  Editor copyWith({
    String? name,
    Time? timeSpent,
    Percent? percent,
  }) =>
      Editor(
        name: name ?? this.name,
        timeSpent: timeSpent ?? this.timeSpent,
        percent: percent ?? this.percent,
      );
}

class Editors extends SecondaryStats<Editor> {
  Editors(Iterable<Editor> values) : super(values);

  factory Editors.convertFromSuper(Iterable<SecondaryStat> secondaryStats) =>
      secondaryStats.map((it) => it as Editor).let(Editors.new);

  factory Editors.mergeDuplicates(Iterable<SecondaryStat> values) =>
      SecondaryStats.mergeStatsByName(values).let(Editors.convertFromSuper);

  @override
  Editors topNAndCombineOthers(int count) => super.topNAndCombineOthersBase(
        count,
        initialValue: Editor.none,
        itemMerger: (previousValue, element) => Editor(
          name: "Others",
          timeSpent: previousValue.timeSpent + element.timeSpent,
          percent: previousValue.percent + element.percent,
        ),
        finalListCreator: Editors.new,
      );

  @override
  String get statsType => "Operating Systems";

  @override
  Editor get mostUsed => values.firstOrNull ?? Editor.none;
}
