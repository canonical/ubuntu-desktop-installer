import 'dart:math';
import 'dart:ui';
import 'package:latlong2/latlong.dart';

const _kTopLatitude = 81.0;
const _kBottomLatitude = -59.0;
const _kLatitudeRange = 4.6068250867599998;
const _kPi4 = pi / 4;

/// Converts xy to latlng on a map of size
LatLng toLatLng(Offset offset, Size size) {
  return LatLng(
    y2lat(offset.dy, size.height),
    x2lng(offset.dx, size.width),
  );
}

/// Converts latlng to xy on a map of size
Offset toOffset(LatLng coordinates, Size size) {
  return Offset(
    lng2x(coordinates.longitude, size.width),
    lat2y(coordinates.latitude, size.height),
  );
}

// The map is rotated -6 degrees
double _xoffset(double w) => w * -6 / 180.0;

// The top of the map is around 81 latitudes
double _yoffset(double h) => _kLatitudeRange * _kTopLatitude / 180.0;

// The map covers latitudes from 81 to -59
double _yrange(double h) {
  final l = log(tan(_kPi4 + 0.4 * degToRadian(_kBottomLatitude)));
  return 1.25 * l - _yoffset(h);
}

/// Converts longitude to x along width
double lng2x(double lng, double w) {
  final x = w * (180.0 + lng) / 360.0 + _xoffset(w);
  return x.wrap(0, w);
}

/// Converts x along width to longitude
double x2lng(double x, double w) {
  final l = (x - _xoffset(w)) * 360.0 / w - 180.0;
  return l.wrap(-180, 180);
}

/// Converts latitude to y along height
double lat2y(double lat, double h) {
  final y = log(tan(_kPi4 + 0.4 * degToRadian(lat)));
  return (1.25 * y - _yoffset(h)) / _yrange(h) * h;
}

/// Converts y along height to latitude
double y2lat(double y, double h) {
  final l = (y / h * _yrange(h) + _yoffset(h)) / 1.25;
  return radianToDeg((atan(exp(l)) - _kPi4) / 0.4);
}

extension _NumX on double {
  // wraps around to keep within the range
  double wrap(double min, double max) => min + (this - min) % (max - min);
}
