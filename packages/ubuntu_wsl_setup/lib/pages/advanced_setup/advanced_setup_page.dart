import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'advanced_setup_model.dart';

part 'advanced_setup_utils.dart';
part 'advanced_setup_widgets.dart';

/// WSL Advanced setup page.
///
/// See also:
/// * [AdvancedSetupModel]
class AdvancedSetupPage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const AdvancedSetupPage({
    Key? key,
  }) : super(key: key);

  /// Creates an instance with [AdvancedSetupModel].
  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => AdvancedSetupModel(client),
      child: AdvancedSetupPage(),
    );
  }

  @override
  _AdvancedSetupPageState createState() => _AdvancedSetupPageState();
}

class _AdvancedSetupPageState extends State<AdvancedSetupPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<AdvancedSetupModel>(context, listen: false);
    model.loadAdvancedSetup();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AdvancedSetupModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      contentPadding: EdgeInsets.zero,
      title: Text(lang.advancedSetupTitle),
      header: Text(lang.advancedSetupHeader),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldWidth = constraints.maxWidth * kContentWidthFraction;
        final fieldPadding =
            EdgeInsets.symmetric(horizontal: kContentPadding.left);
        return ListView(
          children: <Widget>[
            Padding(
              padding: fieldPadding,
              child: _MountLocationFormField(fieldWidth: fieldWidth),
            ),
            const SizedBox(height: kContentSpacing),
            Padding(
              padding: fieldPadding,
              child: _MountOptionFormField(fieldWidth: fieldWidth),
            ),
            const SizedBox(height: kContentSpacing * 2),
            _HostGenerationCheckButton(),
            const SizedBox(height: kContentSpacing),
            _ResolvConfGenerationCheckButton(),
          ],
        );
      }),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction(
          highlighted: true,
          label: lang.setupButton,
          enabled: model.isValid,
          onActivated: () {
            model.saveAdvancedSetup();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
