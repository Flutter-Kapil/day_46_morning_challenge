import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
    expect(candiesDistributed(7,4), [1,2,3,1]);
  });
}
