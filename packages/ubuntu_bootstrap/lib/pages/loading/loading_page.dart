import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'loading_model.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  void initState() {
    super.initState();

    final model = ref.read(loadingModelProvider);
    model.init().then((_) => Wizard.of(context).replace());
  }

  @override
  Widget build(BuildContext context) {
    final flavor = ref.watch(flavorProvider);
    final lang = UbuntuBootstrapLocalizations.of(context);
    final style = Theme.of(context).textTheme.headlineSmall!;
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.loadingPageTitle(flavor.name)),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox.square(
            dimension: 72,
            child: RepaintBoundary(child: YaruCircularProgressIndicator()),
          ),
          const SizedBox(height: kWizardSpacing * 2),
          Text(lang.loadingHeader(flavor.name), style: style),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context, enabled: false),
        trailing: [WizardButton.next(context, enabled: false)],
      ),
    );
  }
}
