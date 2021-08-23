import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_detector.dart';

void main() {
  testWidgets('detects Swedish keyboard layout', (tester) async {
    final data = await rootBundle.loadString('assets/pc105.tree');
    final detector = KeyboardLayoutDetector.fromData(data);

    var step = detector.step(0);
    expect(step, isNotNull);
    expect(step.runtimeType, PressKeyStep);
    expect((step as PressKeyStep).keys,
        ['*', '¤', 'n', 'u', 'v', 'y', 'γ', 'ν', 'υ', 'г', 'у', 'ה']);
    step.press(55); // v

    step = detector.step(step.next()!);
    expect(step.runtimeType, PressKeyStep);
    expect((step as PressKeyStep).keys, ['w', 'ω']);
    step.press(25); // w

    step = detector.step(step.next()!);
    expect(step.runtimeType, PressKeyStep);
    expect((step as PressKeyStep).keys, ['z', 'ζ']);
    step.press(52); // z

    step = detector.step(step.next()!);
    expect(step.runtimeType, FindKeyStep);
    expect((step as FindKeyStep).key, 'ö');
    step.found();

    step = detector.step(step.next()!);
    expect(step.runtimeType, PressKeyStep);
    expect((step as PressKeyStep).keys, ['ö']);
    step.press(47); // ö

    step = detector.step(step.next()!);
    expect(step.runtimeType, FindKeyStep);
    expect((step as FindKeyStep).key, 'å');
    step.found();

    step = detector.step(step.next()!);
    expect(step.runtimeType, FindKeyStep);
    expect((step as FindKeyStep).key, 'ə');
    step.notFound();

    step = detector.step(step.next()!);
    expect(step.runtimeType, equals(KeymapResultStep));
    expect((step as KeymapResultStep).keymap, 'se');
    expect(step.next(), isNull);
  });
}
