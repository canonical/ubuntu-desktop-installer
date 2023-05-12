import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
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
    model.init().then((_) => Wizard.of(context).next());
  }

  @override
  Widget build(BuildContext context) {
    final flavor = Flavor.of(context);
    final lang = AppLocalizations.of(context);
    final style = Theme.of(context).textTheme.headlineSmall!;
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.welcomePageTitle(flavor.name)),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox.square(
            dimension: 72,
            child: RepaintBoundary(child: YaruCircularProgressIndicator()),
          ),
          const SizedBox(height: kContentSpacing * 2),
          Text(lang.preparingUbuntu(flavor.name), style: style),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context, enabled: false),
        trailing: [
          WizardButton.next(context, enabled: false),
        ],
      ),
    );
  }
}
