import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n/app_localizations.dart';
import 'applying_changes_model.dart';

/// WSL Advanced setup page.
///
/// See also:
/// * [AdvancedSetupModel]
class ApplyingChangesPage extends StatelessWidget {
  /// Use [create] instead.
  @visibleForTesting
  const ApplyingChangesPage({
    Key? key,
  }) : super(key: key);

  /// Creates an instance with [AdvancedSetupModel].
  static Widget create(BuildContext context) {
    final monitor = getService<SubiquityStatusMonitor>();
    return ChangeNotifierProvider(
      create: (_) => ApplyingChangesModel(monitor),
      child: const ApplyingChangesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ApplyingChangesModel>(context, listen: false);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.setupCompleteTitle),
      header: Text("Applying changes..."),
      content: StreamBuilder<bool>(
          stream: model.isInstalling(),
          builder: (context, snapshot) {
            if (snapshot.data == false) {
              WidgetsBinding.instance!
                  .addPostFrameCallback((_) => Wizard.of(context).next());
            }
            return Column(
              children: const [
                LinearProgressIndicator(),
                Spacer(),
              ],
            );
          }),
    );
  }
}
