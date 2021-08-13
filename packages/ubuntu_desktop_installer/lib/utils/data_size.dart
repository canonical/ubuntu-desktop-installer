import 'dart:math' as math;

enum SizeUnit { bytes, kilobytes, megabytes, gigabytes }

int toBytes(double size, SizeUnit unit) {
  return (size * math.pow(1024, unit.index)).round();
}

double fromBytes(int size, SizeUnit unit) {
  return size / math.pow(1024, unit.index).toInt();
}
