import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_init/ubuntu_init.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('register init services', () async {
    await registerInitServices();

    expect(tryGetService<ActiveDirectoryService>(), isNotNull);
    expect(tryGetService<GeoService>(), isNotNull);
    expect(tryGetService<IdentityService>(), isNotNull);
    expect(tryGetService<KeyboardService>(), isNotNull);
    expect(tryGetService<LocaleService>(), isNotNull);
    expect(tryGetService<NetworkService>(), isNotNull);
    expect(tryGetService<SessionService>(), isNotNull);
    expect(tryGetService<TimezoneService>(), isNotNull);
  });
}
