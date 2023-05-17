import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'profile_setup_model.dart';

part 'profile_setup_widgets.dart';

/// WSL Profile setup page.
///
/// See also:
/// * [ProfileSetupModel]
class ProfileSetupPage extends StatefulWidget {
  /// Use [create] instead.
  @visibleForTesting
  const ProfileSetupPage({super.key});

  /// Creates an instance with [ProfileSetupModel].
  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => ProfileSetupModel(client),
      child: const ProfileSetupPage(),
    );
  }

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<ProfileSetupModel>(context, listen: false);
    model.loadProfileSetup();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<ProfileSetupModel>(context);
    final textColor = Theme.of(context).textTheme.bodyMedium!.color;
    return WizardPage(
      contentPadding: EdgeInsets.zero,
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text(lang.profileSetupTitle),
      ),
      header: AbsorbPointer(
        child: Html(
          data: lang.profileSetupHeader,
          style: {
            'body': Style(margin: Margins.zero),
            'a': Style(textDecoration: TextDecoration.none, color: textColor),
          },
          onLinkTap: (url, _, __) => launchUrl(url!),
        ),
      ),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldPadding = EdgeInsets.symmetric(
            horizontal: kContentPadding.left, vertical: 12);
        final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
            kContentWidthFraction;

        return ListView(
          children: <Widget>[
            Padding(
              padding: fieldPadding,
              child: _RealNameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _UsernameFormField(fieldWidth: fieldWidth),
            ),
            const SizedBox(height: kContentSpacing),
            Padding(
              padding: fieldPadding,
              child: _PasswordFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _ConfirmPasswordFormField(fieldWidth: fieldWidth),
            ),
            // NOTE: The "Show advanced options" checkbox was temporarily removed (#431).
            //       See [ProfileSetupModel.showAdvancedOptions] for more details.
            //
            // const SizedBox(height: kContentSpacing),
            // const _ShowAdvancedOptionsCheckButton(),
          ],
        );
      }),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: model.isValid,
            arguments: model.showAdvancedOptions,
            onNext: model.saveProfileSetup,
          ),
        ],
      ),
    );
  }
}
