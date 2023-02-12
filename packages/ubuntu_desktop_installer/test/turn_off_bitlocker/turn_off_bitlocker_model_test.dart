import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() async {
  test('reboot', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var windowClosed = false;
    final methodChannel = MethodChannel('window_manager');
    methodChannel.setMockMethodCallHandler((call) async {
      expect(call.method, equals('close'));
      windowClosed = true;
    });

    final client = MockSubiquityClient();
    final model = TurnOffBitLockerModel(client);

    await model.reboot(immediate: true);
    verify(client.reboot(immediate: true)).called(1);
    expect(windowClosed, isTrue);
  });
}
