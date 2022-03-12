import "package:collection/collection.dart";
import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class SecondaryStat {
  final String name;
  final Time timeSpent;
  final double percent;

  const SecondaryStat({
    required this.name,
    required this.timeSpent,
    required this.percent,
  });

  static const SecondaryStat none = SecondaryStat(name: "-", timeSpent: Time.zero, percent: 0);

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

class SecondaryStats<T extends SecondaryStat> {
  final List<T> values;

  SecondaryStats(this.values);

  Option<T> get mostUsed => optionOf(
        values.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );

  String get statsType => "Secondary Stats";

  SecondaryStats<SecondaryStat> topNAndCombineOthers(int count) {
    if (values.length <= count) return this;

    final sortedStats = values.sortedBy<num>((it) => it.timeSpent.decimal).reversed.toList();
    final topNStats = sortedStats
        .sublist(0, count)
        .map((it) => SecondaryStat(name: it.name, timeSpent: it.timeSpent, percent: it.percent))
        .toList();
    final otherStats = sortedStats.sublist(count).fold<SecondaryStat>(
          SecondaryStat.none,
          (previousValue, element) => SecondaryStat(
            name: "Others",
            percent: previousValue.percent + element.percent,
            timeSpent: previousValue.timeSpent + element.timeSpent,
          ),
        );
    return SecondaryStats<SecondaryStat>(topNStats + [otherStats]);
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
