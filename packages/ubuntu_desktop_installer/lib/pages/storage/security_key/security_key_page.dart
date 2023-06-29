import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'security_key_model.dart';
import 'security_key_widgets.dart';

/// Choose security key page.
///
/// See also:
/// * [SecurityKeyModel]
class SecurityKeyPage extends ConsumerWidget {
  const SecurityKeyPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(securityKeyModelProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final flavor = ref.watch(flavorProvider);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.chooseSecurityKeyTitle),
      ),
      header: FractionallySizedBox(
        widthFactor: kWizardWidthFraction,
        child: Text(lang.chooseSecurityKeyHeader(flavor.name)),
      ),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldWidth = constraints.maxWidth * kWizardWidthFraction;
        return ListView(
          children: <Widget>[
            SecurityKeyFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kWizardSpacing),
            ConfirmSecurityKeyFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kWizardSpacing / 2),
            const SecurityKeyShowButton(),
            const SizedBox(height: kWizardSpacing),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: kWizardWidthFraction,
                child: Html(
                  data: lang.chooseSecurityKeyWarning(
                      Theme.of(context).colorScheme.error.toHex()),
                  style: {'body': Style(margin: Margins.zero)},
                ),
              ),
            ),
          ],
        );
      }),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: ref.watch(
                securityKeyModelProvider.select((model) => model.isValid)),
            onNext: ref.read(securityKeyModelProvider).saveSecurityKey,
            onBack: ref.read(securityKeyModelProvider).loadSecurityKey,
          ),
        ],
      ),
    );
  }
}
