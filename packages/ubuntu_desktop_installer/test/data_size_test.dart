import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/utils/data_size.dart';

void main() {
  test('bytes', () {
    expect(fromBytes(1, SizeUnit.bytes), equals(1));
    expect(toBytes(1, SizeUnit.bytes), equals(1));
  });

  test('kilobytes', () {
    expect(toBytes(1, SizeUnit.kilobytes), equals(1024));
    expect(fromBytes(1024, SizeUnit.kilobytes), equals(1));
  });

  test('megabytes', () {
    expect(toBytes(1, SizeUnit.megabytes), equals(1024 * 1024));
    expect(fromBytes(1024 * 1024, SizeUnit.megabytes), equals(1));
  });

  test('bytes', () {
    expect(toBytes(1, SizeUnit.gigabytes), equals(1024 * 1024 * 1024));
    expect(fromBytes(1024 * 1024 * 1024, SizeUnit.gigabytes), equals(1));
  });
}
