import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';

void main() {
  test('mandatory wifi settings', () async {
    final service = NetworkService();
    final settings = service.getWifiSettings(ssid: 'foo bar');

    final connection = settings['connection'];
    expect(connection, isNotNull);
    expect(connection!['id']?.toNative(), equals('foo bar'));
    expect(connection['type']?.toNative(), equals('802-11-wireless'));

    final wireless = settings['802-11-wireless'];
    expect(wireless, isNotNull);
    expect(wireless!['ssid']?.toNative(), equals('foo bar'.codeUnits));

    final security = settings['802-11-wireless-security'];
    expect(security, isNotNull);
    expect(security, contains('key-mgmt'));
  });

  test('mark network configured', () async {
    final client = MockSubiquityClient();
    final service = SubiquityNetworkService(client);
    await service.markConfigured();
    verify(client.markConfigured(['network'])).called(1);
  });
}
