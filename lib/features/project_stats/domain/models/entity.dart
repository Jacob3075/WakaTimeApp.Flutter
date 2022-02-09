import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "entity.freezed.dart";
part "entity.g.dart";

class Entity {
  final String name;
  final EntityType type;
  final Time time;
  final double percentage;

  const Entity({
    required this.name,
    required this.type,
    required this.time,
    required this.percentage,
  });
}

@freezed
class EntityType with _$EntityType {
  const factory EntityType.file() = _File;

  factory EntityType.fromJson(Map<String, dynamic> json) => _$EntityTypeFromJson(json);
}
