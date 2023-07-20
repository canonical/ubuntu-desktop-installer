import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/services/session_service.dart';

void main() {
  test('reboot', () async {
    final client = MockSubiquityClient();

    final service = SubiquitySessionService(client);

    await service.reboot();
    verify(client.reboot()).called(1);
  });
  test('shutdown', () async {
    final client = MockSubiquityClient();

    final service = SubiquitySessionService(client);

    await service.shutdown();
    verify(client.shutdown()).called(1);
  });
}
