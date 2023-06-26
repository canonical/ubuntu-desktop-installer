import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_utils/src/data_size.dart';

void main() {
  test('bytes', () {
    expect(fromBytes(1, DataUnit.bytes), equals(1));
    expect(toBytes(1, DataUnit.bytes), equals(1));
  });

  test('kilobytes', () {
    expect(toBytes(1, DataUnit.kilobytes), equals(1024));
    expect(fromBytes(1024, DataUnit.kilobytes), equals(1));
  });

  test('megabytes', () {
    expect(toBytes(1, DataUnit.megabytes), equals(1024 * 1024));
    expect(fromBytes(1024 * 1024, DataUnit.megabytes), equals(1));
  });

  test('bytes', () {
    expect(toBytes(1, DataUnit.gigabytes), equals(1024 * 1024 * 1024));
    expect(fromBytes(1024 * 1024 * 1024, DataUnit.gigabytes), equals(1));
  });
}
