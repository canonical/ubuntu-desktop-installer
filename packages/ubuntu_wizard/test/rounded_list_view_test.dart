import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('has correct structure', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RoundedListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Container(),
        ),
      ),
    );

    // has rounded container
    expect(find.byType(RoundedContainer), findsOneWidget);

    // scrollbar inside rounded container
    expect(
      find.descendant(
        of: find.byType(RoundedContainer),
        matching: find.byType(Scrollbar),
      ),
      findsOneWidget,
    );

    // listview inside rounded container
    expect(
      find.descendant(
        of: find.byType(RoundedContainer),
        matching: find.byType(ListView),
      ),
      findsOneWidget,
    );
  }, variant: TargetPlatformVariant.only(TargetPlatform.linux)); // desktop-only

  testWidgets('properties are propagated', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RoundedListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Container(),
          borderColor: Colors.blue,
          borderRadius: 20,
          borderWidth: 4,
        ),
      ),
    );

    final container =
        tester.widget<RoundedContainer>(find.byType(RoundedContainer));
    expect(container.borderColor, equals(Colors.blue));
    expect(container.borderRadius, equals(20));
    expect(container.borderWidth, 4);
  });
}
