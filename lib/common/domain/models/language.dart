import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class Language {
  final String name;
  final Time timeSpent;
  final double percent;

  const Language({
    required this.name,
    required this.timeSpent,
    required this.percent,
  });

  static Language none = const Language(name: "-", timeSpent: Time.zero, percent: 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          timeSpent == other.timeSpent &&
          percent == other.percent;

  @override
  int get hashCode => name.hashCode ^ timeSpent.hashCode ^ percent.hashCode;
}

class Languages {
  final List<Language> values;

  Languages(this.values);

  Option<Language> get mostUsedLanguage => optionOf(
        values.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );

  Languages topNAndCombineOthers(int count) {
    final sortedLangs = values.sortedBy<num>((it) => it.percent).reversed.toList();
    final topNLangs = sortedLangs.sublist(0, count);
    final otherLangs = sortedLangs.sublist(count).fold<Language>(
          Language.none,
          (previousValue, element) => Language(
            name: "Other Langs",
            percent: previousValue.percent + element.percent,
            timeSpent: previousValue.timeSpent + element.timeSpent,
          ),
        );
    return Languages(topNLangs + [otherLangs]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Languages &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(other.values, values);

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(values),
      );
}
