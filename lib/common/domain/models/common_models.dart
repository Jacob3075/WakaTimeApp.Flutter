import "package:collection/collection.dart";
import "package:dartz/dartz.dart";
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

class Editor {
  final String name;
  final Time timeSpent;
  final double percent;

  const Editor({
    required this.name,
    required this.timeSpent,
    required this.percent,
  });

  static const Editor none = Editor(name: "-", timeSpent: Time.zero, percent: 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Editor &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          timeSpent == other.timeSpent &&
          percent == other.percent;

  @override
  int get hashCode => name.hashCode ^ timeSpent.hashCode ^ percent.hashCode;
}

class OperatingSystem {
  final String name;
  final Time timeSpent;
  final double percent;

  const OperatingSystem({
    required this.name,
    required this.timeSpent,
    required this.percent,
  });

  static const OperatingSystem none = OperatingSystem(name: "-", timeSpent: Time.zero, percent: 0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperatingSystem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          timeSpent == other.timeSpent &&
          percent == other.percent;

  @override
  int get hashCode => name.hashCode ^ timeSpent.hashCode ^ percent.hashCode;
}

@Deprecated("")
abstract class EditorStats {
  List<Editor> get editors;

  Option<Editor> get mostUsedEditor => optionOf(
        editors.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );
}

@Deprecated("")
abstract class OperatingSystemStats {
  List<OperatingSystem> get operatingSystems;

  Option<OperatingSystem> get mostUsedOperatingSystem => optionOf(
        operatingSystems.sortedBy<num>((element) => element.timeSpent.decimal).reversed.firstOrNull,
      );
}
