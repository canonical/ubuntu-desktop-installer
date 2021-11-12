import 'dart:async';

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

class ConnectToInternetPage extends StatefulWidget {
  const ConnectToInternetPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final udev = Provider.of<UdevService>(context, listen: false);
    final service = Provider.of<NetworkService>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectToInternetModel()),
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

    scheduleMicrotask(() {
      final model = context.read<ConnectToInternetModel>();
      final ethernet = context.read<EthernetModel>();
      final wifi = context.read<WifiModel>();
      final none = context.read<NoConnectModel>();
      if (ethernet.isActive) {
        model.select(ethernet);
      } else if (wifi.isActive) {
        model.select(wifi);
      } else {
        model.select(none);
      }
    });
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
            onChanged: (_) => model.select(context.read<EthernetModel>()),
          ),
          EthernetView(
            expanded: model.connectMode == ConnectMode.ethernet,
            onEnabled: () => model.select(context.read<EthernetModel>()),
          ),
          WifiRadioButton(
            value: model.connectMode,
            onChanged: (_) => model.select(context.read<WifiModel>()),
          ),
          WifiView(
            expanded: model.connectMode == ConnectMode.wifi,
            onEnabled: () => model.select(context.read<WifiModel>()),
            onSelected: (_, __) => model.select(context.read<WifiModel>()),
          ),
          RadioButton<ConnectMode>(
            title: Text(lang.noInternet),
            value: ConnectMode.none,
            contentPadding: const EdgeInsets.only(top: 8),
            groupValue: model.connectMode,
            onChanged: (_) => model.select(context.read<NoConnectModel>()),
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          label: lang.connectButtonText,
          enabled: !model.isBusy,
          visible: model.canConnect,
          onActivated: model.connect,
        ),
        WizardAction.next(
          context,
          enabled: !model.isBusy && model.canContinue,
          visible: !model.canConnect,
          onActivated: Wizard.of(context).next,
        ),
      ],
    );
  }
}
