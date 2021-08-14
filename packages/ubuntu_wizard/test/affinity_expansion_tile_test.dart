import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ExpansionTile platform controlAffinity test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: AffinityExpansionTile(
          title: Text('Title'),
        ),
      ),
    ));

    final listTile = tester.widget<ListTile>(find.byType(ListTile));
    expect(listTile.leading.runtimeType, SizedBox);
    expect(listTile.trailing.runtimeType, RotationTransition);
  });

  testWidgets('ExpansionTile trailing controlAffinity test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: AffinityExpansionTile(
          title: Text('Title'),
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    ));

    final listTile = tester.widget<ListTile>(find.byType(ListTile));
    expect(listTile.leading.runtimeType, SizedBox);
    expect(listTile.trailing.runtimeType, RotationTransition);
  });

  testWidgets('ExpansionTile leading controlAffinity test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: AffinityExpansionTile(
          title: Text('Title'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    ));

    final listTile = tester.widget<ExpansionTile>(find.byType(ExpansionTile));
    expect(listTile.leading.runtimeType, RotationTransition);
    expect(listTile.trailing.runtimeType, SizedBox);
  });

  testWidgets('ExpansionTile override rotating icon test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: AffinityExpansionTile(
          title: Text('Title'),
          leading: Icon(Icons.info),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    ));

    final listTile = tester.widget<ListTile>(find.byType(ListTile));
    expect(listTile.leading.runtimeType, Icon);
    expect(listTile.trailing.runtimeType, SizedBox);
  });
}
