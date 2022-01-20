import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/src/utils/property_stream_notifier.dart';

void main() {
  test('listeners', () {
    final notifier = PropertyStreamNotifier();

    var wasCanceled = false;
    var wasListened = false;

    final controller = StreamController<List<String>>(
      sync: true,
      onListen: () => wasListened = true,
      onCancel: () => wasCanceled = true,
    );

    notifier.setProperties(controller.stream);
    expect(wasListened, isTrue);

    var foo = 0;
    var bar = 0;
    var baz = 0;
    notifier.addPropertyListener('foo', () => ++foo);
    notifier.addPropertyListener('bar', () => ++bar);
    notifier.addPropertyListener('baz', () => ++baz);

    controller.add(['qux']);
    expect(foo, isZero);
    expect(bar, isZero);
    expect(baz, isZero);

    controller.add(['bar']);
    expect(foo, isZero);
    expect(bar, equals(1));
    expect(baz, isZero);

    controller.add(['bar', 'foo']);
    expect(foo, equals(1));
    expect(bar, equals(2));
    expect(baz, isZero);

    notifier.dispose();
    expect(wasCanceled, isTrue);

    controller.close();
  });
}
