import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:wizard_router/wizard_router.dart';

import '../../constants.dart';
import '../../utils.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'who_are_you_model.dart';

part 'who_are_you_widgets.dart';

// The spacing between text form fields and checkmark icons.
const _kIconSpacing = 10.0;

// The horizontal indentation of the radio button.
const _kRadioButtonIndentation = 36.0;

// The fraction of the content width in relation to the page.
const _kContentWidthFraction = 0.7;

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
      child: WhoAreYouPage(),
    );
  }

  @override
  _WhoAreYouPageState createState() => _WhoAreYouPageState();
}

class _WhoAreYouPageState extends State<WhoAreYouPage> {
  final _whoAreYouFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final model = Provider.of<WhoAreYouModel>(context, listen: false);
    model.loadIdentity();
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(builder: (context, lang) {
      return WizardPage(
        contentPadding: EdgeInsets.zero,
        title: Text(lang.whoAreYouPageTitle),
        content: LayoutBuilder(builder: (context, constraints) {
          final fieldPadding = EdgeInsets.symmetric(
              horizontal: kContentPadding.left, vertical: 10);
          final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
              _kContentWidthFraction;

          return Form(
            key: _whoAreYouFormKey,
            child: ListView(
              children: [
                Padding(
                  padding: fieldPadding,
                  child: _RealNameFormField(fieldWidth: fieldWidth),
                ),
                Padding(
                  padding: fieldPadding,
                  child: _HostNameFormField(fieldWidth: fieldWidth),
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
                _LoginStrategyTile(
                  value: LoginStrategy.autoLogin,
                  label: lang.whoAreYouPageAutoLogin,
                ),
                _LoginStrategyTile(
                  value: LoginStrategy.requirePassword,
                  label: lang.whoAreYouPageRequirePassword,
                ),
              ],
            ),
          );
        }),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Wizard.of(context).back,
          ),
          WizardAction(
            label: lang.continueButtonText,
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
    });
  }
}
