import "dart:math";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class Percent {
  final double numerator;
  final double denominator;

  double get value => ((numerator / denominator) * 100).roundToDecimal(2);

  const Percent(this.numerator, this.denominator);

  static const Percent zero = Percent(0, 0);

  /// Adds [other.numerator] with [numerator].
  ///
  /// Finds max of [denominator] and [other.denominator] because [Percent.zero] can be added sometimes.
  ///
  /// Adds the [numerator] values of this and [other.numerator], if sum is greater than the [newDenominator]
  /// sets the value of [newNumerator] to [newDenominator]
  ///
  /// Extra logic because sum of the 2 numerators can sometimes be larger than the denominator
  ///
  /// FIXME: HOW IS VALUE SUM OF NUMERATORS GREATER THAN THE DENOMINATOR
  Percent operator +(Percent other) {
    final newDenominator = max(denominator, other.denominator);
    final numeratorSum = numerator + other.numerator;
    final newNumerator = min(numeratorSum, newDenominator);
    return Percent(newNumerator, newDenominator);
  }

  Percent merge(Percent other) =>
      Percent(numerator + other.numerator, denominator + other.denominator);

  @override
  String toString() => "$value($numerator/$denominator)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is Percent &&
          const DeepCollectionEquality().equals(other.numerator, numerator) &&
          const DeepCollectionEquality().equals(other.denominator, denominator));

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(numerator),
        const DeepCollectionEquality().hash(denominator),
      );
}
