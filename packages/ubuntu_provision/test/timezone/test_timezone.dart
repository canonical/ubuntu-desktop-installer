import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_provision/timezone.dart';

import 'test_timezone.mocks.dart';
export '../test_utils.dart';
export 'test_timezone.mocks.dart';

@GenerateMocks([TimezoneModel])
MockTimezoneModel buildTimezoneModel({
  String? timezone,
  GeoLocation? selectedLocation,
  LatLng? selectedCoordinates,
  Iterable<GeoLocation>? locations,
  Iterable<GeoLocation>? timezones,
}) {
  final model = MockTimezoneModel();
  when(model.init()).thenAnswer((_) async => timezone ?? '');
  when(model.selectedLocation).thenReturn(selectedLocation);
  when(model.locations).thenReturn(locations ?? const <GeoLocation>[]);
  when(model.timezones).thenReturn(timezones ?? const <GeoLocation>[]);
  when(model.searchLocation('')).thenAnswer((_) async => const <GeoLocation>[]);
  when(model.searchTimezone('')).thenAnswer((_) async => const <GeoLocation>[]);
  return model;
}
