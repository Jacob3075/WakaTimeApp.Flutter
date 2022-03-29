import "package:flutter_test/flutter_test.dart";
import "package:waka_time_app/common/domain/models/time.dart";

main() {
  group("Creating time from digital string", () {
    test("when hours is 0", () {
      const digitalTimeString = "0:30";
      const decimalTime = 0.5;

      final timeFromDigital = Time.fromDigital(digitalTimeString, decimalTime);

      expect(timeFromDigital, Time(hours: 0, minutes: 30, decimal: 0.5));
    });

    test("when minutes is 0", () {
      const digitalTimeString = "2:00";
      const decimalTime = 2.0;

      final timeFromDigital = Time.fromDigital(digitalTimeString, decimalTime);

      expect(timeFromDigital, Time(hours: 2, minutes: 0, decimal: 2));
    });

    test("when hours and minutes are non-zero", () {
      const digitalTimeString = "2:15";
      const decimalTime = 2.25;

      final timeFromDigital = Time.fromDigital(digitalTimeString, decimalTime);

      expect(timeFromDigital, Time(hours: 2, minutes: 15, decimal: 2.25));
    });

    test("fails when invalid string format is given", () {
      const digitalTimeString = "2:15:10";
      const decimalTime = 2.25;

      expect(
        () {
          Time.fromDigital(digitalTimeString, decimalTime);
        },
        throwsAssertionError,
      );
    });
  });

  group("Creating time from decimal value", () {
    test("when decimal value is 0", () {
      const decimalValue = 0.0;

      final timeFromDigital = Time.fromDecimal(decimalValue);

      expect(timeFromDigital, Time(hours: 0, minutes: 0, decimal: 0));
    });

    test("when decimal value is a non zero whole number", () {
      const decimalValue = 2.0;

      expect(
        Time.fromDecimal(decimalValue),
        Time(hours: 2, minutes: 0, decimal: decimalValue),
      );
    });

    test("when decimal value has only fractional part", () {
      const decimalValue = 0.20;

      expect(
        Time.fromDecimal(decimalValue),
        Time(hours: 0, minutes: 12, decimal: decimalValue),
      );
    });

    test("when decimal value has both whole and fractional part", () {
      const decimalValue = 5.20;

      expect(
        Time.fromDecimal(decimalValue),
        Time(hours: 5, minutes: 12, decimal: decimalValue),
      );
    });
  });

  group("Adding 2 time objects", () {
    test("when addition of both minutes does not carry over and increase the hour", () {
      final time1 = Time(hours: 2, minutes: 15, decimal: 2.25);
      final time2 = Time(hours: 2, minutes: 30, decimal: 2.50);

      final expected = Time(hours: 4, minutes: 45, decimal: 4.75);

      expect(time1 + time2, expected);
    });

    test("when addition of both minutes does carries over and increases the hour", () {
      final time1 = Time(hours: 2, minutes: 45, decimal: 2.75);
      final time2 = Time(hours: 2, minutes: 30, decimal: 2.50);

      final expected = Time(hours: 5, minutes: 15, decimal: 5.25);

      expect(time1 + time2, expected);
    });
  });

  group("Dividing time object by a value", () {
    test("when division does not cause hours to have decimal values", () {
      final time1 = Time(hours: 2, minutes: 45, decimal: 2.75);
      const value = 2;

      final expected = Time(hours: 1, minutes: 22, decimal: 1.375);

      expect(time1 / value, expected);
    });

    test("when division does cause hours to have decimal values", () {
      final time1 = Time(hours: 2, minutes: 30, decimal: 2.50);
      const value = 3;

      final expected = Time(hours: 0, minutes: 50, decimal: 0.833);

      expect(time1 / value, expected);
    });
  });
}
