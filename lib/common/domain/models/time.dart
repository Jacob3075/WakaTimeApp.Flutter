import "package:waka_time_app/common/utils/extensions.dart";

class Time {
  final int hours;
  final int minutes;
  final double decimal;

  const Time({
    required this.hours,
    required this.minutes,
    required this.decimal,
  });

  static const Time zero = Time(decimal: 0, minutes: 0, hours: 0);

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

  Time operator /(int value) {
    final newDecimal = decimal / value;
    final newHours = newDecimal.toInt();
    final newMinutes = ((newDecimal * 60) % 60).toInt();
    return Time(hours: newHours, minutes: newMinutes, decimal: newDecimal.roundToDecimal(3));
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
}
