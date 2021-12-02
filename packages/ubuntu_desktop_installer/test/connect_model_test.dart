import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';

void main() {
  test('no connect', () {
    final model = NoConnectModel();
    expect(model.canConnect, isFalse);
    expect(model.isConnected, isTrue);
    expect(model.isConnecting, isFalse);
    expect(model.connectMode, ConnectMode.none);
    expect(model.connect, throwsUnsupportedError);
  });
}
