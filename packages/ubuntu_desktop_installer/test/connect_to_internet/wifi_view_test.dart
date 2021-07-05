import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_view.dart';

import 'wifi_view_test.mocks.dart';

@GenerateMocks([AccessPointModel, WifiModel, WifiDeviceModel])
void main() {
  testWidgets('device and access point tiles', (tester) async {
    final device1 = MockWifiDeviceModel();
    when(device1.model).thenReturn('model1');
    when(device1.scanning).thenReturn(false);

    final accessPoint1 = MockAccessPointModel();
    when(accessPoint1.name).thenReturn('ap1');
    when(accessPoint1.strength).thenReturn(1);
    when(accessPoint1.isOpen).thenReturn(true);
    when(device1.accessPoints).thenReturn([accessPoint1]);
    when(device1.isSelectedAccessPoint(accessPoint1)).thenReturn(false);
    when(device1.isActiveAccessPoint(accessPoint1)).thenReturn(false);

    final device2 = MockWifiDeviceModel();
    when(device2.model).thenReturn('model2');
    when(device2.scanning).thenReturn(true);
    when(device2.isBusy).thenReturn(true);

    final accessPoint2 = MockAccessPointModel();
    when(accessPoint2.name).thenReturn('ap2');
    when(accessPoint2.strength).thenReturn(2);
    when(accessPoint2.isOpen).thenReturn(false);
    when(device2.accessPoints).thenReturn([accessPoint2]);
    when(device2.isActiveAccessPoint(accessPoint2)).thenReturn(true);
    when(device2.isSelectedAccessPoint(accessPoint2)).thenReturn(true);

    final model = MockWifiModel();
    when(model.devices).thenReturn([device1, device2]);
    when(model.isSelectedDevice(any)).thenReturn(false);
    when(model.requestScan()).thenAnswer((_) async => null);

    WifiDeviceModel? selectedDevice;
    AccessPointModel? selectedAccessPoint;

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<WifiModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                WifiView(
                  expanded: true,
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

    // device is not scanning
    final model1 = find.descendant(
      of: find.byType(WifiListTile),
      matching: find.widgetWithText(ListTile, 'model1'),
    );
    expect(model1, findsOneWidget);
    expect(
      find.descendant(
        of: model1,
        matching: find.byType(CircularProgressIndicator),
      ),
      findsNothing,
    );
    expect(
      find.descendant(
        of: model1,
        matching: find.byType(CircularProgressIndicator),
      ),
      findsNothing,
    );

    // select ap
    final ap1 = find.descendant(
      of: find.byType(WifiListTile),
      matching: find.widgetWithText(ListTile, 'ap1'),
    );
    expect(ap1, findsOneWidget);
    await tester.tap(ap1);
    expect(selectedDevice, equals(device1));
    expect(selectedAccessPoint, equals(accessPoint1));

    // ap is not busy
    expect(
      find.descendant(
        of: ap1,
        matching: find.byType(CircularProgressIndicator),
      ),
      findsNothing,
    );

    // device is scanning
    final model2 = find.descendant(
      of: find.byType(WifiListTile),
      matching: find.widgetWithText(ListTile, 'model2'),
    );
    expect(model2, findsOneWidget);
    expect(
      find.descendant(
        of: model2,
        matching: find.byType(CircularProgressIndicator),
      ),
      findsOneWidget,
    );

    // select another ap
    final ap2 = find.descendant(
      of: find.byType(WifiListTile),
      matching: find.widgetWithText(ListTile, 'ap2'),
    );
    expect(ap2, findsOneWidget);
    await tester.tap(ap2);
    expect(selectedDevice, equals(device2));
    expect(selectedAccessPoint, equals(accessPoint2));

    // ap is busy
    expect(
      find.descendant(
        of: ap2,
        matching: find.byType(CircularProgressIndicator),
      ),
      findsOneWidget,
    );
  });
}
