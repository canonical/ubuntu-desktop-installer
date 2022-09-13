import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:yaru/yaru.dart';

import 'l10n.dart';
import 'locale.dart';
import 'wizard.dart';
import 'routes.dart';

class UbuntuWslSetupApp extends StatelessWidget {
  const UbuntuWslSetupApp({
    super.key,
    this.variant,
    this.initialRoute,
    this.showSplashScreen = false,
  });

  final Variant? variant;
  final String? initialRoute;
  final bool showSplashScreen;

  @override
  Widget build(BuildContext context) {
    return InheritedLocale(
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: InheritedLocale.of(context),
          onGenerateTitle: (context) {
            final lang = AppLocalizations.of(context);
            setWindowTitle(lang.windowTitle);
            return lang.appTitle;
          },
          theme: yaruLight.withConsistentPageTransitions(),
          darkTheme: yaruDark.withConsistentPageTransitions(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          home: showSplashScreen == false
              ? buildWizard(context)
              : SplashScreen(
                  animationDuration: const Duration(seconds: 6),
                  builder: buildWizard,
                ),
        );
      }),
    );
  }

  Widget? buildWizard(BuildContext context) {
    if (variant == null && initialRoute != Routes.installationSlides) {
      return showSplashScreen ? null : const SizedBox.shrink();
    }

    return UbuntuWslSetupWizard(
      initialRoute: initialRoute ?? routeForVariant(variant!),
    );
  }

  String routeForVariant(Variant value) {
    switch (value) {
      case Variant.WSL_SETUP:
        return Routes.selectLanguage;
      case Variant.WSL_CONFIGURATION:
        return Routes.advancedReconfig;
      default:
        throw UnsupportedError('Unsupported WSL variant: $variant');
    }
  }
}

extension _ConsistentPageTransitions on ThemeData {
  ThemeData withConsistentPageTransitions() {
    // Yaru only supports Linux, thus running the Windows entry point applies
    // Flutter default page transitions. This ensures consistency between both
    // platforms by using the first builder (the only one Yaru offers, actually.
    // It happens to be [CupertinoPageTransitionsBuilder] now, but
    // could be something else in the future).
    final builder = pageTransitionsTheme.builders.entries.first.value;
    return copyWith(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.linux: builder,
          TargetPlatform.windows: builder,
        },
      ),
    );
  }
}
