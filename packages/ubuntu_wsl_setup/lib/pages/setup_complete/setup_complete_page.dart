import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'setup_complete_model.dart';

part 'setup_complete_widgets.dart';

/// WSL Setup complete page.
///
/// See also:
/// * [SetupCompleteModel]
class SetupCompletePage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const SetupCompletePage({
    super.key,
  });

  /// Creates an instance with [SetupCompleteModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => SetupCompleteModel(client),
      child: const SetupCompletePage(),
    );
  }

  @override
  State<SetupCompletePage> createState() => _SetupCompletePageState();
}

class _SetupCompletePageState extends State<SetupCompletePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<SetupCompleteModel>(context, listen: false);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<SetupCompleteModel>(context);
    return WizardPage(
      title: Text(lang.setupCompleteTitle),
      header: Text(lang.setupCompleteHeader(model.username)),
      content: ListView(
        children: <Widget>[
          Text(lang.setupCompleteUpdate),
          const SizedBox(height: 16),
          const _CodeLabel('\$ sudo apt update'),
          const SizedBox(height: 16),
          const _CodeLabel('\$ sudo apt upgrade'),
          const SizedBox(height: kContentSpacing),
          const SizedBox(height: 56),
          Text(lang.setupCompleteRestart),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.done(
          context,
          label: lang.finishButton,
          onDone: () => model.reboot(immediate: false),
        ),
      ],
    );
  }
}
