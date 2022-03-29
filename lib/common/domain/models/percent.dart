import "dart:math";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/utils/extensions.dart";

class Percent {
  final double numerator;
  final double denominator;

  double get value => ((numerator / denominator) * 100).roundToDecimal(2);

  const Percent(this.numerator, this.denominator);

  static const Percent zero = Percent(0, 0);

  /// Added the [numerator] values of this and [other],
  /// Finds max of [denominator] and [other.denominator] because [Percent.zero] can be added sometimes
  Percent operator +(Percent other) =>
      Percent(numerator + other.numerator, max(denominator, other.denominator));

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
