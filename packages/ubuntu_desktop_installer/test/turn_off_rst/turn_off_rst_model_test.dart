import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';
import 'package:ubuntu_test/mocks.dart';

void main() async {
  test('reboot', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var windowClosed = false;
    const methodChannel = MethodChannel('window_manager');
    methodChannel.setMockMethodCallHandler((call) async {
      expect(call.method, equals('close'));
      windowClosed = true;
    });

    final client = MockSubiquityClient();
    final model = TurnOffRSTModel(client);

    await model.reboot(immediate: true);
    verify(client.reboot(immediate: true)).called(1);
    expect(windowClosed, isTrue);
  });
}
