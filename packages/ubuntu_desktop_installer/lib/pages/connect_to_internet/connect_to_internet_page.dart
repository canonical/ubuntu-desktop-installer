import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'connect_model.dart';
import 'connect_to_internet_model.dart';
import 'ethernet_model.dart';
import 'ethernet_view.dart';
import 'wifi_model.dart';
import 'wifi_view.dart';

/// https://github.com/canonical/ubuntu-desktop-installer/issues/30
class ConnectToInternetPage extends StatefulWidget {
  @visibleForTesting
  const ConnectToInternetPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final udev = getService<UdevService>();
    final service = getService<NetworkService>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectToInternetModel(service)),
        ChangeNotifierProvider(create: (_) => EthernetModel(service, udev)),
        ChangeNotifierProvider(create: (_) => WifiModel(service, udev)),
        ChangeNotifierProvider(create: (_) => NoConnectModel()),
      ],
      child: const ConnectToInternetPage(),
    );
  }

  @override
  _ConnectToInternetPageState createState() => _ConnectToInternetPageState();
}

class _ConnectToInternetPageState extends State<ConnectToInternetPage> {
  @override
  void initState() {
    super.initState();

    final model = context.read<ConnectToInternetModel>();
    model.addConnectMode(context.read<EthernetModel>());
    model.addConnectMode(context.read<WifiModel>());
    model.addConnectMode(context.read<NoConnectModel>());
    model.init().then((_) => model.selectConnectMode());
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ConnectToInternetModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.connectToInternetPageTitle),
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
          RadioButton<ConnectMode>(
            title: Text(lang.noInternet),
            value: ConnectMode.none,
            contentPadding: const EdgeInsets.only(top: 8),
            groupValue: model.connectMode,
            onChanged: (_) => model.selectConnectMode(ConnectMode.none),
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          label: lang.connectButtonText,
          enabled: !model.isConnecting,
          visible: model.isEnabled && model.canConnect,
          onActivated: model.connect,
        ),
        WizardAction.next(
          context,
          enabled: model.isEnabled && !model.isConnecting && model.isConnected,
          visible: !model.isEnabled || !model.canConnect,
          onActivated: Wizard.of(context).next,
        ),
      ],
    );
  }
}
