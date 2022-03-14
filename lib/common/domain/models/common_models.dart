import "package:waka_time_app/common/domain/models/time.dart";

class Project {
  final Time time;
  final String name;
  final double percent;

  const Project({
    required this.time,
    required this.name,
    required this.percent,
  });
}

class StatsRange {
  final DateTime startDate;
  final DateTime endDate;

  const StatsRange({
    required this.startDate,
    required this.endDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsRange &&
          runtimeType == other.runtimeType &&
          startDate == other.startDate &&
          endDate == other.endDate;

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode;
}
