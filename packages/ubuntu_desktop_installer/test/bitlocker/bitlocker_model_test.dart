import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/bitlocker/bitlocker_model.dart';

// ignore_for_file: type=lint

void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = BitLockerModel(client);

    await model.reboot();
    verify(client.reboot(immediate: true)).called(1);
  });
}
