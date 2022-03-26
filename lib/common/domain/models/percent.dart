import "package:waka_time_app/common/utils/extensions.dart";

class Percent {
  final double _numerator;
  final double _denominator;

  double get value => (_numerator / _denominator).roundToDecimal(2);

  const Percent(this._numerator, this._denominator);

  static const Percent zero = Percent(0, 1);

  Percent add(Percent other) {
    assert(
      _denominator == other._denominator,
      "Cannot add percents with different denominators",
    );
    return Percent(_numerator + other._numerator, _denominator);
  }

  Percent merge(Percent other) =>
      Percent(_numerator + other._numerator, _denominator + other._denominator);
}
