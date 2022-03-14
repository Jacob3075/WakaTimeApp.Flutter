import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/time.dart";

abstract class BaseDailyStats {
  final Time timeSpent;
  final Languages languages;
  final OperatingSystems operatingSystems;
  final DateTime date;
  final Editors editors;

  const BaseDailyStats({
    required this.timeSpent,
    required this.languages,
    required this.editors,
    required this.operatingSystems,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseDailyStats &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(other.timeSpent, timeSpent) &&
          const DeepCollectionEquality().equals(other.languages, languages) &&
          const DeepCollectionEquality().equals(other.languages, languages) &&
          const DeepCollectionEquality().equals(other.date, date) &&
          const DeepCollectionEquality().equals(other.editors, editors) &&
          const DeepCollectionEquality().equals(other.operatingSystems, operatingSystems);

  @override
  int get hashCode => Object.hash(
        const DeepCollectionEquality().hash(timeSpent),
        const DeepCollectionEquality().hash(languages),
        const DeepCollectionEquality().hash(date),
        const DeepCollectionEquality().hash(editors),
        const DeepCollectionEquality().hash(operatingSystems),
      );
}

class DailyStats extends BaseDailyStats {
  final List<Project> projectsWorkedOn;

  const DailyStats({
    required this.projectsWorkedOn,
    required Time timeSpent,
    required Languages languages,
    required DateTime date,
    required Editors editors,
    required OperatingSystems operatingSystems,
  }) : super(
          timeSpent: timeSpent,
          languages: languages,
          editors: editors,
          operatingSystems: operatingSystems,
          date: date,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyStats &&
          runtimeType == other.runtimeType &&
          super == other &&
          const DeepCollectionEquality().equals(other.projectsWorkedOn, projectsWorkedOn);

  @override
  int get hashCode =>
      Object.hash(const DeepCollectionEquality().hash(projectsWorkedOn), super.hashCode);
}
