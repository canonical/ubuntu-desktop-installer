import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = TurnOffRSTModel(client);

    await model.reboot();
    verify(client.reboot(immediate: true)).called(1);
  });
}
