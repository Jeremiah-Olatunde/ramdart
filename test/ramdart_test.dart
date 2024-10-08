import 'package:ramdart/ramdart.dart';
import 'package:test/test.dart';

void main() {
  group('function currying:', () {
    test('(curry2)', () {
      var curried = curry2((int a, int b) => a + b);
      expect(curried(2)(3), 5);
    });

    test('(curry3)', () {
      var curried = curry3((int a, int b, int c) => a + b + c);
      expect(curried(2)(3)(4), 9);
    });

    test('(curry4)', () {
      var curried = curry4((int a, int b, int c, int d) => a + b + c + d);
      expect(curried(2)(3)(4)(5), 14);
    });
  });

  test("always", () {
    var always5 = always(5);
    expect(always5(), 5);

    var always10 = always(10);
    expect(always10(), 10);

    var alwaysHello = always("hello");
    expect(alwaysHello(), "hello");

    var alwaysMap = always(<String, int>{"meaningOfLife": 42});
    expect(alwaysMap(), {"meaningOfLife": 42});
  });

  test("flip", () {
    int sub(int a, int b) => a - b;

    expect(flip(sub)(10, 5), -5);
    expect(flip(flip(sub))(10, 5), sub(10, 5));

    String mergeWithSpace(String first, String second) => '$first $second';

    expect(flip(mergeWithSpace)("hello", "world"), "world hello");
  });

  group("adjust", () {
    test("adjust iterative", () {
        int double(int x) => x * 2;

        expect(adjust(0, double, [4, 4, 4, 4]), equals([8, 4, 4, 4]));
        expect(adjust(1, double, [4, 4, 4, 4]), equals([4, 8, 4, 4]));
        expect(adjust(2, double, [4, 4, 4, 4]), equals([4, 4, 8, 4]));
        expect(adjust(3, double, [4, 4, 4, 4]), equals([4, 4, 4, 8]));
    });

    test("adjust recursive", () {
        int double(int x) => x * 2;

        expect(adjustRecursive(0, double, [4, 4, 4, 4]), equals([8, 4, 4, 4]));
        expect(adjustRecursive(1, double, [4, 4, 4, 4]), equals([4, 8, 4, 4]));
        expect(adjustRecursive(2, double, [4, 4, 4, 4]), equals([4, 4, 8, 4]));
        expect(adjustRecursive(3, double, [4, 4, 4, 4]), equals([4, 4, 4, 8]));
    });    
  });
}
