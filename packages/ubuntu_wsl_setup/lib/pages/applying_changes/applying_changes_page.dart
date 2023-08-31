import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import 'applying_changes_model.dart';

/// WSL Advanced setup page.
///
/// See also:
/// * [AdvancedSetupModel]
class ApplyingChangesPage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const ApplyingChangesPage({
    super.key,
  });

  /// Creates an instance with [AdvancedSetupModel].
  static Widget create(BuildContext context) {
    final monitor = getService<SubiquityStatusMonitor>();
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => ApplyingChangesModel(client, monitor),
      child: const ApplyingChangesPage(),
    );
  }

  @override
  State<ApplyingChangesPage> createState() => _ApplyingChangesPageState();
}

class _ApplyingChangesPageState extends State<ApplyingChangesPage> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<ApplyingChangesModel>(context, listen: false);
    model.init().then((_) {
      if (!mounted) return;
      YaruWindow.of(context).close();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text(lang.setupCompleteTitle),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const YaruCircularProgressIndicator(),
          const SizedBox(height: kWizardSpacing),
          Text(lang.applyingChanges),
          const SizedBox(height: kWizardSpacing),
          Text(
            lang.applyingChangesDisclaimer,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
