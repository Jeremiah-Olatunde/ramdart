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
}
