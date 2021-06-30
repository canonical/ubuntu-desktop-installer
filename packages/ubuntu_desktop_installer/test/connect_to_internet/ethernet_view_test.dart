import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_view.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';

import 'ethernet_view_test.mocks.dart';

@GenerateMocks([EthernetModel, EthernetDeviceModel])
void main() {
  testWidgets('empty ethernet view', (tester) async {
    final model = MockEthernetModel();
    when(model.devices).thenReturn([]);

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<EthernetModel>.value(
          value: model,
          child: EthernetView(expanded: true, onSelected: (_) {}),
        ),
      ),
    );

    final children = find.descendant(
      of: find.byType(EthernetView),
      matching: find.byWidgetPredicate((_) => true),
    );
    expect(children, findsOneWidget);
    expect(tester.widget(children.first), isInstanceOf<SizedBox>());
  });

  testWidgets('multiple ethernet devices', (tester) async {
    final device1 = MockEthernetDeviceModel();
    when(device1.model).thenReturn('model1');
    when(device1.vendor).thenReturn(null);
    when(device1.isActive).thenReturn(false);

    final device2 = MockEthernetDeviceModel();
    when(device2.model).thenReturn('model2');
    when(device2.vendor).thenReturn(null);
    when(device2.isActive).thenReturn(false);

    final model = MockEthernetModel();
    when(model.devices).thenReturn([device1, device2]);
    when(model.isSelectedDevice(any)).thenReturn(false);

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<EthernetModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                EthernetView(expanded: true, onSelected: (_) {}),
              ],
            ),
          ),
        ),
      ),
    );

    expect(
      find.descendant(
        of: find.byType(ListView),
        matching: find.widgetWithText(ListTile, 'model1'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(ListView),
        matching: find.widgetWithText(ListTile, 'model2'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('select ethernet device', (tester) async {
    final device1 = MockEthernetDeviceModel();
    when(device1.model).thenReturn('model1');
    when(device1.vendor).thenReturn(null);
    when(device1.isActive).thenReturn(false);

    final device2 = MockEthernetDeviceModel();
    when(device2.model).thenReturn('model2');
    when(device2.vendor).thenReturn(null);
    when(device2.isActive).thenReturn(false);

    final model = MockEthernetModel();
    when(model.devices).thenReturn([device1, device2]);
    when(model.isSelectedDevice(any)).thenReturn(false);

    EthernetDeviceModel? selectedDevice;

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<EthernetModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                EthernetView(
                  expanded: true,
                  onSelected: (device) => selectedDevice = device,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final model1 = find.descendant(
      of: find.byType(ListView),
      matching: find.widgetWithText(ListTile, 'model1'),
    );
    await tester.tap(model1);
    expect(selectedDevice, equals(device1));

    final model2 = find.descendant(
      of: find.byType(ListView),
      matching: find.widgetWithText(ListTile, 'model2'),
    );
    await tester.tap(model2);
    expect(selectedDevice, equals(device2));
  });

  testWidgets('select ethernet mode', (tester) async {
    ConnectMode? mode;

    final model = MockEthernetModel();
    when(model.devices).thenReturn([MockEthernetDeviceModel()]);

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<EthernetModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                EthernetRadioListTile<ConnectMode>(
                  value: ConnectMode.ethernet,
                  groupValue: ConnectMode.none,
                  onChanged: (value) => mode = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final tile = find.byWidgetPredicate((widget) {
      return widget is EthernetRadioListTile<ConnectMode>;
    });
    expect(tile, findsOneWidget);
    await tester.tap(tile);
    expect(mode, equals(ConnectMode.ethernet));
  });

  testWidgets('no ethernet devices', (tester) async {
    final model = MockEthernetModel();
    when(model.devices).thenReturn([]);

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<EthernetModel>.value(
          value: model,
          child: Material(
            child: Column(
              children: [
                EthernetRadioListTile<dynamic>(
                  value: ConnectMode.ethernet,
                  groupValue: ConnectMode.none,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(RadioIconTile), findsOneWidget);
    expect(find.byType(RadioListTile), findsNothing);
  });
}
