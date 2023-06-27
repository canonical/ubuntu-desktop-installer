import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'installer_model.dart';

enum InstallationStep {
  locale,
  keyboard,
  network,
  source,
  type,
  storage,
  timezone,
  identity,
  theme,
}

class InstallerWizard extends ConsumerStatefulWidget {
  const InstallerWizard({
    super.key,
    this.welcome,
  });

  final bool? welcome;

  @override
  ConsumerState<InstallerWizard> createState() => _InstallerWizardState();
}

class _InstallerWizardState extends ConsumerState<InstallerWizard> {
  @override
  void initState() {
    super.initState();

    final model = ref.read(installerModelProvider);
    model.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = ref.read(installerModelProvider);
    YaruWindow.setClosable(context, !model.isInstalling);
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(installerModelProvider.select((m) => m.status));
    if (status?.state == ApplicationState.ERROR) {
      return const _ErrorWizard();
    }
    return status?.interactive == false
        ? _AutoinstallWizard(status: status)
        : _InstallWizard(welcome: widget.welcome);
  }
}

class _InstallWizard extends ConsumerWidget {
  const _InstallWizard({this.welcome});

  final bool? welcome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preInstall = <String, WizardRoute>{
      Routes.locale: WizardRoute(
        builder: (_) => const LocalePage(),
        userData: WizardRouteData(step: InstallationStep.locale.index),
        onLoad: (_) => LocalePage.load(context, ref),
      ),
      if (welcome == true)
        Routes.welcome: WizardRoute(
          builder: (_) => const WelcomePage(),
          userData: WizardRouteData(step: InstallationStep.locale.index),
          onLoad: (_) => WelcomePage.load(context, ref),
        ),
      Routes.rst: WizardRoute(
        builder: (_) => const RstPage(),
        onLoad: (_) => RstPage.load(ref),
      ),
      Routes.keyboard: WizardRoute(
        builder: (_) => const KeyboardPage(),
        userData: WizardRouteData(step: InstallationStep.keyboard.index),
        onLoad: (settings) => KeyboardPage.load(ref),
      ),
      Routes.network: WizardRoute(
        builder: (_) => const NetworkPage(),
        userData: WizardRouteData(step: InstallationStep.network.index),
        onLoad: (_) => NetworkPage.load(ref),
      ),
      Routes.source: WizardRoute(
        builder: (_) => const SourceWizard(),
        userData: WizardRouteData(step: InstallationStep.source.index),
        onLoad: (_) => SourcePage.load(ref),
      ),
      Routes.secureBoot: WizardRoute(
        builder: (_) => const SecureBootPage(),
        userData: WizardRouteData(step: InstallationStep.type.index),
        onLoad: (_) => SecureBootPage.load(ref),
      ),
      Routes.storage: WizardRoute(
        builder: (_) => const StorageWizard(),
        userData: WizardRouteData(step: InstallationStep.storage.index),
        onLoad: (_) => StorageWizard.load(ref),
      ),
    };

    final postInstall = <String, WizardRoute>{
      Routes.timezone: WizardRoute(
        builder: (_) => const TimezonePage(),
        userData: WizardRouteData(
          step: InstallationStep.timezone.index,
          hasPrevious: false,
        ),
        onLoad: (_) => TimezonePage.load(context, ref),
      ),
      Routes.identity: WizardRoute(
        builder: (_) => const IdentityPage(),
        userData: WizardRouteData(step: InstallationStep.identity.index),
        onLoad: (_) => IdentityPage.load(ref),
      ),
      Routes.activeDirectory: WizardRoute(
        builder: (_) => const ActiveDirectoryPage(),
        userData: WizardRouteData(step: InstallationStep.identity.index),
        onLoad: (_) => ActiveDirectoryPage.load(ref),
      ),
      Routes.theme: WizardRoute(
        builder: (_) => const ThemePage(),
        userData: WizardRouteData(step: InstallationStep.theme.index),
      ),
    };

    MapEntry<String, WizardRoute> guardRoute(String name, WizardRoute route) {
      final model = ref.read(installerModelProvider);
      return MapEntry(
        name,
        WizardRoute(
          builder: route.builder,
          userData: route.userData,
          onLoad: (settings) async {
            return model.hasRoute(name) &&
                (await route.onLoad?.call(settings) ?? true);
          },
          onNext: route.onNext,
          onBack: route.onBack,
        ),
      );
    }

    return Wizard(
      initialRoute: Routes.initial,
      userData: WizardData(totalSteps: InstallationStep.values.length),
      routes: <String, WizardRoute>{
        Routes.loading: WizardRoute(
            builder: (_) => const LoadingPage(),
            userData: const WizardRouteData(
              hasPrevious: false,
              hasNext: false,
            )),
        ...preInstall.map(guardRoute),
        Routes.confirm: WizardRoute(
          builder: (_) => const ConfirmPage(),
          userData: WizardRouteData(step: InstallationStep.storage.index),
          onLoad: (_) => ConfirmPage.load(ref),
        ),
        ...postInstall.map(guardRoute),
        Routes.install: WizardRoute(
          builder: (_) => const InstallPage(),
          onLoad: (_) => InstallPage.load(context, ref),
        ),
      },
      observers: [_InstallerObserver(getService<TelemetryService>())],
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

class _AutoinstallWizard extends StatelessWidget {
  const _AutoinstallWizard({this.status});

  final ApplicationStatus? status;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      routes: <String, WizardRoute>{
        Routes.loading: WizardRoute(
            builder: (_) => const LoadingPage(),
            userData: const WizardRouteData(
              hasPrevious: false,
              hasNext: false,
            )),
        Routes.confirm: WizardRoute(
          builder: (_) => const ConfirmPage(),
          onLoad: (_) => status?.isInstalling != true,
        ),
        Routes.install: WizardRoute(
          builder: (_) => const InstallPage(),
        ),
      },
    );
  }
}

class _ErrorWizard extends StatelessWidget {
  const _ErrorWizard();

  @override
  Widget build(BuildContext context) {
    return Wizard(
      routes: <String, WizardRoute>{
        Routes.install: WizardRoute(
          builder: (_) => const InstallPage(),
        ),
      },
    );
  }
}
