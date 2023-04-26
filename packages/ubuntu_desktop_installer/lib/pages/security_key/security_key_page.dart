import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'security_key_model.dart';

part 'security_key_widgets.dart';

/// Choose security key page.
///
/// See also:
/// * [SecurityKeyModel]
class SecurityKeyPage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const SecurityKeyPage({
    super.key,
  });

  /// Creates an instance with [SecurityKeyModel].
  static Widget create(BuildContext context) {
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (_) => SecurityKeyModel(service),
      child: const SecurityKeyPage(),
    );
  }

  @override
  State<SecurityKeyPage> createState() => _SecurityKeyPageState();
}

class _SecurityKeyPageState extends State<SecurityKeyPage> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<SecurityKeyModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.loadSecurityKey();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            _SecurityKeyFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kContentSpacing),
            _ConfirmSecurityKeyFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kContentSpacing / 2),
            const _SecurityKeyShowButton(),
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
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            enabled: context
                .select<SecurityKeyModel, bool>((model) => model.isValid),
            onNext: context.read<SecurityKeyModel>().saveSecurityKey,
            onBack: context.read<SecurityKeyModel>().loadSecurityKey,
          ),
        ],
      ),
    );
  }
}
