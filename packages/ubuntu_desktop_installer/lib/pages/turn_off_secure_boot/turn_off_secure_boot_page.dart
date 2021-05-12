import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_secure_boot/turn_off_secure_boot_model.dart';
import 'package:ubuntu_desktop_installer/widgets/localized_view.dart';

const _kButtonPadding = EdgeInsets.only(right: 20, bottom: 20);
const _kFormElementPadding = 8.0;

class TurnOffSecureBootPage extends StatefulWidget {
  @override
  _TurnOffSecureBootPageState createState() => _TurnOffSecureBootPageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff),
      child: TurnOffSecureBootPage(),
    );
  }
}

class _TurnOffSecureBootPageState extends State<TurnOffSecureBootPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<TurnOffSecureBootModel>();
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
          title: Text(lang.turnOffSecureBootTitle),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(lang.turnOffSecureBootDescription),
              ),
              RadioListTile<SecureBootMode>(
                title: Text(lang.turnOffSecureBootOption),
                value: SecureBootMode.turnoff,
                groupValue: model.secureBootMode,
                onChanged: model.setSecureBootMode,
              ),
              const SizedBox(height: _kFormElementPadding),
              _PasswordSizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: lang.chooseSecurityKey,
                  ),
                ),
              ),
              const SizedBox(height: _kFormElementPadding),
              _PasswordSizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: lang.confirmSecurityKey,
                  ),
                ),
              ),
              const SizedBox(height: _kFormElementPadding),
              RadioListTile<SecureBootMode>(
                title: Text(lang.dontInstallDriverSoftwareNow),
                subtitle: Text(lang.dontInstallDriverSoftwareNowDescription),
                value: SecureBootMode.dontinstall,
                groupValue: model.secureBootMode,
                onChanged: model.setSecureBootMode,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: _kButtonPadding,
          child: ButtonBar(
            children: <Widget>[
              OutlinedButton(
                child: Text(lang.backButtonText),
                onPressed: Navigator.of(context).pop,
              ),
              OutlinedButton(
                child: Text(lang.continueButtonText),
                onPressed: () {
                  // TODO: add next step here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordSizedBox extends StatelessWidget {
  final Widget child;

  const _PasswordSizedBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.65,
      child: Padding(
        padding: const EdgeInsets.only(left: 90),
        child: child,
      ),
    );
  }
}
