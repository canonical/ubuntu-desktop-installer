import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_provision/l10n.dart';
import 'package:ubuntu_provision/src/network/hidden_wifi_model.dart';
import 'package:ubuntu_provision/src/network/hidden_wifi_view.dart';
import 'package:ubuntu_provision/src/network/wifi_model.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_network.dart';

void main() {
  Future<void> pumpHiddenWifiView(
    WidgetTester tester, {
    required HiddenWifiModel model,
    bool expanded = true,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          UbuntuProvisionLocalizations.delegate,
          ...GlobalUbuntuLocalizations.delegates,
        ],
        home: ProviderScope(
          overrides: [
            hiddenWifiModelProvider.overrideWith((_) => model),
          ],
          child: Material(
            child: Column(
              children: [
                HiddenWifiView(expanded: expanded),
              ],
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('enter ssid', (tester) async {
    final model =
        buildHiddenWifiModel(ssid: 'test', devices: [MockWifiDevice()]);

    await pumpHiddenWifiView(tester, model: model);

    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.textField('test'), 'ssid');
    verify(model.setSsid('ssid'));

    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.textField('ssid'), '');
    verify(model.setSsid(''));
  });

  testWidgets('updates focus when expanded and collapsed', (tester) async {
    final model = buildHiddenWifiModel(devices: [MockWifiDevice()]);

    await pumpHiddenWifiView(tester, model: model, expanded: false);
    await tester.pumpAndSettle();

    expect(find.byType(TextField), hasNoFocus);

    await pumpHiddenWifiView(tester, model: model, expanded: true);
    await tester.pumpAndSettle();

    expect(find.byType(TextField), hasFocus);

    await pumpHiddenWifiView(tester, model: model, expanded: false);
    await tester.pumpAndSettle();

    expect(find.byType(TextField), hasNoFocus);
  });

  testWidgets('wifi disabled', (tester) async {
    final model = buildHiddenWifiModel(isEnabled: false);

    await pumpHiddenWifiView(tester, model: model);

    expect(find.byType(TextField), findsNothing);
    expect(find.byType(MenuButtonBuilder<WifiDevice>), findsNothing);
  });

  testWidgets('no wifi devices', (tester) async {
    final model = buildHiddenWifiModel(devices: []);

    await pumpHiddenWifiView(tester, model: model);

    expect(find.byType(TextField), findsNothing);
    expect(find.byType(MenuButtonBuilder<WifiDevice>), findsNothing);
  });

  testWidgets('one wifi device', (tester) async {
    final device = MockWifiDevice();
    when(device.model).thenReturn('model');

    final model = buildHiddenWifiModel(devices: [device]);

    await pumpHiddenWifiView(tester, model: model);

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(MenuButtonBuilder<WifiDevice>), findsNothing);
  });

  testWidgets('multiple wifi devices', (tester) async {
    final device1 = MockWifiDevice();
    when(device1.model).thenReturn('device 1');

    final device2 = MockWifiDevice();
    when(device2.model).thenReturn('device 2');

    final model = buildHiddenWifiModel(
      devices: [device1, device2],
      selectedDevice: device2,
    );

    await pumpHiddenWifiView(tester, model: model);

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(MenuButtonBuilder<WifiDevice>), findsOneWidget);

    await tester.tap(find.byType(MenuButtonBuilder<WifiDevice>));
    await tester.pumpAndSettle();

    final item1 = find.menuItem('device 1');
    expect(item1, findsOneWidget);
    await tester.ensureVisible(item1);
    await tester.tap(item1);
    await tester.pumpAndSettle();
    verify(model.selectDevice(device1));

    await tester.tap(find.byType(MenuButtonBuilder<WifiDevice>));
    await tester.pumpAndSettle();

    final item2 = find.menuItem('device 2');
    expect(item2, findsOneWidget);
    await tester.ensureVisible(item2);
    await tester.tap(item2);
    await tester.pumpAndSettle();
    verify(model.selectDevice(device2));
  });
}
