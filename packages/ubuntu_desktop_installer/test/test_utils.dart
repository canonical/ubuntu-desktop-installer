import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

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

  Future<void> tapPrevious() => tap(find.button(ulang.previousLabel));
  Future<void> tapNext() => tap(find.button(ulang.nextLabel));

  Widget buildApp(WidgetBuilder builder) {
    binding.window.devicePixelRatioTestValue = 1;
    binding.window.physicalSizeTestValue = const Size(960, 680);
    return Flavor(
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
    );
  }
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
}
