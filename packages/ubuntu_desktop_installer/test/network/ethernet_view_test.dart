import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_view.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'ethernet_view_test.mocks.dart';

@GenerateMocks([EthernetModel, EthernetDevice])
void main() {
  setUpAll(() => UbuntuTester.context = Column);

  testWidgets('select ethernet mode', (tester) async {
    ConnectMode? mode;

    final model = MockEthernetModel();
    when(model.isEnabled).thenReturn(true);
    when(model.devices).thenReturn([MockEthernetDevice()]);

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
    final model = MockEthernetModel();
    when(model.isEnabled).thenReturn(false);
    when(model.devices).thenReturn([MockEthernetDevice()]);

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
    final model = MockEthernetModel();
    when(model.devices).thenReturn([]);
    when(model.isEnabled).thenReturn(true);

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
