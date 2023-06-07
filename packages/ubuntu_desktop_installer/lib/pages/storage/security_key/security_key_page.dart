import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
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
    return ref
        .read(securityKeyModelProvider.notifier)
        .loadSecurityKey()
        .then((_) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.chooseSecurityKeyTitle),
      ),
      header: FractionallySizedBox(
        widthFactor: kContentWidthFraction,
        child: Text(lang.chooseSecurityKeyHeader(flavor.name)),
      ),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldWidth = constraints.maxWidth * kContentWidthFraction;
        return ListView(
          children: <Widget>[
            SecurityKeyFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kContentSpacing),
            ConfirmSecurityKeyFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kContentSpacing / 2),
            const SecurityKeyShowButton(),
            const SizedBox(height: kContentSpacing),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: kContentWidthFraction,
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
            root: true,
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
