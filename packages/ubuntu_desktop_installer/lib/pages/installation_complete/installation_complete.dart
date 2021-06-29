import 'package:flutter/material.dart';

import '../../widgets.dart';
import '../wizard_page.dart';
import 'installation_complete_model.dart';

const _kHighlightBackground = Color(0xFF0e8420);
const _kHighlightForeground = Colors.white;

class InstallationCompletePage extends StatelessWidget {
  const InstallationCompletePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => InstallationCompletePage();

  @override
  Widget build(BuildContext context) {
    final TextStyle? boldStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.bold);
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.installationCompleteTitle),
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64, bottom: 32),
              child: Image.asset(
                'assets/version.png',
                width: 160,
                height: 160,
              ),
            ),
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: TextUtils.parseText(lang.readyToUse('Ubuntu 20.04'))
                      .map((t) => TextSpan(
                          text: t.text, style: t.isBold ? boldStyle : null))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                width: 207,
                child: OutlinedButton(
                  style: _buttonStyle(context, highlighted: true),
                  onPressed: () {
                    //TODO: restart pc
                  },
                  child: Text(
                    lang.restartInto('Ubuntu 20.04'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 207,
              child: OutlinedButton(
                onPressed: () {
                  //TODO: shutdown
                },
                child: Text(lang.shutdown),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle? _buttonStyle(BuildContext context, {bool? highlighted}) {
    if (highlighted != true) return null;
    return OutlinedButtonTheme.of(context).style!.copyWith(
          backgroundColor: MaterialStateColor.resolveWith(
            (_) => _kHighlightBackground,
          ),
          foregroundColor: MaterialStateColor.resolveWith(
            (_) => _kHighlightForeground,
          ),
        );
  }
}
