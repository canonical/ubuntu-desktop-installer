import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_model.dart';

// ignore_for_file: type=lint

void main() {
  test('init', () async {
    final client = MockSubiquityClient();
    when(client.getTimezone()).thenAnswer((_) async =>
        TimeZoneInfo(timezone: 'Europe/Stockholm', fromGeoip: false));

    final model = TimezoneModel(client);

    final timezone = await model.init();
    expect(timezone, equals('Europe/Stockholm'));

    verify(client.getTimezone()).called(1);
  });

  test('save', () async {
    final client = MockSubiquityClient();
    when(client.setTimezone('geoip')).thenAnswer((_) async {});
    when(client.setTimezone('Europe/Oslo')).thenAnswer((_) async {});

    final model = TimezoneModel(client);

    await model.save(null);
    verify(client.setTimezone('geoip')).called(1);

    await model.save('Europe/Oslo');
    verify(client.setTimezone('Europe/Oslo')).called(1);
  });
}
