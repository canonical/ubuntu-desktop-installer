import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'refresh_model.dart';
import 'refresh_widgets.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RefreshModel(getService<RefreshService>()),
      child: const RefreshPage(),
    );
  }

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  @override
  void initState() {
    super.initState();
    final model = context.read<RefreshModel>();
    final window = YaruWindow.of(context);
    model.init().then((_) {
      window.setClosable(!model.state.busy);
      model.addListener(() => window.setClosable(!model.state.busy));
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = context.watch<RefreshModel>();

    final back = WizardAction.back(context);
    final skip = WizardAction(
      label: lang.skipButtonText,
      execute: Wizard.of(context).next,
    );
    final restart = WizardAction(
      label: lang.restartButtonText,
      highlighted: true,
      onActivated: model.restart,
    );

    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.refreshTitle),
      ),
      content: model.state.when(
        checking: () => const RefreshCheckingView(),
        status: (status) => RefreshStatusView(
          status: status,
          onRefresh: model.refresh,
        ),
        progress: (change) => RefreshProgressView(change: change),
        done: () => const RefreshRestartView(),
        error: (error) => RefreshRestartView(error: error),
      ),
      actions: model.state.when(
        checking: () => [back, skip],
        status: (_) => [back, skip],
        progress: (_) => [],
        done: () => [restart],
        error: (_) => [restart],
      ),
    );
  }
}
