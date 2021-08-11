import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';

import 'turn_off_rst_model_test.mocks.dart';

@GenerateMocks([SubiquityClient])
void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    when(client.reboot()).thenAnswer((_) async => null);

    final model = TurnOffRSTModel(client);

    var didExit = -1;
    await model.reboot(exit: (exitCode) => didExit = exitCode);
    verify(client.reboot()).called(1);
    expect(didExit, equals(0));
  });
}
