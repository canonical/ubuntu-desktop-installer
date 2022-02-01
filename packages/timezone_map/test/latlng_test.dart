import 'package:flutter_test/flutter_test.dart';
import 'package:timezone_map/src/latlng.dart';

import 'test_utils.dart';

void main() {
  test('null island', () {
    expect(toOffset(nullLatLng, mapSize), isCloseToOffset(nullOffset));
    expect(toLatLng(nullOffset, mapSize), isCloseToLatLng(nullLatLng));
  });

  test('london', () {
    expect(toOffset(londonLatLng, mapSize), isCloseToOffset(londonOffset));
    expect(toLatLng(londonOffset, mapSize), isCloseToLatLng(londonLatLng));
  });

  test('center', () {
    expect(toOffset(centerLatLng, mapSize), isCloseToOffset(centerOffset));
    expect(toLatLng(centerOffset, mapSize), isCloseToLatLng(centerLatLng));
  });

  test('top-left', () {
    expect(
      toOffset(topLeftLatLng, mapSize),
      isCloseToOffset(topLeftOffset),
    );
    expect(
      toLatLng(topLeftOffset, mapSize),
      isCloseToLatLng(topLeftLatLng),
    );
  });

  test('top-right', () {
    expect(
      toOffset(topRightLatLng, mapSize),
      isCloseToOffset(topRightOffset),
    );
    expect(
      toLatLng(topRightOffset, mapSize),
      isCloseToLatLng(topRightLatLng),
    );
  });

  test('bottom-left', () {
    expect(
      toOffset(bottomLeftLatLng, mapSize),
      isCloseToOffset(bottomLeftOffset),
    );
    expect(
      toLatLng(bottomLeftOffset, mapSize),
      isCloseToLatLng(bottomLeftLatLng),
    );
  });

  test('bottom-right', () {
    expect(
      toOffset(bottomRightLatLng, mapSize),
      isCloseToOffset(bottomRightOffset),
    );
    expect(
      toLatLng(bottomRightOffset, mapSize),
      isCloseToLatLng(bottomRightLatLng),
    );
  });
}
