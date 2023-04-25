import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'l10n.dart';
import 'routes.dart';
import 'wizard.dart';

class UbuntuWslSetupApp extends StatelessWidget {
  const UbuntuWslSetupApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AppModel>();
    return InheritedLocale(
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: InheritedLocale.of(context),
          onGenerateTitle: (context) {
            final lang = AppLocalizations.of(context);
            final window = YaruWindow.of(context);
            window.setTitle(lang.windowTitle);
            return lang.appTitle;
          },
          theme: yaruLight,
          darkTheme: yaruDark,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          home: model.showSplashScreen == false
              ? buildWizard(context, model)
              : SplashScreen(
                  animationDuration: const Duration(seconds: 6),
                  builder: (context) => buildWizard(context, model),
                ),
        );
      }),
    );
  }

  Widget? buildWizard(BuildContext context, AppModel model) {
    if (model.variant == null &&
        model.initialRoute != Routes.installationSlides) {
      return model.showSplashScreen ? null : const SizedBox.shrink();
    }

    return UbuntuWslSetupWizard(
      initialRoute: model.initialRoute,
    );
  }
}
