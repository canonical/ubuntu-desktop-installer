import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_provision/timezone.dart';

import 'test_timezone.dart';

void main() {
  test('init', () async {
    final service = MockTimezoneService();
    when(service.getTimezone()).thenAnswer((_) async => 'Europe/Stockholm');

    final geo = MockGeoService();
    when(geo.searchTimezone('Europe/Stockholm')).thenAnswer(
        (_) async => const [GeoLocation(timezone: 'Europe/Stockholm')]);

    final model = TimezoneModel(service, geo);

    await model.init();
    expect(model.selectedLocation?.timezone, equals('Europe/Stockholm'));

    verify(service.getTimezone()).called(1);
    verify(geo.searchTimezone('Europe/Stockholm')).called(1);
  });

  test('save', () async {
    final service = MockTimezoneService();
    when(service.setTimezone('geoip')).thenAnswer((_) async {});
    when(service.setTimezone('Europe/Oslo')).thenAnswer((_) async {});

    final model = TimezoneModel(service, MockGeoService());

    await model.save();
    verify(service.setTimezone('geoip')).called(1);

    model.selectLocation(const GeoLocation(timezone: 'Europe/Oslo'));

    await model.save();
    verify(service.setTimezone('Europe/Oslo')).called(1);
  });
}
