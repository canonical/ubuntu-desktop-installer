import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

export 'package:ubuntu_test/ubuntu_test.dart' show UbuntuLangTester;
export 'test_utils.mocks.dart';

/// An extension on [WidgetTester] for building test apps.
///
/// The additional [lang] property returns the [AppLocalizations] instance
/// associated with the current [WizardPage], for easy access to the
/// application's translated strings.
///
/// Use like so when writing tests:
/// ```dart
/// import 'widget_tester_extensions.dart';
///
/// void main() {
///   Widget buildPage(WidgetTester tester) { [...] }
///
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(tester.buildApp((_) => buildPage(tester)));
///
///     expect(find.text(tester.lang.someTranslatableString), findsOneWidget);
///   });
/// }
/// ```
///
/// If the tested widget is not in a [WizardPage], you can use the static
/// [UbuntuTester.context] property to specify the appropriate context to use.
///
/// For example:
/// ```dart
/// void main() {
///   setUpAll(() => LangTester.context = MyWidget);
/// }
/// ```
extension UbuntuTester on WidgetTester {
  static Type context = WizardPage;

  AppLocalizations get lang {
    final widget = element(find.byType(context).first);
    return AppLocalizations.of(widget);
  }

  Widget buildApp(WidgetBuilder builder) {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);
    return InheritedLocale(
      child: Flavor(
        data: const FlavorData(name: 'Ubuntu'),
        child: MaterialApp(
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
        ),
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
  SoundService,
  StorageService,
  TelemetryService,
  TimezoneService,
  UdevDeviceInfo,
  UdevService,
  UrlLauncher,
])
class _Dummy {} // ignore: unused_element
