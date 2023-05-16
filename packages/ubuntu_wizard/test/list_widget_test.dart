import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_test/yaru_test.dart';

void main() {
  testWidgets('center-align initial index', (tester) async {
    final selectedIndex = ValueNotifier<int>(50);

    await tester.pumpListWidget(selectedIndex);

    final listWidget = find.byType(ListWidget);
    expect(listWidget, findsOneWidget);

    final listTile = find.listTile('50');
    expect(listTile, findsOneWidget);
    expect(tester.getCenter(listTile), tester.getCenter(listWidget));
  });

  testWidgets('top-align first visible', (tester) async {
    final selectedIndex = ValueNotifier<int>(50);

    await tester.pumpListWidget(selectedIndex);

    final listWidget = find.byType(ListWidget);
    expect(listWidget, findsOneWidget);

    var i = selectedIndex.value - 1;
    while (tester.getRect(find.listTile('$i')).top >=
        tester.getRect(find.byType(ListWidget)).top) {
      --i;
    }
    expect(i, lessThan(selectedIndex.value));

    final listTile = find.listTile('$i');
    expect(tester.getRect(listTile).top,
        lessThan(tester.getRect(find.byType(ListWidget)).top));

    selectedIndex.value = i;
    await tester.pumpAndSettle();

    expect(tester.getRect(listTile).top,
        equals(tester.getRect(find.byType(ListWidget)).top));
  });

  testWidgets('bottom-align last visible', (tester) async {
    final selectedIndex = ValueNotifier<int>(50);

    await tester.pumpListWidget(selectedIndex);

    final listWidget = find.byType(ListWidget);
    expect(listWidget, findsOneWidget);

    var i = selectedIndex.value + 1;
    while (tester.getRect(find.listTile('$i')).bottom <=
        tester.getRect(find.byType(ListWidget)).bottom) {
      ++i;
    }
    expect(i, greaterThan(selectedIndex.value));

    final listTile = find.listTile('$i');
    expect(tester.getRect(listTile).bottom,
        greaterThan(tester.getRect(find.byType(ListWidget)).bottom));

    selectedIndex.value = i;
    await tester.pumpAndSettle();

    expect(tester.getRect(listTile).bottom,
        equals(tester.getRect(find.byType(ListWidget)).bottom));
  });

  testWidgets('center-align non-visible', (tester) async {
    final selectedIndex = ValueNotifier<int>(0);

    await tester.pumpListWidget(selectedIndex);

    final listWidget = find.byType(ListWidget);
    expect(listWidget, findsOneWidget);

    final listTile = find.listTile('50');
    expect(listTile, findsNothing);

    selectedIndex.value = 50;
    await tester.pumpAndSettle();

    expect(listTile, findsOneWidget);
    expect(tester.getCenter(listTile), tester.getCenter(listWidget));
  });
}

extension on WidgetTester {
  Future<void> pumpListWidget(ValueNotifier<int> selectedIndex) {
    return pumpWidget(MaterialApp(
      theme: ThemeData(listTileTheme: const ListTileThemeData(dense: true)),
      home: Scaffold(
        body: ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, child) {
            return ListWidget.builder(
              selectedIndex: value,
              itemCount: 100,
              itemBuilder: (context, index) => ListTile(
                title: Text('$index'),
              ),
            );
          },
        ),
      ),
    ));
  }
}
