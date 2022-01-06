import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
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
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => WhoAreYouModel(client),
      child: const WhoAreYouPage(),
    );
  }

  @override
  _WhoAreYouPageState createState() => _WhoAreYouPageState();
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
    final model = Provider.of<WhoAreYouModel>(context);

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
              child: RealNameFormField(
                fieldWidth: fieldWidth,
                labelText: lang.whoAreYouPageRealNameLabel,
                realName: model.realName,
                onChanged: (value) => model.realName = value,
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: HostnameFormField(
                fieldWidth: fieldWidth,
                labelText: lang.whoAreYouPageComputerNameLabel,
                helperText: lang.whoAreYouPageComputerNameInfo,
                hostname: model.hostname,
                onChanged: (value) => model.hostname = value,
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: UsernameFormField(
                fieldWidth: fieldWidth,
                labelText: lang.whoAreYouPageUsernameLabel,
                username: model.username,
                onChanged: (value) => model.username = value,
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: PasswordFormField(
                fieldWidth: fieldWidth,
                labelText: lang.whoAreYouPagePasswordLabel,
                password: model.password,
                passwordStrength: model.passwordStrength,
                onChanged: (value) => model.password = value,
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: ConfirmPasswordFormField(
                fieldWidth: fieldWidth,
                labelText: lang.whoAreYouPageConfirmPasswordLabel,
                password: model.password,
                confirmedPassword: model.confirmedPassword,
                onChanged: (value) => model.confirmedPassword = value,
              ),
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
          onActivated: () async {
            final model = Provider.of<WhoAreYouModel>(context, listen: false);
            await model.saveIdentity();

            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
