import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('animates size and opacity ', (tester) async {
    final Key target = UniqueKey();

    await tester.pumpWidget(
      Column(
        children: <Widget>[
          AnimatedExpanded(
            expanded: true,
            child: SizedBox(key: target, width: 100.0, height: 100.0),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byKey(target)), const Size(100.0, 100.0));
    expect(
      tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity,
      equals(1.0),
    );

    await tester.pumpWidget(
      Column(
        children: <Widget>[
          AnimatedExpanded(
            expanded: false,
            child: SizedBox(key: target, width: 100.0, height: 100.0),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byKey(target)), Size.zero);
    expect(
      tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity,
      equals(0.0),
    );
  });
}
