import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_test/yaru_test.dart';

extension TapTester on WidgetTester {
  /// Taps a "Cancel" button.
  Future<void> tapCancel() => tapButton(ulang.cancelLabel);

  /// Taps a "Close" button.
  Future<void> tapClose() => tapButton(ulang.closeLabel);

  /// Taps a "Done" button.
  Future<void> tapDone() => tapButton(ulang.doneLabel);

  /// Taps a "Next" button.
  Future<void> tapNext() => tapButton(ulang.nextLabel);

  /// Taps a "No" button.
  Future<void> tapNo() => tapButton(ulang.noLabel);

  /// Taps an "OK" button.
  Future<void> tapOk() => tapButton(ulang.okLabel);

  /// Taps a "Previous" button.
  Future<void> tapPrevious() => tapButton(ulang.previousLabel);

  /// Taps a "Yes" button.
  Future<void> tapYes() => tapButton(ulang.yesLabel);

  Future<void> tapLink(String label) async {
    expect(find.byWidgetPredicate((widget) {
      if (widget is RichText) {
        final link = widget.findLink(label);
        if (link != null) {
          (link.recognizer as TapGestureRecognizer).onTap!();
          return true;
        }
      }
      return false;
    }), findsOneWidget);
  }
}

extension _LinkFinder on RichText {
  TextSpan? findLink(String label) {
    TextSpan? span;
    text.visitChildren((visitor) {
      if (visitor is TextSpan &&
          visitor.text == label &&
          visitor.recognizer is TapGestureRecognizer) {
        span = visitor;
      }
      return span == null;
    });
    return span;
  }
}

/// An extension on [WidgetTester] that exposes [ulang] property.
///
/// The additional [ulang] property returns the [UbuntuLocalizations] instance
/// associated with the current page [context] that defaults to [WizardPage].
extension UbuntuLangTester on WidgetTester {
  static Type context = WizardPage;

  UbuntuLocalizations get ulang {
    final page = element(find.byType(context).first);
    return UbuntuLocalizations.of(page);
  }
}
