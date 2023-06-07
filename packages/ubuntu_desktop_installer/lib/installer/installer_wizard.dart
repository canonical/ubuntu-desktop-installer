import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'installer_model.dart';

enum InstallationStep {
  locale,
  keyboard,
  network,
  source,
  type,
  filesystem,
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
    model
      ..addListener(() => YaruWindow.setClosable(context, !model.isInstalling))
      ..init();
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
    return Wizard(
      initialRoute: Routes.initial,
      userData: InstallationStep.values.length,
      routes: <String, WizardRoute>{
        Routes.loading: WizardRoute(
          builder: (_) => const LoadingPage(),
        ),
        Routes.locale: WizardRoute(
          builder: (_) => const LocalePage(),
          userData: InstallationStep.locale.index,
          onLoad: (_) => LocalePage.load(context, ref),
        ),
        if (welcome == true)
          Routes.welcome: WizardRoute(
            builder: (_) => const WelcomePage(),
            userData: InstallationStep.locale.index,
            onLoad: (_) => WelcomePage.load(context, ref),
          ),
        Routes.rst: WizardRoute(
          builder: (_) => const RstPage(),
          onLoad: (_) => RstPage.load(ref),
        ),
        Routes.keyboard: WizardRoute(
          builder: (_) => const KeyboardPage(),
          userData: InstallationStep.keyboard.index,
          onLoad: (settings) => KeyboardPage.load(ref),
        ),
        Routes.network: WizardRoute(
          builder: (_) => const NetworkPage(),
          userData: InstallationStep.network.index,
          onLoad: (_) => NetworkPage.load(ref),
        ),
        Routes.source: WizardRoute(
          builder: (_) => const SourceWizard(),
          userData: InstallationStep.source.index,
          onLoad: (_) => SourcePage.load(ref),
        ),
        Routes.secureBoot: WizardRoute(
          builder: (_) => const SecureBootPage(),
          userData: InstallationStep.type.index,
          onLoad: (_) => SecureBootPage.load(ref),
        ),
        Routes.filesystem: WizardRoute(
          builder: (_) => const FilesystemPage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => FilesystemPage.load(ref),
        ),
        Routes.confirm: WizardRoute(
          builder: (_) => const ConfirmPage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => ConfirmPage.load(ref),
        ),
        Routes.timezone: WizardRoute(
          builder: (_) => const TimezonePage(),
          userData: InstallationStep.timezone.index,
          onLoad: (_) => TimezonePage.load(context, ref),
        ),
        Routes.identity: WizardRoute(
          builder: (_) => const IdentityPage(),
          userData: InstallationStep.identity.index,
          onLoad: (_) => IdentityPage.load(ref),
          onNext: (settings) => settings.arguments == true
              ? Routes.activeDirectory
              : Routes.theme,
        ),
        Routes.activeDirectory: WizardRoute(
          builder: (_) => const ActiveDirectoryPage(),
          userData: InstallationStep.identity.index,
          onLoad: (_) => ActiveDirectoryPage.load(ref),
        ),
        Routes.theme: WizardRoute(
          builder: (_) => const ThemePage(),
          userData: InstallationStep.theme.index,
        ),
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
  _InstallerObserver(this._telemetryService);

  final TelemetryService _telemetryService;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      _telemetryService.addStage(route.settings.name!.removePrefix('/'));
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
        ),
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
