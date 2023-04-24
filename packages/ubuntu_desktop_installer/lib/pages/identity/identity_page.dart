import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'identity_model.dart';

part 'identity_widgets.dart';

// The horizontal indentation of the radio button.
// const _kRadioButtonIndentation = 36.0;

/// The installer page for setting up the user data.
///
/// It uses [WizardPage] and [WizardAction] to create an installer page.
class IdentityPage extends StatefulWidget {
  /// Creates a the installer page for setting up the user data.
  const IdentityPage({super.key});

  /// Creates an instance with [IdentityModel].
  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IdentityModel(
        client: getService<SubiquityClient>(),
        config: getService<ConfigService>(),
        network: getService<NetworkService>(),
        telemetry: getService<TelemetryService>(),
      ),
      child: const IdentityPage(),
    );
  }

  @override
  State<IdentityPage> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<IdentityModel>(context, listen: false);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return WizardPage(
      contentPadding: EdgeInsets.zero,
      title: YaruWindowTitleBar(
        title: Text(lang.whoAreYouPageTitle),
      ),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldPadding = EdgeInsets.symmetric(
            horizontal: kContentPadding.left, vertical: 10);
        final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
            kContentWidthFraction;

        return ListView(
          children: [
            Padding(
              padding: fieldPadding,
              child: _RealNameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _HostnameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _UsernameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _PasswordFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _ConfirmPasswordFormField(fieldWidth: fieldWidth),
            ),
            const SizedBox(height: kContentSpacing / 2),
            const _AutoLoginSwitch(),
            const SizedBox(height: kContentSpacing / 2),
            const Padding(
              padding: kContentPadding,
              child: _UseActiveDirectoryCheckButton(),
            ),
          ],
        );
      }),
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            enabled:
                context.select<IdentityModel, bool>((model) => model.isValid),
            arguments:
                context.select((IdentityModel m) => m.useActiveDirectory),
            onNext: context.read<IdentityModel>().save,
          ),
        ],
      ),
    );
  }
}
