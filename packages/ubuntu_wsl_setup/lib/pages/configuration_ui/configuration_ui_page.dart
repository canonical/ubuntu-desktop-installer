import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'configuration_ui_model.dart';

/// View model for [ConfigurationUIPage].
class ConfigurationUIPage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const ConfigurationUIPage({
    Key? key,
  }) : super(key: key);

  /// Creates an instance with [ConfigurationUIModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => ConfigurationUIModel(client),
      child: const ConfigurationUIPage(),
    );
  }

  @override
  State<ConfigurationUIPage> createState() => _ConfigurationUIPageState();
}

class _ConfigurationUIPageState extends State<ConfigurationUIPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<ConfigurationUIModel>(context, listen: false);
    model.loadConfiguration().then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<ConfigurationUIModel>(context);
    return WizardPage(
      title: Text(lang.configurationUITitle),
      headerPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: ListView(
        children: <Widget>[
          Padding(
            padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
            child: Text(lang.configurationUIAutoMountHeader),
          ),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUIAutoMountTitle),
            subtitle: Text(lang.configurationUIAutoMountSubtitle),
            value: model.automountEnabled,
            onChanged: (value) => model.automountEnabled = value!,
          ),
          const SizedBox(height: kContentSpacing),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUIMountFstabTitle),
            subtitle: Text(lang.configurationUIMountFstabSubtitle),
            value: model.automountMountfstab,
            onChanged: (value) => model.automountMountfstab = value!,
          ),
          const SizedBox(height: kContentSpacing),
          Padding(
            padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
            child: Text(lang.configurationUIInteroperabilityHeader),
          ),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUIInteroperabilityTitle),
            subtitle: Text(lang.configurationUIInteroperabilitySubtitle),
            value: model.interopEnabled,
            onChanged: (value) => model.interopEnabled = value!,
          ),
          const SizedBox(height: kContentSpacing),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUIInteropAppendWindowsPathTitle),
            subtitle:
                Text(lang.configurationUIInteropAppendWindowsPathSubtitle),
            value: model.interopAppendwindowspath,
            onChanged: (value) => model.interopAppendwindowspath = value!,
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          highlighted: true,
          label: lang.saveButton,
          enabled: model.isValid,
          onNext: () {
            model.saveConfiguration();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
