import "dart:math";

import "package:waka_time_app/common/domain/models/time.dart";

extension ObjectExt<T> on T {
  /// [Source](https://stackoverflow.com/a/58762538/13181948)
  R let<R>(R Function(T it) op) => op(this);
}

extension NumX on num {
  /// Checks if number is between [from] and [to] parameters.
  /// Both [from] and [to] are inclusive
  /// [Source](https://stackoverflow.com/questions/53797581/easily-check-if-a-number-is-in-a-given-range-in-dart)
  bool isBetween(num from, num to) => from <= this && this <= to;

  /// [Source](https://stackoverflow.com/a/53500405/13181948)
  double roundToDecimal(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }

  /// [Source](https://stackoverflow.com/a/61477875/13181948)
  bool get isInt => (this % 1) == 0;
}

extension ListX<T> on List<T> {
  List<T> takeLast(int n) => length >= n ? sublist(length - n) : this;
}

extension ListTimeX on Iterable<Time> {
  Time get getTotalTime =>
      fold<Time>(Time.zero, (previousValue, element) => previousValue + element);
}
