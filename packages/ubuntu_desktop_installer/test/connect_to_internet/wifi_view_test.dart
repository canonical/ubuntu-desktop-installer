import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_view.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import '../widget_tester_extensions.dart';
import 'wifi_view_test.mocks.dart';

@GenerateMocks([AccessPoint, WifiModel, WifiDevice])
void main() {
  setUpAll(() => UbuntuTester.context = WifiView);

  testWidgets('device and access point tiles', (tester) async {
    final device1 = MockWifiDevice();
    when(device1.model).thenReturn('model1');
    when(device1.scanning).thenReturn(false);
    when(device1.isConnecting).thenReturn(false);
    when(device1.isAvailable).thenReturn(true);
    when(device1.isActive).thenReturn(false);

    final accessPoint1 = MockAccessPoint();
    when(accessPoint1.name).thenReturn('ap1');
    when(accessPoint1.strength).thenReturn(1);
    when(accessPoint1.isOpen).thenReturn(true);
    when(device1.accessPoints).thenReturn([accessPoint1]);
    when(device1.isSelectedAccessPoint(accessPoint1)).thenReturn(false);
    when(device1.isActiveAccessPoint(accessPoint1)).thenReturn(false);

    final device2 = MockWifiDevice();
    when(device2.model).thenReturn('model2');
    when(device2.scanning).thenReturn(true);
    when(device2.isConnecting).thenReturn(true);
    when(device2.isAvailable).thenReturn(true);
    when(device2.isActive).thenReturn(true);

    final accessPoint2 = MockAccessPoint();
    when(accessPoint2.name).thenReturn('ap2');
    when(accessPoint2.strength).thenReturn(2);
    when(accessPoint2.isOpen).thenReturn(false);
    when(device2.accessPoints).thenReturn([accessPoint2]);
    when(device2.isActiveAccessPoint(accessPoint2)).thenReturn(true);
    when(device2.isSelectedAccessPoint(accessPoint2)).thenReturn(true);

    final model = MockWifiModel();
    when(model.devices).thenReturn([device1, device2]);
    when(model.isSelectedDevice(any)).thenReturn(false);
    when(model.startPeriodicScanning()).thenReturn(null);
    when(model.isEnabled).thenReturn(true);

    WifiDevice? selectedDevice;
    AccessPoint? selectedAccessPoint;

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ChangeNotifierProvider<WifiModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                WifiView(
                  expanded: true,
                  onEnabled: () {},
                  onSelected: (device, accessPoint) {
                    selectedDevice = device;
                    selectedAccessPoint = accessPoint;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // select ap
    final ap1 = find.widgetWithText(ListTile, 'ap1').first;
    expect(ap1, findsOneWidget);
    await tester.tap(ap1);
    expect(selectedDevice, equals(device1));
    expect(selectedAccessPoint, equals(accessPoint1));

    // select another ap
    final ap2 = find.widgetWithText(ListTile, 'ap2').first;
    expect(ap2, findsOneWidget);
    await tester.tap(ap2);
    expect(selectedDevice, equals(device2));
    expect(selectedAccessPoint, equals(accessPoint2));
  });

  testWidgets('wifi disabled', (tester) async {
    final model = MockWifiModel();
    when(model.startPeriodicScanning()).thenReturn(null);
    when(model.isEnabled).thenReturn(false);

    var wasEnabled = false;

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ChangeNotifierProvider<WifiModel>.value(
          value: model,
          child: Column(
            children: [
              WifiRadioButton(
                value: ConnectMode.wifi,
                onChanged: (v) {},
              ),
              WifiView(
                expanded: true,
                onEnabled: () => wasEnabled = true,
                onSelected: (device, accessPoint) {},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(WifiListView), findsNothing);
    expect(find.byType(typeOf<RadioButton<ConnectMode>>()), findsNothing);

    expect(find.text(tester.lang.wirelessNetworkingDisabled), findsOneWidget);
    expect(find.text(tester.lang.wifiMustBeEnabled), findsOneWidget);

    final button = find.widgetWithText(OutlinedButton, tester.lang.enableWifi);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(wasEnabled, isTrue);
  });

  testWidgets('no wifi devices', (tester) async {
    final model = MockWifiModel();
    when(model.startPeriodicScanning()).thenReturn(null);
    when(model.isEnabled).thenReturn(true);
    when(model.devices).thenReturn([]);

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ChangeNotifierProvider<WifiModel>.value(
          value: model,
          child: Column(
            children: [
              WifiRadioButton(
                value: ConnectMode.wifi,
                onChanged: (v) {},
              ),
              WifiView(
                expanded: true,
                onEnabled: () {},
                onSelected: (device, accessPoint) {},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(WifiListView), findsNothing);
    expect(find.byType(typeOf<RadioButton<ConnectMode>>()), findsNothing);
    expect(find.text(tester.lang.noWifiDevicesDetected), findsOneWidget);
  });

  testWidgets('starts periodic scanning', (tester) async {
    final model = MockWifiModel();
    when(model.startPeriodicScanning()).thenReturn(null);
    when(model.isEnabled).thenReturn(true);
    when(model.devices).thenReturn([]);

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ChangeNotifierProvider<WifiModel>.value(
          value: model,
          child: WifiView(
            expanded: true,
            onEnabled: () {},
            onSelected: (device, accessPoint) {},
          ),
        ),
      ),
    );

    verify(model.startPeriodicScanning()).called(1);
  });
}
