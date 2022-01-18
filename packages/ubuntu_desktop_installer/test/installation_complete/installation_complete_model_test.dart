import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart';
import 'package:ubuntu_test/mocks.dart';

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
    final model = InstallationCompleteModel(client);

    await model.reboot(immediate: false);
    verify(client.reboot(immediate: false)).called(1);
    expect(windowClosed, isTrue);
  });

  test('shutdown', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var windowClosed = false;
    final methodChannel = MethodChannel('ubuntu_wizard');
    methodChannel.setMockMethodCallHandler((call) {
      expect(call.method, equals('closeWindow'));
      windowClosed = true;
    });

    final client = MockSubiquityClient();
    final model = InstallationCompleteModel(client);

    await model.reboot(immediate: false);
    verify(client.reboot(immediate: false)).called(1);
    expect(windowClosed, isTrue);
  });
}
