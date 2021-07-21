import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../app_theme.dart';
import '../../routes.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'who_are_you_model.dart';

/// The installer page for setting up the user data.
///
/// It uses [WizardPage] and [WizardAction] to create an installer page.
class WhoAreYouPage extends StatefulWidget {
  /// Creates a the installer page for setting up the user data.
  const WhoAreYouPage({Key? key}) : super(key: key);

  ///
  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          WhoAreYouModel(Provider.of<SubiquityClient>(context, listen: false)),
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

    final whoAreYouModel = Provider.of<WhoAreYouModel>(context, listen: false);
    whoAreYouModel.loadIdentity();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const padding = 10.0;
    const screenFactor = 1.6;
    final successIcon =
        Icon(Icons.check_circle, color: Theme.of(context).successColor);
    final whoAreYouModel = Provider.of<WhoAreYouModel>(context, listen: true);

    return LocalizedView(builder: (context, lang) {
      Widget buildPasswordStrengthLabel(
        PasswordStrength? passwordStrength,
      ) {
        final weakPasswordLabel = lang.whoAreYouPagePasswordWeakPasswordLabel;
        final averagePasswordLabel =
            lang.whoAreYouPagePasswordAveragePasswordLabel;
        final strongPasswordLabel =
            lang.whoAreYouPagePasswordStrongPasswordLabel;

        switch (passwordStrength) {
          case PasswordStrength.weakPassword:
            return Text(weakPasswordLabel,
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                ));
          case PasswordStrength.averagePassword:
            return Text(averagePasswordLabel);
          case PasswordStrength.strongPassword:
            return Text(strongPasswordLabel,
                style: TextStyle(
                  color: Theme.of(context).successColor,
                ));
          default:
            return SizedBox.shrink();
        }
      }

      return WizardPage(
        title: Text(lang.whoAreYouPageTitle),
        content: SingleChildScrollView(
          child: Form(
            key: _whoAreYouFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: padding, bottom: padding),
                  child: ValidatedFormField(
                    fieldWidth: size.width / screenFactor,
                    spacing: padding,
                    initialValue: whoAreYouModel.realName,
                    onChanged: (value) => whoAreYouModel.realName = value,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: lang
                              .whoAreYouPageRealNameRequiredValidatorErrorText),
                      MinLengthValidator(2,
                          errorText: lang
                              .whoAreYouPageRealNameMinLengthValidatorErrorText)
                    ]),
                    labelText: lang.whoAreYouPageRealNameLabel,
                    successWidget: successIcon,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: padding, bottom: padding),
                  child: ValidatedFormField(
                    fieldWidth: size.width / screenFactor,
                    spacing: padding,
                    initialValue: whoAreYouModel.hostName,
                    onChanged: (value) => whoAreYouModel.hostName = value,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: lang
                              .whoAreYouPageComputerNameRequiredValidatorErrorText),
                      MinLengthValidator(2,
                          errorText: lang
                              .whoAreYouPageComputerNameMinLengthValidatorErrorText)
                    ]),
                    labelText: lang.whoAreYouPageComputerNameLabel,
                    successWidget: successIcon,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: size.width / screenFactor,
                    child: Text(
                      lang.whoAreYouPageComputerNameInfo,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: padding, bottom: padding),
                  child: ValidatedFormField(
                    fieldWidth: size.width / screenFactor,
                    spacing: padding,
                    initialValue: whoAreYouModel.username,
                    onChanged: (value) => whoAreYouModel.username = value,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: lang
                              .whoAreYouPageUsernameRequiredValidatorErrorText),
                      MinLengthValidator(2,
                          errorText: lang
                              .whoAreYouPageUsernameMinLengthValidatorErrorText),
                      PatternValidator(
                          r'^(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$',
                          errorText: lang
                              .whoAreYouPageUsernamePatternValidatorErrorText)
                    ]),
                    labelText: lang.whoAreYouPageUsernameLabel,
                    successWidget: successIcon,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: padding, bottom: padding),
                  child: ValidatedFormField(
                    fieldWidth: size.width / screenFactor,
                    spacing: padding,
                    initialValue: whoAreYouModel.password,
                    onChanged: (value) => whoAreYouModel.password = value,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: lang
                              .whoAreYouPagePasswordRequiredValidatorErrorText),
                      MinLengthValidator(2,
                          errorText: lang
                              .whoAreYouPagePasswordMinLengthValidatorErrorText),
                    ]),
                    labelText: lang.whoAreYouPagePasswordLabel,
                    obscureText: true,
                    successWidget: buildPasswordStrengthLabel(
                        whoAreYouModel.passwordStrength),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ValidatedFormField(
                    fieldWidth: size.width / screenFactor,
                    spacing: padding,
                    validator: _ConfirmPasswordValidator(
                        whoAreYouModel.password,
                        errorText: lang
                            .whoAreYouPageConfirmPasswordValidatorErrorText),
                    labelText: lang.whoAreYouPageConfirmPasswordLabel,
                    obscureText: true,
                    successWidget: successIcon,
                  ),
                ),
                Row(
                  children: [
                    Radio<LoginStrategy>(
                        value: LoginStrategy.autoLogin,
                        groupValue: whoAreYouModel.loginStrategy,
                        onChanged: (_) => whoAreYouModel.loginStrategy =
                            LoginStrategy.autoLogin),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.whoAreYouPageLoginStrategyAutoLogin),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<LoginStrategy>(
                        value: LoginStrategy.requirePassword,
                        groupValue: whoAreYouModel.loginStrategy,
                        onChanged: (_) => whoAreYouModel.loginStrategy =
                            LoginStrategy.requirePassword),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(lang.whoAreYouPageLoginStrategyRequirePassword),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Navigator.of(context).pop,
          ),
          WizardAction(
            label: lang.startInstallingButtonText,
            highlighted: true,
            onActivated: () async {
              if (_whoAreYouFormKey.currentState!.validate()) {
                await whoAreYouModel.saveIdentity();

                Navigator.pushNamed(context, Routes.chooseYourLook);
              }
            },
          ),
        ],
      );
    });
  }
}

class _ConfirmPasswordValidator extends FieldValidator<String?> {
  final String _password;

  _ConfirmPasswordValidator(this._password, {required String errorText})
      : super(errorText);

  @override
  bool isValid(String? value) {
    return value?.isNotEmpty == true && value == _password;
  }
}
