import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension TapTester on WidgetTester {
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
