import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'connect_model.dart';
import 'connect_view.dart';
import 'ethernet_model.dart';
import 'ethernet_view.dart';
import 'hidden_wifi_model.dart';
import 'hidden_wifi_view.dart';
import 'network_model.dart';
import 'wifi_model.dart';
import 'wifi_view.dart';

export 'connect_model.dart' show ConnectMode;

/// https://github.com/canonical/ubuntu-desktop-installer/issues/30
class NetworkPage extends ConsumerWidget {
  const NetworkPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    final model = ref.read(networkModelProvider);
    model.addConnectMode(ref.read(ethernetModelProvider));
    model.addConnectMode(ref.read(wifiModelProvider));
    model.addConnectMode(ref.read(hiddenWifiModelProvider));
    model.addConnectMode(ref.read(noConnectModelProvider));
    return model.init();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(networkModelProvider);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.connectToInternetPageTitle),
      ),
      header: Text(lang.connectToInternetDescription),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EthernetRadioButton(
            value: model.connectMode,
            onChanged: (_) => model.selectConnectMode(ConnectMode.ethernet),
          ),
          EthernetView(
            expanded: model.connectMode == ConnectMode.ethernet,
            onEnabled: () => model.selectConnectMode(ConnectMode.ethernet),
          ),
          WifiRadioButton(
            value: model.connectMode,
            onChanged: (_) => model.selectConnectMode(ConnectMode.wifi),
          ),
          WifiView(
            expanded: model.connectMode == ConnectMode.wifi,
            onEnabled: () => model.selectConnectMode(ConnectMode.wifi),
            onSelected: (_, __) => model.selectConnectMode(ConnectMode.wifi),
          ),
          HiddenWifiRadioButton(
            value: model.connectMode,
            onChanged: (_) => model.selectConnectMode(ConnectMode.hiddenWifi),
          ),
          HiddenWifiView(
            expanded: model.connectMode == ConnectMode.hiddenWifi,
          ),
          NoConnectView(
            value: model.connectMode,
            onChanged: (_) => model.selectConnectMode(ConnectMode.none),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton(
            label: lang.connectButtonText,
            enabled: !model.isConnecting,
            visible: model.isEnabled && model.canConnect,
            onActivated: model.connect,
          ),
          WizardButton.next(
            context,
            enabled:
                model.isEnabled && !model.isConnecting && model.isConnected,
            visible: !model.isEnabled || !model.canConnect,
            onNext: () => Future.wait([
              // suspend network activity when proceeding on the next page
              model.cleanup(),
              model.markConfigured(),
            ]),
            // resume network activity if/when returning back to this page
            onBack: model.init,
          ),
        ],
      ),
    );
  }
}
