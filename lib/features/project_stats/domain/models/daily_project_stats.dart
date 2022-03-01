import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_systems.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/features/project_stats/domain/models/entity.dart";

class DailyProjectStats extends BaseDailyStats {
  final List<Entity> entities;

  const DailyProjectStats({
    required this.entities,
    required Time timeSpent,
    required Languages languages,
    required List<Editor> editors,
    required OperatingSystems operatingSystems,
    required DateTime date,
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
      other is DailyProjectStats &&
          runtimeType == other.runtimeType &&
          super == other &&
          const DeepCollectionEquality().equals(other.entities, entities);

  @override
  int get hashCode => Object.hash(const DeepCollectionEquality().hash(entities), super.hashCode);
}
