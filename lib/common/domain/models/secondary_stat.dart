import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class SecondaryStat {
  final String name;
  final Time timeSpent;
  final Percent percent;

  const SecondaryStat({
    required this.name,
    required this.timeSpent,
    required this.percent,
  });

  static const SecondaryStat none = SecondaryStat(
    name: "-",
    timeSpent: Time.zero,
    percent: Percent.zero,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondaryStat &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          timeSpent == other.timeSpent &&
          percent == other.percent;

  @override
  int get hashCode => name.hashCode ^ timeSpent.hashCode ^ percent.hashCode;

  @override
  String toString() => "SecondaryStat{name: $name, timeSpent: $timeSpent, percent: $percent}";
}

abstract class SecondaryStats<T extends SecondaryStat> {
  final List<T> values;

  SecondaryStats(Iterable<T> values) : values = values.toList(growable: false);

  T? get mostUsed => values.firstOrNull;

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
