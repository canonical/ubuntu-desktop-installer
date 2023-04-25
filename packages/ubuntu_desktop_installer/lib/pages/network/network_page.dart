import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'connect_model.dart';
import 'network_model.dart';
import 'connect_view.dart';
import 'ethernet_model.dart';
import 'ethernet_view.dart';
import 'hidden_wifi_model.dart';
import 'hidden_wifi_view.dart';
import 'wifi_model.dart';
import 'wifi_view.dart';

/// https://github.com/canonical/ubuntu-desktop-installer/issues/30
class NetworkPage extends StatefulWidget {
  @visibleForTesting
  const NetworkPage({super.key});

  static Widget create(BuildContext context) {
    final udev = getService<UdevService>();
    final service = getService<NetworkService>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NetworkModel(service)),
        ChangeNotifierProvider(create: (_) => EthernetModel(service, udev)),
        ChangeNotifierProvider(create: (_) => WifiModel(service, udev)),
        ChangeNotifierProvider(create: (_) => HiddenWifiModel(service, udev)),
        ChangeNotifierProvider(create: (_) => NoConnectModel()),
      ],
      child: const NetworkPage(),
    );
  }

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  void initState() {
    super.initState();

    final model = context.read<NetworkModel>();
    model.addConnectMode(context.read<EthernetModel>());
    model.addConnectMode(context.read<WifiModel>());
    model.addConnectMode(context.read<HiddenWifiModel>());
    model.addConnectMode(context.read<NoConnectModel>());
    model.init().then((_) => model.selectConnectMode());
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NetworkModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.connectToInternetPageTitle),
      ),
      header: Text(lang.connectToInternetDescription),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
        leading: WizardAction.back(context),
        trailing: [
          WizardAction(
            label: lang.connectButtonText,
            enabled: !model.isConnecting,
            visible: model.isEnabled && model.canConnect,
            onActivated: model.connect,
          ),
          WizardAction.next(
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
