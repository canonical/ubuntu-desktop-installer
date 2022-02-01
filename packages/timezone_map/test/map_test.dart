import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone_map/timezone_map.dart';

import 'test_utils.dart';

void main() {
  Widget buildMap(
    WidgetTester tester, {
    Size? size,
    double? offset,
    LatLng? coordinates,
    void Function(LatLng)? onPressed,
  }) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = size ?? mapSize;

    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: TimezoneMap(
            offset: offset,
            marker: coordinates,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  testWidgets('map', (tester) async {
    await tester.pumpWidget(buildMap(tester));
    expect(find.svg('map.svg'), findsOneWidget);
  });

  testWidgets('press', (tester) async {
    LatLng? pressed;

    await tester.pumpWidget(
      buildMap(tester, onPressed: (coords) => pressed = coords),
    );

    await tester.tap(find.byType(TimezoneMap));
    expect(pressed, isCloseToLatLng(centerLatLng));

    await tester.tapAt(londonOffset);
    expect(pressed, isCloseToLatLng(londonLatLng));

    await tester.tapAt(nullOffset);
    expect(pressed, isCloseToLatLng(nullLatLng));

    await tester.tapAt(topLeftOffset);
    expect(pressed, isCloseToLatLng(topLeftLatLng));

    await tester.tapAt(topRightOffset);
    expect(pressed, isCloseToLatLng(topRightLatLng));

    await tester.tapAt(bottomLeftOffset);
    expect(pressed, isCloseToLatLng(bottomLeftLatLng));

    await tester.tapAt(bottomRightOffset);
    expect(pressed, isCloseToLatLng(bottomRightLatLng));
  });

  testWidgets('marker', (tester) async {
    await tester.pumpWidget(buildMap(tester, coordinates: londonLatLng));
    expect(find.byIcon(Icons.place), findsOneWidget);

    // Rect.contains() excludes bottom and right edges
    final iconRect = tester.getRect(find.byIcon(Icons.place)).inflate(1);
    expect(iconRect.contains(londonOffset), isTrue);

    await tester.pumpWidget(buildMap(tester, coordinates: null));
    expect(find.byIcon(Icons.place), findsNothing);
  });

  testWidgets('offset', (tester) async {
    await tester.pumpWidget(buildMap(tester, offset: 1));
    expect(find.svg('tz_0.svg'), findsNothing);
    expect(find.svg('tz_1.svg'), findsOneWidget);
    expect(find.svg('tz_-1.svg'), findsNothing);

    await tester.pumpWidget(buildMap(tester, offset: null));
    expect(find.svg('tz_0.svg'), findsNothing);
    expect(find.svg('tz_1.svg'), findsNothing);
    expect(find.svg('tz_-1.svg'), findsNothing);

    await tester.pumpWidget(buildMap(tester, offset: -1));
    expect(find.svg('tz_0.svg'), findsNothing);
    expect(find.svg('tz_1.svg'), findsNothing);
    expect(find.svg('tz_-1.svg'), findsOneWidget);

    await tester.pumpWidget(buildMap(tester, offset: -3.5));
    expect(find.svg('tz_-3.5.svg'), findsOneWidget);

    await tester.pumpWidget(buildMap(tester, offset: 12.75));
    expect(find.svg('tz_12.75.svg'), findsOneWidget);

    await tester.pumpWidget(buildMap(tester, offset: 5.0000000000001));
    expect(find.svg('tz_5.svg'), findsOneWidget);

    await tester.pumpWidget(buildMap(tester, offset: 1.23));
    expect(tester.takeException(), isFlutterError);
  });

  testWidgets('map size', (tester) async {
    final customSize = mapSize * 1.25;

    LatLng? pressed;

    await tester.pumpWidget(
      buildMap(
        tester,
        onPressed: (coords) => pressed = coords,
        size: customSize,
      ),
    );

    await tester.tap(find.byType(TimezoneMap));
    expect(pressed, isCloseToLatLng(centerLatLng));

    await tester.tapAt(customSize.topLeft(const Offset(0, 0)));
    expect(pressed, isCloseToLatLng(topLeftLatLng));

    // The expected coordinates are specifically for a 960x480 map. Tolerate
    // small differences when tapping near the edges of a different size map.

    await tester.tapAt(customSize.topRight(const Offset(-1, 0)));
    expect(pressed, isCloseToLatLng(topRightLatLng, 10, LengthUnit.Kilometer));

    await tester.tapAt(customSize.bottomLeft(const Offset(0, -1)));
    expect(
        pressed, isCloseToLatLng(bottomLeftLatLng, 10, LengthUnit.Kilometer));

    await tester.tapAt(customSize.bottomRight(const Offset(-1, -1)));
    expect(
        pressed, isCloseToLatLng(bottomRightLatLng, 10, LengthUnit.Kilometer));
  });

  testWidgets('cache', (tester) async {
    const appPath = '/path/to/app';
    const assetPath = 'data/flutter_assets/packages/timezone_map/assets';

    final fs = MemoryFileSystem.test();
    fs.file('$appPath/exe').createSync(recursive: true);
    fs.link('/proc/self/exe').createSync('$appPath/exe', recursive: true);

    final assetBundle = MockAssetBundle();
    String assetKey(int i) => 'packages/timezone_map/assets/tz_$i.svg';

    for (var i = -1; i <= 1; ++i) {
      fs.file('$appPath/$assetPath/tz_$i.svg').createSync(recursive: true);
      when(assetBundle.loadString(assetKey(i)))
          .thenAnswer((_) async => '<svg with="1" height="1"/>');
    }

    await tester.pumpWidget(DefaultAssetBundle(
      bundle: assetBundle,
      child: MaterialApp(),
    ));
    final context = tester.element(find.byType(MaterialApp));

    await TimezoneMap.precacheAssets(context, fs: fs);

    for (var i = -1; i <= 1; ++i) {
      verify(assetBundle.loadString(assetKey(i))).called(1);
    }
  });
}

class MockAssetBundle extends Mock implements AssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) {
    return super.noSuchMethod(
      Invocation.method(#loadString, [key], {#cache: cache}),
      returnValue: Future.value(''),
    );
  }
}
