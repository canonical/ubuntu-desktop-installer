import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/widgets.dart';

export 'package:ubuntu_test/utils.dart' show UbuntuLangTester;

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
    binding.window.devicePixelRatioTestValue = 1;
    binding.window.physicalSizeTestValue = const Size(960, 680);
    return Flavor(
      data: const FlavorData(name: 'Ubuntu'),
      child: MaterialApp(
        localizationsDelegates: localizationsDelegates,
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
    );
  }
}

Disk testDisk({
  String? id,
  String? label,
  String? path,
  String? type,
  int? size,
  List<String>? usageLabels,
  List<DiskObject>? partitions,
  bool? okForGuided,
  String? ptable,
  bool? preserve,
  bool? bootDevice,
  String? model,
  String? vendor,
}) {
  return Disk(
    id: id,
    label: label,
    path: path,
    type: type,
    size: size,
    usageLabels: usageLabels,
    partitions: partitions,
    okForGuided: okForGuided,
    ptable: ptable,
    preserve: preserve,
    bootDevice: bootDevice,
    model: model,
    vendor: vendor,
  );
}
