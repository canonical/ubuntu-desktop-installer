import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

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
  const WhoAreYouPage({Key? key}) : super(key: key);

  /// Creates an instance with [WhoAreYouModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => WhoAreYouModel(client),
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
    model.loadIdentity();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

    return WizardPage(
      contentPadding: EdgeInsets.zero,
      title: Text(lang.whoAreYouPageTitle),
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
            const Padding(
              padding: kContentPadding,
              child: _ShowPasswordCheckButton(),
            ),
            // https://github.com/canonical/ubuntu-desktop-installer/issues/373
            // const SizedBox(height: kContentSpacing),
            // _LoginStrategyTile(
            //   value: LoginStrategy.autoLogin,
            //   label: lang.whoAreYouPageAutoLogin,
            // ),
            // _LoginStrategyTile(
            //   value: LoginStrategy.requirePassword,
            //   label: lang.whoAreYouPageRequirePassword,
            // ),
          ],
        );
      }),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled:
              context.select<WhoAreYouModel, bool>((model) => model.isValid),
          onNext: context.read<WhoAreYouModel>().saveIdentity,
        ),
      ],
    );
  }
}
