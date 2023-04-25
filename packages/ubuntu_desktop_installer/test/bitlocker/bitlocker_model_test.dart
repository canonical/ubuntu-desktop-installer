import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/bitlocker/bitlocker_model.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = BitLockerModel(client);

    await model.reboot();
    verify(client.reboot(immediate: true)).called(1);
  });
}
