import "package:freezed_annotation/freezed_annotation.dart";

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
class Time with _$Time {
  const Time._();

  const factory Time({
    required int hours,
    required int minutes,
    required double decimal,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  factory Time.fromDigital(String digitalTime, double decimal) {
    List<String> split = digitalTime.split(":");
    assert(split.length == 2);
    return Time(hours: int.parse(split.first), minutes: int.parse(split.last), decimal: decimal);
  }

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

@freezed
class StatsRange with _$StatsRange {
  const factory StatsRange({
    required DateTime startDate,
    required DateTime endDate,
  }) = _StatsRange;

  factory StatsRange.fromJson(Map<String, dynamic> json) => _$StatsRangeFromJson(json);
}
