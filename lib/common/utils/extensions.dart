import "dart:math";

import "package:waka_time_app/common/domain/errors/errors.dart";

extension ObjectExt<T> on T {
  /// [Source](https://stackoverflow.com/a/58762538/13181948)
  R let<R>(R Function(T that) op) => op(this);
}

extension ErrorMessage on Errors {
  String getErrorMessage() => map(
        networkError: (networkError) => networkError.networkError.map(
          (value) => value.errorMessage,
          network: (error) => "Network Error",
          clientError: (error) => error.errorMessage,
          serverError: (error) => error.errorMessage,
        ),
        domainError: (domainError) => domainError.domainError.errorMessage,
      );
}

extension Range on num {
  /// Checks if number is between [from] and [to] parameters.
  /// Both [from] and [to] are inclusive
  /// [Source](https://stackoverflow.com/questions/53797581/easily-check-if-a-number-is-in-a-given-range-in-dart)
  bool isBetween(num from, num to) => from <= this && this <= to;

  /// [Source](https://stackoverflow.com/a/53500405/13181948)
  double roundToDecimal(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}

extension DateTimeX on DateTime {
  /// [Source](https://stackoverflow.com/a/49399168/13181948)
  int get dayOfYear => DateTime.now().difference(DateTime(year, 1, 1, 0, 0)).inDays;
}

extension ListX<T> on List<T> {
  List<T> takeLast(int n) => skip(length - n).toList();
}
