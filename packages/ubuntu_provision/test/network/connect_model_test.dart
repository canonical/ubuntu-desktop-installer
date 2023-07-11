import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_provision/src/network/connect_model.dart';

void main() {
  test('no connect', () async {
    final model = NoConnectModel();
    expect(model.canConnect, isFalse);
    expect(model.isConnected, isTrue);
    expect(model.isConnecting, isFalse);
    expect(model.connectMode, ConnectMode.none);
    await expectLater(model.enable, throwsUnsupportedError);
    await expectLater(model.connect, throwsUnsupportedError);
  });
}
