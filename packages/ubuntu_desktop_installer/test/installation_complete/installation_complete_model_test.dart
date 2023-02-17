import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = InstallationCompleteModel(client);

    await model.reboot();
    verify(client.reboot(immediate: false)).called(1);
  });
}
