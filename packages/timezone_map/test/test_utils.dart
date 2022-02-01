import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

const mapSize = Size(960, 480);

final bottomLeftLatLng = LatLng(-58.73638, -168);
const bottomLeftOffset = Offset(0, 479);

final bottomRightLatLng = LatLng(-58.73638, -168.375);
const bottomRightOffset = Offset(959, 479);

final centerLatLng = LatLng(25.30062, 12);
const centerOffset = Offset(480, 240);

final londonLatLng = LatLng(51.5072, 0.1276);
const londonOffset = Offset(448.34027, 160.50975);

final nullLatLng = LatLng(0, 0);
const nullOffset = Offset(448, 306.74102);

final topLeftLatLng = LatLng(85.545283, -168);
const topLeftOffset = Offset(0, 0);

final topRightLatLng = LatLng(85.545283, -168.375);
const topRightOffset = Offset(959, 0);

Matcher isCloseToOffset(Offset value, [double distance = 1e-5]) {
  return offsetMoreOrLessEquals(value, epsilon: 1e-5);
}

Matcher isCloseToLatLng(
  LatLng value, [
  double distance = 1e-5,
  LengthUnit unit = LengthUnit.Meter,
]) {
  return within(
    from: value,
    distance: distance,
    distanceFunction: (LatLng a, LatLng b) {
      final haversine = const DistanceHaversine().as;
      return haversine(LengthUnit.Kilometer, a, b);
    },
  );
}

extension SvgFinder on CommonFinders {
  Finder svg(String assetName) {
    return find.byWidgetPredicate((widget) {
      return widget is SvgPicture &&
          widget.pictureProvider is ExactAssetPicture &&
          (widget.pictureProvider as ExactAssetPicture)
              .assetName
              .endsWith(assetName);
    });
  }
}
