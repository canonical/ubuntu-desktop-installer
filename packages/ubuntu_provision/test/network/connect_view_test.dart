import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_provision/src/network/connect_model.dart';
import 'package:ubuntu_provision/src/network/connect_view.dart';
import 'package:ubuntu_provision/src/network/ethernet_model.dart';
import 'package:ubuntu_provision/src/network/wifi_model.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'test_network.dart';

void main() {
  testWidgets('disabled when no ethernet nor wifi', (tester) async {
    final ethernet = buildEthernetModel(isEnabled: false);
    final wifi = buildWifiModel(isEnabled: true);

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
