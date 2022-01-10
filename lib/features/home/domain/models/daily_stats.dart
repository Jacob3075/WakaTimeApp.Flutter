import "package:freezed_annotation/freezed_annotation.dart";

part "daily_stats.freezed.dart";
part "daily_stats.g.dart";

@freezed
class DailyStats with _$DailyStats {
  const factory DailyStats({
    required Time timeSpent,
    required List<Project> projectsWorkedOn,
    required String mostUsedLanguage,
    required String mostUsedEditor,
    required String mostUsedOs,
    required DateTime date,
  }) = _DailyStats;

  factory DailyStats.fromJson(Map<String, dynamic> json) => _$DailyStatsFromJson(json);
}

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
class Time with _$Time {
  const Time._();

  const factory Time({
    required int hours,
    required int minutes,
    required double decimal,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Time operator +(Time other) {
    double newHours = (hours + other.hours).toDouble();
    var newMinutes = minutes + other.minutes;
    final newDecimal = double.parse((decimal + other.decimal).toStringAsFixed(2));

    if (newMinutes == 60) {
      newHours += 1;
      newMinutes = 0;
    } else if (newMinutes > 59) {
      newHours += (newMinutes / 60);
      newMinutes %= 60;
    }

    return Time(hours: newHours.toInt(), minutes: newMinutes, decimal: newDecimal);
  }

  String formattedPrint() {
    return "${hours}H, ${minutes}M";
  }
}
