import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'flavor.dart';
import 'wizard_theme.dart';

typedef GenerateWizardTitle = String Function(BuildContext, FlavorData);

class WizardApp extends StatelessWidget {
  WizardApp({
    super.key,
    required this.appName,
    FlavorData? flavor,
    this.onGenerateTitle,
    required this.localizationsDelegates,
    required this.supportedLocales,
    required this.home,
  }) : flavor = flavor ?? defaultFlavor;

  final String appName;
  final FlavorData flavor;
  final GenerateWizardTitle? onGenerateTitle;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final Widget home;

  static FlavorData get defaultFlavor {
    return const FlavorData(name: 'Ubuntu');
  }

  @override
  Widget build(BuildContext context) {
    return InheritedLocale(
      child: DefaultAssetBundle(
        bundle: ProxyAssetBundle(rootBundle, package: appName),
        child: Flavor(
          data: flavor,
          child: YaruTheme(
            builder: (context, yaru, child) {
              final theme = flavor.theme ?? yaru.theme;
              final darkTheme = flavor.darkTheme ?? yaru.darkTheme;
              return MaterialApp(
                locale: InheritedLocale.of(context),
                onGenerateTitle: (context) {
                  final title = onGenerateTitle?.call(context, flavor) ?? '';
                  YaruWindow.of(context).setTitle(title);
                  return title;
                },
                theme: theme?.customize(),
                darkTheme: darkTheme?.customize(),
                highContrastTheme: yaruHighContrastLight.customize(),
                highContrastDarkTheme: yaruHighContrastDark.customize(),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: <LocalizationsDelegate>[
                  ...localizationsDelegates,
                  ...?flavor.localizationsDelegates,
                ],
                supportedLocales: supportedLocales,
                home: _WizardBackground(child: home),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _WizardBackground extends StatelessWidget {
  const _WizardBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Scaffold(
            appBar: YaruWindowTitleBar(
              title: SizedBox.shrink(),
              style: YaruTitleBarStyle.undecorated,
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
