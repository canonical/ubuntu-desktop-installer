import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'connect_model.dart';
import 'connect_to_internet_model.dart';
import 'ethernet_model.dart';
import 'ethernet_view.dart';
import 'hidden_wifi_model.dart';
import 'hidden_wifi_view.dart';
import 'wifi_auth_dialog.dart';
import 'wifi_auth_model.dart';
import 'wifi_model.dart';
import 'wifi_view.dart';

const _kContentPadding = EdgeInsets.symmetric(horizontal: 24);
const _kContentWidthFactor = 0.75;

class ConnectToInternetPage extends StatefulWidget {
  const ConnectToInternetPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    final service = Provider.of<NetworkService>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectToInternetModel()),
        ChangeNotifierProvider(create: (_) => EthernetModel(service)),
        ChangeNotifierProvider(create: (_) => HiddenWifiModel(service)),
        ChangeNotifierProvider(create: (_) => WifiAuthModel()),
        ChangeNotifierProvider(create: (_) => WifiModel(service)),
      ],
      child: ConnectToInternetPage(),
    );
  }

  @override
  _ConnectToInternetPageState createState() => _ConnectToInternetPageState();
}

class _ConnectToInternetPageState extends State<ConnectToInternetPage> {
  Future<Authentication?> _authenticate(
    WifiDeviceModel device,
    AccessPointModel accessPoint,
  ) async {
    return showWifiAuthDialog(
      context: context,
      device: device,
      accessPoint: accessPoint,
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ConnectToInternetModel>(context);
    return LocalizedView(
      builder: (context, lang) {
        return WizardPage(
          title: Text(lang.connectToInternetPageTitle),
          header: Text(lang.connectToInternetDescription),
          contentPadding: EdgeInsets.zero,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              EthernetRadioListTile<ConnectMode>(
                title: Text(lang.useWiredConnection),
                errorTitle: Text(lang.noWiredConnection),
                contentPadding: _kContentPadding,
                value: ConnectMode.ethernet,
                groupValue: model.connectMode,
                onChanged: (_) {
                  model.select(context.read<EthernetModel>());
                },
              ),
              EthernetView(
                title: Text(lang.useWiredConnection),
                contentPadding: _kContentPadding,
                contentWidthFactor: _kContentWidthFactor,
                expanded: model.connectMode == ConnectMode.ethernet,
                onSelected: (device) {
                  model.select(context.read<EthernetModel>());
                },
              ),
              RadioListTile<ConnectMode>(
                title: Text(lang.selectWifiNetwork),
                contentPadding: _kContentPadding,
                value: ConnectMode.wifi,
                groupValue: model.connectMode,
                onChanged: (_) {
                  model.select(context.read<WifiModel>());
                },
              ),
              WifiView(
                contentPadding: _kContentPadding,
                contentWidthFactor: _kContentWidthFactor,
                expanded: model.connectMode == ConnectMode.wifi,
                onSelected: (device, accessPoint) {
                  model.select(context.read<WifiModel>());
                },
              ),
              RadioListTile<ConnectMode>(
                title: Text(lang.hiddenWifiNetwork),
                contentPadding: _kContentPadding,
                value: ConnectMode.hiddenWifi,
                groupValue: model.connectMode,
                onChanged: (_) {
                  model.select(context.read<HiddenWifiModel>());
                },
              ),
              HiddenWifiView(
                contentPadding: _kContentPadding,
                contentWidthFactor: _kContentWidthFactor,
                expanded: model.connectMode == ConnectMode.hiddenWifi,
                onSelected: () {
                  model.select(context.read<HiddenWifiModel>());
                },
              ),
              RadioListTile<ConnectMode>(
                title: Text(lang.noInternet),
                contentPadding: _kContentPadding,
                value: ConnectMode.none,
                groupValue: model.connectMode,
                onChanged: (_) {
                  model.select(NoConnectModel());
                },
              ),
            ],
          ),
          actions: <WizardAction>[
            WizardAction(
              label: lang.backButtonText,
              onActivated: Navigator.of(context).pop,
            ),
            WizardAction(
              label: lang.connectButtonText,
              enabled: model.canConnect && !model.isBusy,
              visible: !model.canContinue,
              onActivated: () => model.connect(onAuthenticate: _authenticate),
            ),
            WizardAction(
              label: lang.continueButtonText,
              enabled: !model.isBusy,
              visible: model.canContinue,
              onActivated: () {
                // TODO: Navigator.pushNamed(context, Routes.turnOffSecureBoot),
              },
            ),
          ],
        );
      },
    );
  }
}
