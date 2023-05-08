import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

class InstallerWizard extends StatelessWidget {
  const InstallerWizard({
    super.key,
    this.initialRoute,
    this.routes,
    this.controller,
    this.userData,
  });

  final String? initialRoute;
  final Map<String, WizardRoute>? routes;
  final WizardController? controller;
  final Object? userData;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: initialRoute,
      routes: routes,
      controller: controller,
      userData: userData,
      observers: [
        HeroController(),
        _InstallerObserver(getService<TelemetryService>())
      ],
    );
  }
}

class _InstallerObserver extends NavigatorObserver {
  _InstallerObserver(this._telemetry);

  final TelemetryService _telemetry;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      _telemetry.addStage(route.settings.name!.removePrefix('/'));
    }
  }
}
