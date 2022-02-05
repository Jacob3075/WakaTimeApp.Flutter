import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "language.freezed.dart";

@freezed
class Language with _$Language {
  const Language._();

  const factory Language({
    required String name,
    required Time timeSpent,
    required double percent,
  }) = _Language;

  static Language none = const Language(name: "-", timeSpent: Time.zero, percent: 0);
}

class Languages {
  final List<Language> values;

  Languages(this.values);

  static Option<Language> mostUsedLanguageFrom(List<Language> languages) => optionOf(
        languages.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );

  Option<Language> get mostUsedLanguage => mostUsedLanguageFrom(values);

  Languages reduceToTopNLanguages(int count) {
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
