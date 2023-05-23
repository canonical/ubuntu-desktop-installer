import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_model.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_timezone.mocks.dart';
export 'test_timezone.mocks.dart';

@GenerateMocks([GeoService, TimezoneService])
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

@GenerateMocks([TimezoneModel])
Widget buildTimezonePage(TimezoneModel model) {
  return ProviderScope(
    overrides: [
      timezoneModelProvider.overrideWith((_) => model),
    ],
    child: const TimezonePage(),
  );
}
