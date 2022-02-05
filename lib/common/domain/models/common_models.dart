import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "common_models.freezed.dart";
part "common_models.g.dart";

@freezed
class Project with _$Project {
  const factory Project({
    required Time time,
    required String name,
    required double percent,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

@freezed
class StatsRange with _$StatsRange {
  const factory StatsRange({
    required DateTime startDate,
    required DateTime endDate,
  }) = _StatsRange;

  factory StatsRange.fromJson(Map<String, dynamic> json) => _$StatsRangeFromJson(json);
}

@freezed
class Entity with _$Entity {
  const factory Entity({
    required String name,
    required EntityType type,
    required Time time,
    required double percentage,
  }) = _Entity;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

@freezed
class EntityType with _$EntityType {
  const factory EntityType.file() = _File;

  factory EntityType.fromJson(Map<String, dynamic> json) => _$EntityTypeFromJson(json);
}

@freezed
class Language with _$Language {
  const Language._();

  const factory Language({
    required String name,
    required Time timeSpent,
    required double percent,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  static Language none = const Language(name: "-", timeSpent: Time.zero, percent: 0);
}

@freezed
class Editor with _$Editor {
  const Editor._();

  const factory Editor({
    required String name,
    required Time timeSpent,
    required double percent,
  }) = _Editor;

  factory Editor.fromJson(Map<String, dynamic> json) => _$EditorFromJson(json);

  static const Editor none = Editor(name: "-", timeSpent: Time.zero, percent: 0);
}

@freezed
class OperatingSystem with _$OperatingSystem {
  const OperatingSystem._();

  const factory OperatingSystem({
    required String name,
    required Time timeSpent,
    required double percent,
  }) = _OperatingSystem;

  factory OperatingSystem.fromJson(Map<String, dynamic> json) => _$OperatingSystemFromJson(json);

  static const OperatingSystem none = OperatingSystem(name: "-", timeSpent: Time.zero, percent: 0);
}

abstract class LanguageStats {
  List<Language> get languages;

  Option<Language> get mostUsedLanguage => mostUsedLanguageFrom(languages);

  static Option<Language> mostUsedLanguageFrom(List<Language> languages) => optionOf(
        languages.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );
}

abstract class EditorStats {
  List<Editor> get editors;

  Option<Editor> get mostUsedEditor => optionOf(
        editors.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );
}

abstract class OperatingSystemStats {
  List<OperatingSystem> get operatingSystems;

  Option<OperatingSystem> get mostUsedOperatingSystem => optionOf(
        operatingSystems.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );
}
