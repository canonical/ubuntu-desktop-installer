import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'installing_state.dart';
import 'is_locale_set.dart';
import 'l10n.dart';
import 'routes.dart';
import 'wizard.dart';

Future<void> runWslSetupApp({
  required ValueNotifier<AppModel> appModel,
  required List<String>? serverArgs,
  required Map<String, String>? serverEnvironment,
}) async {
  final subiquityClient = getService<SubiquityClient>();
  final subiquityServer = getService<SubiquityServer>();
  final subiquityMonitor = getService<SubiquityStatusMonitor>();

  subiquityServer
      .start(args: serverArgs, environment: serverEnvironment)
      .then((endpoint) async {
    subiquityClient.open(endpoint);
    return subiquityMonitor.start(endpoint);
  });

  final log = Logger();

  return runZonedGuarded(() async {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    final window = await YaruWindow.ensureInitialized();
    await window.onClose(() async {
      await subiquityMonitor.stop();
      await subiquityClient.close();
      await subiquityServer.stop();
      return true;
    });

    await initDefaultLocale();

    runApp(ValueListenableProvider<AppModel>.value(
      value: appModel,
      child: const UbuntuWslSetupApp(),
    ));

    await subiquityClient.getVariant().then((value) {
      if (value == Variant.WSL_SETUP) {
        isLocaleSet(subiquityClient).then(
          (isSet) => appModel.value = appModel.value
              .copyWith(variant: value, languageAlreadySet: isSet),
        );
        final subiquityMonitor = getService<SubiquityStatusMonitor>();
        subiquityMonitor.onStatusChanged.listen((status) {
          window.setClosable(status?.state.isInstalling != true);
        });
      } else {
        appModel.value = appModel.value.copyWith(variant: value);
      }
    });
  }, (error, stack) => log.error('Unhandled exception', error, stack));
}

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
