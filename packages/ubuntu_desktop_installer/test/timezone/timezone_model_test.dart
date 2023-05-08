import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_model.dart';
import 'package:ubuntu_desktop_installer/services/timezone_service.dart';

import 'timezone_model_test.mocks.dart';

@GenerateMocks([TimezoneService])
void main() {
  test('init', () async {
    final service = MockTimezoneService();
    when(service.getTimezone()).thenAnswer((_) async => 'Europe/Stockholm');

    final model = TimezoneModel(service);

    final timezone = await model.init();
    expect(timezone, equals('Europe/Stockholm'));

    verify(service.getTimezone()).called(1);
  });

  test('save', () async {
    final service = MockTimezoneService();
    when(service.setTimezone('geoip')).thenAnswer((_) async {});
    when(service.setTimezone('Europe/Oslo')).thenAnswer((_) async {});

    final model = TimezoneModel(service);

    await model.save(null);
    verify(service.setTimezone('geoip')).called(1);

    await model.save('Europe/Oslo');
    verify(service.setTimezone('Europe/Oslo')).called(1);
  });
}
