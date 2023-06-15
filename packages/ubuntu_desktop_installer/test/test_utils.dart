import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
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
  bool? canBeBootDevice,
  String? model,
  String? vendor,
}) {
  return Disk(
    id: id ?? '',
    label: label ?? '',
    path: path,
    type: type ?? '',
    size: size ?? 0,
    usageLabels: usageLabels ?? [],
    partitions: partitions ?? [],
    okForGuided: okForGuided ?? false,
    ptable: ptable,
    preserve: preserve ?? false,
    bootDevice: bootDevice ?? false,
    canBeBootDevice: canBeBootDevice ?? false,
    model: model,
    vendor: vendor,
  );
}

GuidedStorageResponseV2 testGuidedStorageResponse({
  ProbeStatus status = ProbeStatus.DONE,
  GuidedChoiceV2? configured,
  List<GuidedStorageTarget> targets = const [],
}) {
  return GuidedStorageResponseV2(
    status: status,
    configured: configured,
    targets: targets,
  );
}

StorageResponseV2 testStorageResponse({
  ProbeStatus status = ProbeStatus.DONE,
  List<Disk> disks = const [],
  bool needBoot = false,
  bool needRoot = false,
  int installMinimumSize = 0,
}) {
  return StorageResponseV2(
    status: status,
    disks: disks,
    needBoot: needBoot,
    needRoot: needRoot,
    installMinimumSize: installMinimumSize,
  );
}

extension UbuntuFinders on CommonFinders {
  Finder asset(String assetName) {
    return find.byWidgetPredicate((widget) {
      bool hasAssetImage(Widget widget) {
        return widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName.endsWith(assetName);
      }

      bool hasAssetPicture(Widget widget) {
        return widget is SvgPicture &&
            widget.bytesLoader is SvgAssetLoader &&
            (widget.bytesLoader as SvgAssetLoader)
                .assetName
                .endsWith(assetName);
      }

      return hasAssetImage(widget) || hasAssetPicture(widget);
    });
  }

  Finder html(String html) {
    return find.byWidgetPredicate((widget) {
      return widget is Html && widget.data == html;
    });
  }

  Finder pushButton(String label) {
    return ancestor(
      of: find.text(label),
      matching: find.bySubtype<PushButton>(),
    );
  }
}
