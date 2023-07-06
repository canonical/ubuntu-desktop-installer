import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';

export 'test_utils.mocks.dart';

extension InstallerTester on WidgetTester {
  Widget buildApp(WidgetBuilder builder) {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
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

@GenerateMocks([
  ActiveDirectoryService,
  ConfigService,
  DesktopService,
  GeoService,
  IdentityService,
  InstallerService,
  JournalService,
  KeyboardService,
  LocaleService,
  NetworkService,
  PowerService,
  ProductService,
  SessionService,
  SoundService,
  StorageService,
  TelemetryService,
  ThemeService,
  TimezoneService,
  UdevDeviceInfo,
  UdevService,
  UrlLauncher,
])
class _Dummy {} // ignore: unused_element
