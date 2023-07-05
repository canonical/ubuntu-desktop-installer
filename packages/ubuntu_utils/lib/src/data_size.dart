import 'dart:math' as math;

enum DataUnit { bytes, kilobytes, megabytes, gigabytes }

int toBytes(double size, DataUnit unit) {
  return (size * math.pow(1000, unit.index)).round();
}

double fromBytes(int size, DataUnit unit) {
  return size / math.pow(1000, unit.index).toInt();
}
