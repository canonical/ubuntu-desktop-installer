import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_view.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_model.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'ethernet_view_test.mocks.dart';
import 'wifi_view_test.mocks.dart';

void main() {
  testWidgets('disabled when no ethernet nor wifi', (tester) async {
    final ethernet = MockEthernetModel();
    when(ethernet.devices).thenReturn([]);
    when(ethernet.isEnabled).thenReturn(false);

    final wifi = MockWifiModel();
    when(wifi.devices).thenReturn([]);
    when(wifi.isEnabled).thenReturn(true);

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ProviderScope(
          overrides: [
            ethernetModelProvider.overrideWith((_) => ethernet),
            wifiModelProvider.overrideWith((_) => wifi),
          ],
          child: NoConnectView(value: ConnectMode.none, onChanged: (_) {}),
        ),
      ),
    );

    final radioButton = find.byType(YaruRadioButton<ConnectMode>);
    expect(radioButton, findsOneWidget);
    expect(radioButton, isDisabled);
  });
}
