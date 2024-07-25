import 'package:anybank/models/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tests for counter", () {
    final counter = Counter();
    test("Counter value shuld be incremented", () {
      counter.increment();

      expect(counter.value, 1);
    });

    test("Counter value should be decremented", () {
      counter.decrement();

      expect(counter.value, 0);
    });
  });
}
