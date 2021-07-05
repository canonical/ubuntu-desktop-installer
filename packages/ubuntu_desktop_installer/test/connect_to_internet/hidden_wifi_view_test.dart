import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/hidden_wifi_view.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';

import 'hidden_wifi_view_test.mocks.dart';

@GenerateMocks([HiddenWifiModel, WifiDeviceModel])
void main() {
  Future<void> pumpHiddenWifiView(
    WidgetTester tester, {
    required HiddenWifiModel model,
    bool expanded = true,
    VoidCallback? onSelected,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<HiddenWifiModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                HiddenWifiView(
                  expanded: expanded,
                  onSelected: onSelected ?? () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('initializes and updates ssid', (tester) async {
    final model = MockHiddenWifiModel();
    when(model.ssid).thenReturn('Ubuntu');
    when(model.selectedDevice).thenReturn(null);

    await pumpHiddenWifiView(tester, model: model);

    expect(find.widgetWithText(TextField, 'Ubuntu'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'utnubU');
    verify(model.setSsid('utnubU'));
  });

  testWidgets('shows busy indicator when busy', (tester) async {
    final device = MockWifiDeviceModel();
    when(device.isBusy).thenReturn(true);
    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    final model = MockHiddenWifiModel();
    when(model.ssid).thenReturn('Ubuntu');
    when(model.selectedDevice).thenReturn(device);

    await pumpHiddenWifiView(tester, model: model);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('updates focus when expanded and collapsed', (tester) async {
    final model = MockHiddenWifiModel();
    when(model.ssid).thenReturn('');
    when(model.selectedDevice).thenReturn(null);

    await pumpHiddenWifiView(tester, model: model, expanded: false);

    final textField = find.byType(TextField);
    expect(tester.widget<TextField>(textField).focusNode, isNotNull);
    expect(tester.widget<TextField>(textField).focusNode!.hasFocus, isFalse);

    await pumpHiddenWifiView(tester, model: model, expanded: true);

    expect(tester.widget<TextField>(textField).focusNode, isNotNull);
    expect(tester.widget<TextField>(textField).focusNode!.hasFocus, isTrue);

    await pumpHiddenWifiView(tester, model: model, expanded: false);

    expect(tester.widget<TextField>(textField).focusNode, isNotNull);
    expect(tester.widget<TextField>(textField).focusNode!.hasFocus, isFalse);
  });

  testWidgets('selects hidden wifi mode when tapped', (tester) async {
    final model = MockHiddenWifiModel();
    when(model.ssid).thenReturn('');
    when(model.selectedDevice).thenReturn(null);

    var wasSelected = false;

    await pumpHiddenWifiView(
      tester,
      model: model,
      onSelected: () => wasSelected = true,
    );

    await tester.tap(find.byType(TextField));
    expect(wasSelected, isTrue);
  });
}
