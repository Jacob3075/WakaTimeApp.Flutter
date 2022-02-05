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

class Languages with LanguageStats {
  @override
  final List<Language> languages;

  Languages(this.languages);
}

abstract class LanguageStats {
  List<Language> get languages;

  Option<Language> get mostUsedLanguage => mostUsedLanguageFrom(languages);

  static Option<Language> mostUsedLanguageFrom(List<Language> languages) => optionOf(
        languages.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );
}
