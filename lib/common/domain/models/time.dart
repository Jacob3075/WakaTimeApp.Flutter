import "package:waka_time_app/common/utils/extensions.dart";

class Time {
  final int hours;
  final int minutes;
  final double decimal;
  final double totalSeconds;

  const Time({
    required this.hours,
    required this.minutes,
    required this.decimal,
    double? totalSeconds,
  }) : totalSeconds = totalSeconds ?? 0;

  static const Time zero = Time(decimal: 0, minutes: 0, hours: 0, totalSeconds: 0);

  factory Time.fromDigital(String digitalTime, double decimal) {
    List<String> split = digitalTime.split(":");
    assert(split.length == 2);
    final hours = int.parse(split.first);
    final minutes = int.parse(split.last);
    final double totalSeconds = (hours * 60 * 60) + (minutes * 60);
    return Time(hours: hours, minutes: minutes, totalSeconds: totalSeconds, decimal: decimal);
  }

  factory Time.fromDecimal(double decimal) {
    int hours = decimal.toInt();
    double minutesDecimal = ((decimal - hours) * 60);
    int minutes = minutesDecimal.toInt();
    final double totalSeconds = (hours * 60 * 60) + (minutes * 60);
    return Time(decimal: decimal, hours: hours, minutes: minutes, totalSeconds: totalSeconds);
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
    final double newTotalSeconds = totalSeconds + other.totalSeconds;
    return Time(
      hours: newHours.toInt(),
      minutes: newMinutes,
      totalSeconds: newTotalSeconds,
      decimal: newDecimal,
    );
  }

  Time operator /(int value) {
    final newDecimal = decimal / value;
    final newHours = newDecimal.toInt();
    final newMinutes = ((newDecimal * 60) % 60).toInt();
    final double newTotalSeconds = totalSeconds / value;
    return Time(
      hours: newHours,
      minutes: newMinutes,
      totalSeconds: newTotalSeconds,
      decimal: newDecimal.roundToDecimal(3),
    );
  }

  String formattedPrint() => "${hours}H, ${minutes}M";

  String longFormattedPrint() => "$hours Hours, $minutes Minutes";

  int compareTo(Time other) => decimal.compareTo(other.decimal);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Time &&
          runtimeType == other.runtimeType &&
          hours == other.hours &&
          minutes == other.minutes &&
          decimal == other.decimal;

  @override
  int get hashCode => hours.hashCode ^ minutes.hashCode ^ decimal.hashCode;

  @override
  String toString() => formattedPrint();
}
