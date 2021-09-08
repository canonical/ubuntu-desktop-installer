import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/src/utils/system_shutdown.dart';

typedef SystemShutdownTester = Future<void> Function(SystemShutdown system);

class TestSystemShutdown with SystemShutdown {
  TestSystemShutdown(this.client);

  final SubiquityClient client;
}

void main() async {
  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  Future<void> testSystemShutdown(SystemShutdownTester tester) async {
    var windowClosed = false;
    final methodChannel = MethodChannel('ubuntu_wizard');
    methodChannel.setMockMethodCallHandler((call) {
      expect(call.method, equals('closeWindow'));
      windowClosed = true;
    });
    await tester(TestSystemShutdown(MockSubiquityClient()));
    expect(windowClosed, isTrue);
  }

  test('reboot', () async {
    // immediate (before installation)
    await testSystemShutdown((system) async {
      await system.reboot(immediate: true);
      verify(system.client.reboot(immediate: true)).called(1);
    });

    // non-immediate (after installation)
    await testSystemShutdown((system) async {
      await system.reboot(immediate: false);
      verify(system.client.reboot(immediate: false)).called(1);
    });
  });

  test('shutdown', () async {
    // immediate (before installation)
    await testSystemShutdown((system) async {
      await system.shutdown(immediate: true);
      verify(system.client.shutdown(immediate: true)).called(1);
    });

    // non-immediate (after installation)
    await testSystemShutdown((system) async {
      await system.shutdown(immediate: false);
      verify(system.client.shutdown(immediate: false)).called(1);
    });
  });
}
