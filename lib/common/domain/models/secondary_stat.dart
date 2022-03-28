import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/time.dart";

abstract class SecondaryStat {
  final String name;
  final Time timeSpent;
  final Percent percent;

  const SecondaryStat({
    required this.name,
    required this.timeSpent,
    required this.percent,
  });

  SecondaryStat operator +(SecondaryStat? other);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is SecondaryStat &&
          const DeepCollectionEquality().equals(other.name, name) &&
          const DeepCollectionEquality().equals(other.timeSpent, timeSpent) &&
          const DeepCollectionEquality().equals(other.percent, percent));

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(timeSpent),
        const DeepCollectionEquality().hash(percent),
      );

  @override
  String toString() => "SecondaryStat{name: $name, timeSpent: $timeSpent, percent: $percent}";
}

abstract class SecondaryStats<T extends SecondaryStat> {
  final List<T> values;

  SecondaryStats(Iterable<T> values) : values = values.toList(growable: false);

  @protected
  static Iterable<SecondaryStat> mergeStatsByName(Iterable<SecondaryStat> values) => values
      .groupFoldBy<String, SecondaryStat>(
        (it) => it.name,
        ((previous, element) => element + previous),
      )
      .values
      .sortedBy<num>((element) => element.timeSpent.decimal)
      .reversed;

  T get mostUsed;

  List<T> get allExceptMostUsed => values.slice(1).toList(growable: false);

  String get statsType => "Secondary Stats";

  SecondaryStats topNAndCombineOthers(int count);

  @protected
  L topNAndCombineOthersBase<L extends SecondaryStats>(
    int count, {
    required T initialValue,
    required T Function(T, T) itemMerger,
    required L Function(Iterable<T>) finalListCreator,
  }) {
    if (values.length <= count) return finalListCreator(values);

    final topNStats = values.sublist(0, count);
    final T otherStats = values.sublist(count).fold<T>(initialValue, itemMerger);
    return finalListCreator(topNStats + [otherStats]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondaryStats &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(other.values, values);

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(values),
      );

  @override
  String toString() => "SecondaryStats($values)";
}
