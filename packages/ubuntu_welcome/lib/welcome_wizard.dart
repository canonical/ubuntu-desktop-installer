import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

enum WelcomeStep {
  locale,
  keyboard,
  timezone,
  identity,
}

class WelcomeRoutes {
  static const String initial = '/';
  static const String locale = '/locale';
  static const String keyboard = '/keyboard';
  static const String timezone = '/timezone';
  static const String identity = '/identity';
}

class WelcomeWizard extends ConsumerStatefulWidget {
  const WelcomeWizard({super.key});

  @override
  ConsumerState<WelcomeWizard> createState() => _WelcomeWizardState();
}

class _WelcomeWizardState extends ConsumerState<WelcomeWizard> {
  late final WizardController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WizardController(
      routes: {
        // TODO: loading screen?
        WelcomeRoutes.initial: WizardRoute(
          builder: (_) => const SizedBox.shrink(),
        ),
        WelcomeRoutes.locale: WizardRoute(
          builder: (_) => const LocalePage(),
          userData: WizardRouteData(
            step: WelcomeStep.locale.index,
          ),
          onLoad: (_) => LocalePage.load(context, ref),
        ),
        WelcomeRoutes.keyboard: WizardRoute(
          builder: (_) => const KeyboardPage(),
          userData: WizardRouteData(
            step: WelcomeStep.keyboard.index,
          ),
          onLoad: (_) => KeyboardPage.load(ref),
        ),
        WelcomeRoutes.timezone: WizardRoute(
          builder: (_) => const TimezonePage(),
          userData: WizardRouteData(
            step: WelcomeStep.timezone.index,
          ),
          onLoad: (_) => TimezonePage.load(context, ref),
        ),
        WelcomeRoutes.identity: WizardRoute(
          builder: (_) => const IdentityPage(),
          userData: WizardRouteData(
            step: WelcomeStep.identity.index,
          ),
          onLoad: (_) => IdentityPage.load(ref),
          onNext: (_) =>
              YaruWindow.of(context).close().then((_) => WelcomeRoutes.initial),
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
      userData: WizardData(totalSteps: WelcomeStep.values.length),
    );
  }
}
