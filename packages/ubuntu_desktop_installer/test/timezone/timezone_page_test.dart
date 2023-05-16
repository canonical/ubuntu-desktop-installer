import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_model.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'timezone_page_test.mocks.dart';

@GenerateMocks([TimezoneModel])
void main() {
  MockTimezoneModel buildModel({
    String? timezone,
    GeoLocation? selectedLocation,
    LatLng? selectedCoordinates,
    Iterable<GeoLocation>? locations,
    Iterable<GeoLocation>? timezones,
  }) {
    final model = MockTimezoneModel();
    when(model.init()).thenAnswer((_) async => timezone ?? '');
    when(model.selectedLocation).thenReturn(selectedLocation);
    when(model.locations).thenReturn(locations ?? const <GeoLocation>[]);
    when(model.timezones).thenReturn(timezones ?? const <GeoLocation>[]);
    when(model.searchLocation(''))
        .thenAnswer((_) async => const <GeoLocation>[]);
    when(model.searchTimezone(''))
        .thenAnswer((_) async => const <GeoLocation>[]);
    return model;
  }

  Widget buildPage(TimezoneModel model) {
    return ProviderScope(
      overrides: [
        timezoneModelProvider.overrideWith((_) => model),
      ],
      child: const TimezonePage(),
    );
  }

  testWidgets('initializes the model', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    verify(model.init()).called(1);
  });

  testWidgets('saves the location', (tester) async {
    final model = buildModel();
    when(model.init()).thenAnswer((_) async => '');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tapNext();
    verify(model.save()).called(1);
  });

  testWidgets('search location', (tester) async {
    final model = buildModel();
    when(model.searchLocation('test'))
        .thenAnswer((_) async => const <GeoLocation>[]);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.enterText(find.byType(EditableText).first, 'test');
    await tester.pump();
    verify(model.searchLocation('test')).called(1);
  });

  testWidgets('search timezone', (tester) async {
    final model = buildModel();
    when(model.searchTimezone('test'))
        .thenAnswer((_) async => const <GeoLocation>[]);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.enterText(find.byType(EditableText).last, 'test');
    await tester.pump();
    verify(model.searchTimezone('test')).called(1);
  });

  testWidgets('select location', (tester) async {
    const locations = <GeoLocation>[
      GeoLocation(name: 'a'),
      GeoLocation(name: 'b'),
    ];

    final model = buildModel();
    when(model.searchLocation('b')).thenAnswer((_) async => locations);
    when(model.selectLocation(const GeoLocation())).thenAnswer((_) {});

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(ListView), findsNothing);
    expect(find.text('b'), findsNothing);

    await tester.enterText(find.byType(EditableText).first, 'b');
    await tester.pumpAndSettle();

    final item = find.descendant(
      of: find.byType(ListView),
      matching: find.text('b'),
    );
    expect(item, findsOneWidget);

    await tester.ensureVisible(item);
    await tester.tapAt(tester.getTopLeft(item));
    await tester.pump();
    verify(model.selectLocation(const GeoLocation(name: 'b'))).called(1);
  });

  testWidgets('select timezone', (tester) async {
    const timezones = <GeoLocation>[
      GeoLocation(timezone: 'a'),
      GeoLocation(timezone: 'b'),
    ];

    final model = buildModel();
    when(model.searchTimezone('b')).thenAnswer((_) async => timezones);
    when(model.selectTimezone(const GeoLocation())).thenAnswer((_) {});

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(ListView), findsNothing);
    expect(find.text('b'), findsNothing);

    await tester.enterText(find.byType(EditableText).last, 'b');
    await tester.pumpAndSettle();

    final item = find.descendant(
      of: find.byType(ListView),
      matching: find.text('b'),
    );
    expect(item, findsOneWidget);

    await tester.ensureVisible(item);
    await tester.tapAt(tester.getTopLeft(item));
    await tester.pump();
    verify(model.selectTimezone(const GeoLocation(timezone: 'b'))).called(1);
  });

  testWidgets('select coordinates', (tester) async {
    const locations = <GeoLocation>[
      GeoLocation(
        name: 'Location A',
        admin: 'Admin A',
        country: 'Country A',
        timezone: 'Timezone/A',
      ),
      GeoLocation(
        name: 'Location B',
        admin: 'Admin B',
        country: 'Country B',
        timezone: 'Timezone/B',
      ),
    ];

    const timezones = <GeoLocation>[
      GeoLocation(
        name: 'Timezone A',
        admin: 'Admin A',
        country: 'Country A',
        timezone: 'Timezone/A',
      ),
      GeoLocation(
        name: 'Timezone B',
        admin: 'Admin B',
        country: 'Country B',
        timezone: 'Timezone/B',
      ),
    ];

    final model = buildModel();
    when(model.searchCoordinates(any)).thenAnswer((_) async => locations);
    when(model.searchTimezone(any)).thenAnswer((_) async => timezones);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(TimezoneMap), findsOneWidget);
    await tester.tap(find.byType(TimezoneMap));

    const expected = GeoLocation(
      name: 'Timezone A',
      admin: '',
      country: '',
      timezone: 'Timezone/A',
    );

    verify(model.searchCoordinates(any)).called(1);
    verify(model.selectLocation(expected)).called(1);
  });

  testWidgets('format location', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final page = find.byType(TimezonePage);
    expect(page, findsOneWidget);

    final state = tester.state<TimezonePageState>(page);

    const city = GeoLocation(name: 'city');
    expect(state.formatLocation(city), contains(city.name));

    final cityAdmin = city.copyWith(admin: 'admin');
    expect(state.formatLocation(cityAdmin), contains(cityAdmin.name));
    expect(state.formatLocation(cityAdmin), contains(cityAdmin.admin));

    final cityCountry = city.copyWith(country: 'country');
    expect(state.formatLocation(cityCountry), contains(cityCountry.name));
    expect(state.formatLocation(cityCountry), contains(cityCountry.country));

    final cityAll = city.copyWith(admin: 'admin', country: 'country');
    expect(state.formatLocation(cityAll), contains(cityAll.name));
    expect(state.formatLocation(cityAll), contains(cityAll.name));
    expect(state.formatLocation(cityAll), contains(cityAll.country));
  });

  testWidgets('format timezone', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final page = find.byType(TimezonePage);
    expect(page, findsOneWidget);

    final state = tester.state<TimezonePageState>(page);

    const timezone = GeoLocation(timezone: 'America/New_York');
    expect(
      state.formatTimezone(timezone),
      'America/New York',
    );
  });

  testWidgets('previous button is disabled', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.previousLabel), isDisabled);
  });
}
