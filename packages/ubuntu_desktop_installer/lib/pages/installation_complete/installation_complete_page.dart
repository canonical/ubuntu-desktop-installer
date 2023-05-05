import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'installation_complete_model.dart';

class InstallationCompletePage extends ConsumerWidget {
  const InstallationCompletePage({super.key});

  static final modelProvider = ChangeNotifierProvider(
    (_) => InstallationCompleteModel(
      getService<SubiquityClient>(),
      getService<ProductService>(),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final model = ref.watch(modelProvider);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.installationCompleteTitle),
      ),
      content: Row(
        children: [
          const Spacer(flex: 2),
          const MascotAvatar(),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MarkdownBody(
                  data: lang.readyToUse(model.productInfo),
                  styleSheet: MarkdownStyleSheet(
                    p: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: kContentSpacing * 1.5),
                Text(lang.restartWarning(Flavor.of(context).name)),
                const SizedBox(height: kContentSpacing * 1.5),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final window = YaruWindow.of(context);
                          model.reboot().then((_) => window.close());
                        },
                        child: Text(lang.restartNow),
                      ),
                    ),
                    const SizedBox(width: kContentSpacing),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: YaruWindow.of(context).close,
                        child: Text(lang.continueTesting),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
