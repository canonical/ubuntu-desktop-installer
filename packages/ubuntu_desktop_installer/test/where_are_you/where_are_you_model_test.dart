import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/where_are_you/where_are_you_model.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() {
  test('init', () async {
    final client = MockSubiquityClient();
    when(client.timezone()).thenAnswer((_) async =>
        TimeZoneInfo(timezone: 'Europe/Stockholm', fromGeoip: false));

    final model = WhereAreYouModel(client);

    final timezone = await model.init();
    expect(timezone, equals('Europe/Stockholm'));

    verify(client.timezone()).called(1);
  });

  test('save', () async {
    final client = MockSubiquityClient();
    when(client.setTimezone('geoip')).thenAnswer((_) async {});
    when(client.setTimezone('Europe/Oslo')).thenAnswer((_) async {});

    final model = WhereAreYouModel(client);

    await model.save(null);
    verify(client.setTimezone('geoip')).called(1);

    await model.save('Europe/Oslo');
    verify(client.setTimezone('Europe/Oslo')).called(1);
  });
}
