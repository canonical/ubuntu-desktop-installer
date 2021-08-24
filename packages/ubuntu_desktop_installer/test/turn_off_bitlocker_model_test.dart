import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';

import 'installation_slides_model_test.mocks.dart';

@GenerateMocks([SubiquityClient])
void main() async {
  test('reboot', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var windowClosed = false;
    final methodChannel = MethodChannel('ubuntu_wizard');
    methodChannel.setMockMethodCallHandler((call) {
      expect(call.method, equals('closeWindow'));
      windowClosed = true;
    });

    final client = MockSubiquityClient();
    final model = TurnOffBitLockerModel(client);

    await model.reboot();
    verify(client.reboot(immediate: true)).called(1);
    expect(windowClosed, isTrue);
  });
}
