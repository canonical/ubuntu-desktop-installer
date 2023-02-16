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
import 'who_are_you_model.dart';

part 'who_are_you_widgets.dart';

// The horizontal indentation of the radio button.
// const _kRadioButtonIndentation = 36.0;

/// The installer page for setting up the user data.
///
/// It uses [WizardPage] and [WizardAction] to create an installer page.
class WhoAreYouPage extends StatefulWidget {
  /// Creates a the installer page for setting up the user data.
  const WhoAreYouPage({super.key});

  /// Creates an instance with [WhoAreYouModel].
  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WhoAreYouModel(
        client: getService<SubiquityClient>(),
        config: getService<ConfigService>(),
        network: getService<NetworkService>(),
      ),
      child: const WhoAreYouPage(),
    );
  }

  @override
  State<WhoAreYouPage> createState() => _WhoAreYouPageState();
}

class _WhoAreYouPageState extends State<WhoAreYouPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<WhoAreYouModel>(context, listen: false);
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
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled:
              context.select<WhoAreYouModel, bool>((model) => model.isValid),
          arguments: context.select((WhoAreYouModel m) => m.useActiveDirectory),
          onNext: context.read<WhoAreYouModel>().save,
        ),
      ],
    );
  }
}
