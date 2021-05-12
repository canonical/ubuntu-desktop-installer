import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets.dart';
import '../../widgets/localized_view.dart';
import 'updates_other_software_model.dart';

const _kButtonPadding = EdgeInsets.only(right: 20, bottom: 20);

class UpdatesOtherSoftwarePage extends StatefulWidget {
  @override
  _UpdatesOtherSoftwarePageState createState() =>
      _UpdatesOtherSoftwarePageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal),
      child: UpdatesOtherSoftwarePage(),
    );
  }
}

class _UpdatesOtherSoftwarePageState extends State<UpdatesOtherSoftwarePage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<UpdateOtherSoftwareModel>();
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
          title: Text(lang.updatesOtherSoftwarePageTitle),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(lang.updatesOtherSoftwarePageDescription),
              ),
              RadioListTile<InstallationMode>(
                title: Text(lang.normalInstallationTitle),
                subtitle: Text(lang.normalInstallationSubtitle),
                value: InstallationMode.normal,
                groupValue: model.installationMode,
                onChanged: model.setInstallationMode,
              ),
              RadioListTile<InstallationMode>(
                title: Text(lang.minimalInstallationTitle),
                subtitle: Text(lang.minimalInstallationSubtitle),
                value: InstallationMode.minimal,
                groupValue: model.installationMode,
                onChanged: model.setInstallationMode,
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(lang.otherOptions),
              ),
              CheckboxListTile(
                  title: Text(lang.installThirdPartyTitle),
                  subtitle: Text(lang.installThirdPartySubtitle),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: model.installThirdParty,
                  onChanged: model.setInstallThirdParty)
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: _kButtonPadding,
          child: ButtonBar(
            children: <Widget>[
              OutlinedButton(
                child: Text(lang.backButtonText),
                onPressed: Navigator.of(context).pop,
              ),
              OutlinedButton(
                child: Text(lang.continueButtonText),
                onPressed: () {
                  // TODO: add next step here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
