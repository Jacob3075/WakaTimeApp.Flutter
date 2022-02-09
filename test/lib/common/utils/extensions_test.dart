import "package:flutter_test/flutter_test.dart";
import "package:waka_time_app/common/utils/extensions.dart";

main() {
  group("ListX tests", () {
    late List<int> list;
    setUp(() {
      list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    });
    test(
      "When 'n' is lesser than length of list for List<T>.takeLast(n) function",
      () => expect([6, 7, 8, 9, 10], list.takeLast(5)),
    );

    test(
      "When 'n' is equal to length of list for List<T>.takeLast(n) function",
      () => expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], list.takeLast(10)),
    );

    test(
      "When 'n' is greater than length of list for List<T>.takeLast(n) function (1)",
      () => expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], list.takeLast(11)),
    );

    test(
      "When 'n' is greater than length of list for List<T>.takeLast(n) function (2)",
      () => expect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], list.takeLast(25)),
    );
  });
}
