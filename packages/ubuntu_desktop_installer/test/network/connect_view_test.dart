import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_view.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_model.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'ethernet_view_test.mocks.dart';
import 'wifi_view_test.mocks.dart';

void main() {
  setUpAll(() => UbuntuTester.context = NoConnectView);

  testWidgets('disabled when no ethernet nor wifi', (tester) async {
    final ethernet = MockEthernetModel();
    when(ethernet.devices).thenReturn([]);
    when(ethernet.isEnabled).thenReturn(false);

    final wifi = MockWifiModel();
    when(wifi.devices).thenReturn([]);
    when(wifi.isEnabled).thenReturn(true);

    await tester.pumpWidget(
      tester.buildApp(
        (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider<EthernetModel>.value(value: ethernet),
            ChangeNotifierProvider<WifiModel>.value(value: wifi),
          ],
          child: NoConnectView(value: ConnectMode.none, onChanged: (_) {}),
        ),
      ),
    );

    final radioButton = find.byType(YaruRadioButton<ConnectMode>);
    expect(radioButton, findsOneWidget);
    expect(tester.widget<YaruRadioButton>(radioButton).onChanged, isNull);
  });
}
