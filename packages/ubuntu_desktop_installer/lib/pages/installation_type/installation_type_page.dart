import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'installation_type_dialogs.dart';
import 'installation_type_model.dart';

/// Select between guided and manual partitioning.
class InstallationTypePage extends StatefulWidget {
  /// Use [InstallationTypePage.create] instead.
  @visibleForTesting
  const InstallationTypePage({Key? key}) : super(key: key);

  /// Creates a [InstallationTypePage] with [InstallationTypeModel].
  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => InstallationTypeModel(client),
      child: InstallationTypePage(),
    );
  }

  @override
  _InstallationTypePageState createState() => _InstallationTypePageState();
}

class _InstallationTypePageState extends State<InstallationTypePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallationTypeModel>(context, listen: false);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<InstallationTypeModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.installationTypeTitle),
      header: Text(
        model.existingOS == null
            ? lang.installationTypeNoOSDetected
            : lang.installationTypeOSDetected(model.existingOS!),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (model.existingOS != null)
            RadioButton<InstallationType>(
              title: Text(lang.installationTypeReinstall(model.existingOS!)),
              subtitle: Html(
                data: lang.installationTypeReinstallWarning(
                    Theme.of(context).errorColor.toHex(), model.existingOS!),
                style: {'body': Style(margin: EdgeInsets.all(0))},
              ),
              value: InstallationType.reinstall,
              groupValue: model.installationType,
              onChanged: (v) => model.installationType = v!,
            ),
          if (model.existingOS != null) const SizedBox(height: kContentSpacing),
          if (model.existingOS != null)
            RadioButton<InstallationType>(
              title: Text(lang.installationTypeAlongside(
                  model.productInfo, model.existingOS!)),
              subtitle: Text(lang.installationTypeAlongsideInfo),
              value: InstallationType.alongside,
              groupValue: model.installationType,
              onChanged: (v) => model.installationType = v!,
            ),
          if (model.existingOS != null) const SizedBox(height: kContentSpacing),
          RadioButton<InstallationType>(
            title: Text(lang.installationTypeErase),
            subtitle: Html(
              data: lang.installationTypeEraseWarning(
                  Theme.of(context).errorColor.toHex()),
              style: {'body': Style(margin: EdgeInsets.all(0))},
            ),
            value: InstallationType.erase,
            groupValue: model.installationType,
            onChanged: (value) => model.installationType = value!,
          ),
          const SizedBox(height: kContentSpacing),
          RadioIconTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () => showAdvancedFeaturesDialog(context, model),
                  child: Text(lang.installationTypeAdvancedLabel),
                ),
                const SizedBox(width: kContentSpacing),
                Text(model.advancedFeature == AdvancedFeature.lvm
                    ? lang.installationTypeLVMSelected
                    : model.advancedFeature == AdvancedFeature.zfs
                        ? lang.installationTypeZFSSelected
                        : lang.installationTypeNoneSelected),
              ],
            ),
          ),
          const SizedBox(height: kContentSpacing),
          RadioButton<InstallationType>(
            title: Text(lang.installationTypeManual),
            subtitle: Text(lang.installationTypeManualInfo),
            value: InstallationType.manual,
            groupValue: model.installationType,
            onChanged: (v) => model.installationType = v!,
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(context),
      ],
    );
  }
}

// TODO: https://github.com/canonical/ubuntu-desktop-installer/pull/308
extension _HexColor on Color {
  String toHex() =>
      _formatHex(alpha.toHex(), red.toHex(), green.toHex(), blue.toHex());
  String _formatHex(String a, String r, String g, String b) => '#$a$r$g$b';
}

extension _IntHex on int {
  String toHex() => toRadixString(16).padLeft(2, '0');
}
