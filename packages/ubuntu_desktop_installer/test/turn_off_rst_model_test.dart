import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';

import 'turn_off_rst_model_test.mocks.dart';

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
    final model = TurnOffRSTModel(client);

    await model.reboot();
    verify(client.reboot(immediate: true)).called(1);
    expect(windowClosed, isTrue);
  });
}
