import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

enum InitStep {
  locale,
  keyboard,
  timezone,
  identity,
}

class InitRoutes {
  static const String initial = '/';
  static const String locale = '/locale';
  static const String keyboard = '/keyboard';
  static const String timezone = '/timezone';
  static const String identity = '/identity';
}

class InitWizard extends ConsumerStatefulWidget {
  const InitWizard({super.key});

  @override
  ConsumerState<InitWizard> createState() => _WelcomeWizardState();
}

class _WelcomeWizardState extends ConsumerState<InitWizard> {
  late final WizardController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WizardController(
      routes: {
        // TODO: loading screen?
        InitRoutes.initial: WizardRoute(
          builder: (_) => const SizedBox.shrink(),
        ),
        InitRoutes.locale: WizardRoute(
          builder: (_) => const LocalePage(),
          userData: WizardRouteData(
            step: InitStep.locale.index,
          ),
          onLoad: (_) => LocalePage.load(context, ref),
        ),
        InitRoutes.keyboard: WizardRoute(
          builder: (_) => const KeyboardPage(),
          userData: WizardRouteData(
            step: InitStep.keyboard.index,
          ),
          onLoad: (_) => KeyboardPage.load(ref),
        ),
        InitRoutes.timezone: WizardRoute(
          builder: (_) => const TimezonePage(),
          userData: WizardRouteData(
            step: InitStep.timezone.index,
          ),
          onLoad: (_) => TimezonePage.load(context, ref),
        ),
        InitRoutes.identity: WizardRoute(
          builder: (_) => const IdentityPage(),
          userData: WizardRouteData(
            step: InitStep.identity.index,
          ),
          onLoad: (_) => IdentityPage.load(ref),
          onNext: (_) =>
              YaruWindow.of(context).close().then((_) => InitRoutes.initial),
        ),
      },
    )..replace();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wizard(
      controller: _controller,
      userData: WizardData(totalSteps: InitStep.values.length),
    );
  }
}
