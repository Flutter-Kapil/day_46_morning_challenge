import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
    expect(candiesDistributed(7,4), [1,2,3,1]);
    expect(candiesDistributed(8,4), [1,2,3,2]);
    expect(candiesDistributed(10,4), [1,2,3,4]);
    expect(candiesDistributed(0,4), [0,0,0,0]);
    expect(candiesDistributed(7,1), [7]);
    expect(candiesDistributed(7,0), []);
  });
}
