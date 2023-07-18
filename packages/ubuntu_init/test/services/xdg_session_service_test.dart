import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_init/src/services/xdg_session_service.dart';
import 'package:ubuntu_session/ubuntu_session.dart';

import 'xdg_session_service_test.mocks.dart';

@GenerateMocks([UbuntuSession])
void main() {
  test('reboot', () async {
    final client = MockUbuntuSession();

    final service = XdgSessionService(client);

    await service.reboot();
    verify(client.reboot()).called(1);
  });
  test('shutdown', () async {
    final client = MockUbuntuSession();

    final service = XdgSessionService(client);

    await service.shutdown();
    verify(client.shutdown()).called(1);
  });
}
