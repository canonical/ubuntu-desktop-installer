import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_utils/src/data_size.dart';

void main() {
  test('bytes', () {
    expect(fromBytes(1, DataUnit.bytes), equals(1));
    expect(toBytes(1, DataUnit.bytes), equals(1));
  });

  test('kilobytes', () {
    expect(toBytes(1, DataUnit.kilobytes), equals(1000));
    expect(fromBytes(1000, DataUnit.kilobytes), equals(1));
  });

  test('megabytes', () {
    expect(toBytes(1, DataUnit.megabytes), equals(1000 * 1000));
    expect(fromBytes(1000 * 1000, DataUnit.megabytes), equals(1));
  });

  test('bytes', () {
    expect(toBytes(1, DataUnit.gigabytes), equals(1000 * 1000 * 1000));
    expect(fromBytes(1000 * 1000 * 1000, DataUnit.gigabytes), equals(1));
  });
}
