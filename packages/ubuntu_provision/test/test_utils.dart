import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_provision/l10n.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';

extension UbuntuProvisionTester on WidgetTester {
  static Type context = WizardPage;

  UbuntuProvisionLocalizations get lang {
    final widget = element(find.byType(context).first);
    return UbuntuProvisionLocalizations.of(widget);
  }

  UbuntuLocalizations get ulang {
    final widget = element(find.byType(context).first);
    return UbuntuLocalizations.of(widget);
  }

  Widget buildApp(WidgetBuilder builder) {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);
    return MaterialApp(
      localizationsDelegates: const [
        UbuntuProvisionLocalizations.delegate,
        ...GlobalUbuntuLocalizations.delegates,
      ],
      theme: yaruLight,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: builder,
            onNext: (settings) => '/next',
          ),
          '/next': WizardRoute(
            builder: (_) => const Text('Next page'),
          ),
        },
      ),
    );
  }
}
