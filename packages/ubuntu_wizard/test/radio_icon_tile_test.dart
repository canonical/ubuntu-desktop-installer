import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/widgets.dart';

// ignore_for_file: type=lint

void main() {
  testWidgets('icon & radio geometries match ', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              RadioIconTile(
                icon: Icon(Icons.close),
                title: Text('title'),
                subtitle: Text('subtitle'),
              ),
              RadioButton<dynamic>(
                value: 1,
                groupValue: 1,
                onChanged: (_) {},
                title: Text('title'),
                subtitle: Text('subtitle'),
              ),
            ],
          ),
        ),
      ),
    );

    final iconRect = tester.getRect(find.byIcon(Icons.close));
    final radioRect = tester.getRect(find.byType(Radio<dynamic>));

    expect(iconRect.center.dx, equals(radioRect.center.dx));

    final titles = find.text('title');
    expect(titles, findsNWidgets(2));
    final title1Rect = tester.getRect(titles.first);
    final title2Rect = tester.getRect(titles.last);

    expect(title1Rect.size, equals(title2Rect.size));
    expect(title1Rect.left, equals(title2Rect.left));
    expect(title1Rect.right, equals(title2Rect.right));
    expect(title1Rect.top, isNot(equals(title2Rect.top)));
    expect(title1Rect.bottom, isNot(equals(title2Rect.bottom)));

    final subtitles = find.text('subtitle');
    expect(titles, findsNWidgets(2));
    final subtitle1Rect = tester.getRect(subtitles.first);
    final subtitle2Rect = tester.getRect(subtitles.last);

    expect(subtitle1Rect.size, equals(subtitle2Rect.size));
    expect(subtitle1Rect.left, equals(subtitle2Rect.left));
    expect(subtitle1Rect.right, equals(subtitle2Rect.right));
    expect(subtitle1Rect.top, isNot(equals(subtitle2Rect.top)));
    expect(subtitle1Rect.bottom, isNot(equals(subtitle2Rect.bottom)));
  });
}
