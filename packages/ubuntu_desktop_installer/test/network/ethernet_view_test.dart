import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_view.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'test_network.dart';

void main() {
  setUpAll(() => InstallerTester.context = Column);

  testWidgets('select ethernet mode', (tester) async {
    ConnectMode? mode;

    final model = buildEthernetModel(devices: [MockEthernetDevice()]);

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ProviderScope(
          overrides: [
            ethernetModelProvider.overrideWith((_) => model),
          ],
          child: Material(
            child: EthernetRadioButton(
              value: ConnectMode.none,
              onChanged: (value) => mode = value,
            ),
          ),
        ),
      ),
    );

    final tile = find.byType(EthernetRadioButton);
    expect(tile, findsOneWidget);
    await tester.tap(tile);
    expect(mode, equals(ConnectMode.ethernet));
  });

  testWidgets('ethernet disabled', (tester) async {
    final model =
        buildEthernetModel(isEnabled: false, devices: [MockEthernetDevice()]);

    var wasEnabled = false;

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ProviderScope(
          overrides: [
            ethernetModelProvider.overrideWith((_) => model),
          ],
          child: Column(
            children: [
              EthernetRadioButton(
                value: ConnectMode.none,
                onChanged: (value) {},
              ),
              EthernetView(
                expanded: true,
                onEnabled: () => wasEnabled = true,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(YaruRadioButton<ConnectMode>), findsNothing);

    expect(find.text(tester.lang.wiredDisabled), findsOneWidget);
    expect(find.text(tester.lang.wiredMustBeEnabled), findsOneWidget);

    final button = find.button(tester.lang.enableWired);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(wasEnabled, isTrue);
  });

  testWidgets('no ethernet devices', (tester) async {
    final model = buildEthernetModel();

    await tester.pumpWidget(
      tester.buildApp(
        (_) => ProviderScope(
          overrides: [
            ethernetModelProvider.overrideWith((_) => model),
          ],
          child: Column(
            children: [
              EthernetRadioButton(
                value: ConnectMode.none,
                onChanged: (value) {},
              ),
              EthernetView(
                expanded: true,
                onEnabled: () {},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(OutlinedButton), findsNothing);
    expect(find.byType(YaruRadioButton<ConnectMode>), findsNothing);
    expect(find.text(tester.lang.noWiredConnection), findsOneWidget);
  });
}
