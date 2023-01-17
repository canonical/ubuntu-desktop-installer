import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import 'advanced_setup_model.dart';

part 'advanced_setup_widgets.dart';

/// WSL Advanced setup page.
///
/// See also:
/// * [AdvancedSetupModel]
class AdvancedSetupPage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const AdvancedSetupPage({
    super.key,
  });

  /// Creates an instance with [AdvancedSetupModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => AdvancedSetupModel(client),
      child: const AdvancedSetupPage(),
    );
  }

  @override
  State<AdvancedSetupPage> createState() => _AdvancedSetupPageState();
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
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text(lang.advancedSetupTitle),
      ),
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
            const _HostGenerationCheckButton(),
            const SizedBox(height: kContentSpacing),
            const _ResolvConfGenerationCheckButton(),
          ],
        );
      }),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          highlighted: true,
          label: lang.setupButton,
          enabled: model.isValid,
          onNext: model.saveAdvancedSetup,
        ),
      ],
    );
  }
}
