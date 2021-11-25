import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'configure_active_directory_model.dart';

/// https://github.com/canonical/ubuntu-desktop-installer/issues/41
class ConfigureActiveDirectoryPage extends StatefulWidget {
  const ConfigureActiveDirectoryPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfigureActiveDirectoryModel(),
      child: const ConfigureActiveDirectoryPage(),
    );
  }

  @override
  _WhoAreYouPageState createState() => _WhoAreYouPageState();
}

class _WhoAreYouPageState extends State<ConfigureActiveDirectoryPage> {
  @override
  void initState() {
    super.initState();
    final model =
        Provider.of<ConfigureActiveDirectoryModel>(context, listen: false);
    model.load();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ConfigureActiveDirectoryModel>(context);
    final lang = AppLocalizations.of(context);

    return WizardPage(
      contentPadding: EdgeInsets.zero,
      title: Text(lang.configureActiveDirectoryTitle),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldPadding = EdgeInsets.symmetric(
            horizontal: kContentPadding.left, vertical: 10);
        final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
            kContentWidthFraction;

        return ListView(
          children: [
            Padding(
              padding: fieldPadding,
              child: ValidatedFormField(
                fieldWidth: fieldWidth,
                labelText: lang.configureActiveDirectoryDomain,
                initialValue: model.domain,
                onChanged: (value) => model.domain = value,
                validator: RequiredValidator(
                    errorText: lang.configureActiveDirectoryDomainRequired),
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton(
                  onPressed: model.testConnection,
                  child: Text(lang.configureActiveDirectoryTestConnection),
                ),
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: ValidatedFormField(
                fieldWidth: fieldWidth,
                labelText: lang.configureActiveDirectoryAdmin,
                initialValue: model.admin,
                onChanged: (value) => model.admin = value,
                validator: RequiredValidator(
                    errorText: lang.configureActiveDirectoryAdminRequired),
              ),
            ),
            Padding(
              padding: fieldPadding,
              child: ValidatedFormField(
                obscureText: true,
                fieldWidth: fieldWidth,
                labelText: lang.configureActiveDirectoryPassword,
                initialValue: model.password,
                onChanged: (value) => model.password = value,
                validator: RequiredValidator(
                    errorText: lang.configureActiveDirectoryPasswordRequired),
              ),
            ),
          ],
        );
      }),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled: model.isValid,
          onActivated: () async {
            await model.save();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
