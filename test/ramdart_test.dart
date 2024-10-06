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

    var alwaysMap = always(<String, int>{ "meaningOfLife": 42 });
    expect(alwaysMap(), {  "meaningOfLife": 42  });
  });
}
