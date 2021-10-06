import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
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
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => ConfigurationUIModel(client),
      child: ConfigurationUIPage(),
    );
  }

  @override
  _ConfigurationUIPageState createState() => _ConfigurationUIPageState();
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
            child: Text(lang.configurationUIInteroperabilityHeader),
          ),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUILegacyGUIIntegrationTitle),
            subtitle: Text(lang.configurationUILegacyGUIIntegrationSubtitle),
            value: model.interopGuiintegration,
            onChanged: (value) => model.interopGuiintegration = value!,
          ),
          const SizedBox(height: kContentSpacing),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUILegacyAudioIntegrationTitle),
            subtitle: Text(lang.configurationUILegacyAudioIntegrationSubtitle),
            value: model.interopAudiointegration,
            onChanged: (value) => model.interopAudiointegration = value!,
          ),
          const SizedBox(height: kContentSpacing),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUIAdvancedIPDetectionTitle),
            subtitle: Text(lang.configurationUIAdvancedIPDetectionSubtitle),
            value: model.advancedIPDetection,
            onChanged: (value) => model.advancedIPDetection = value!,
          ),
          Padding(
            padding: kHeaderPadding.copyWith(bottom: kContentSpacing),
            child: Text(lang.configurationUIMessageOfTheDayHeader),
          ),
          CheckButton(
            contentPadding: kContentPadding,
            title: Text(lang.configurationUIWSLNewsTitle),
            subtitle: Text(lang.configurationUIWSLNewsSubtitle),
            value: model.motdWSLnewsenabled,
            onChanged: (value) => model.motdWSLnewsenabled = value!,
          ),
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
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          highlighted: true,
          label: lang.saveButton,
          enabled: model.isValid,
          onActivated: model.saveConfiguration,
        ),
      ],
    );
  }
}
