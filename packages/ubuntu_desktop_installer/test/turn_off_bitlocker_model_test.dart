import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';

import 'installation_slides_model_test.mocks.dart';

@GenerateMocks([SubiquityClient])
void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    when(client.reboot()).thenAnswer((_) async => null);

    final model = TurnOffBitLockerModel(client);

    var didExit = -1;
    await model.reboot(exit: (exitCode) => didExit = exitCode);
    verify(client.reboot()).called(1);
    expect(didExit, equals(0));
  });
}
