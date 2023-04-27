import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_model.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';
import 'timezone_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([GeoService, TimezoneController, TimezoneModel])
void main() {
  MockTimezoneController buildController({
    GeoLocation? selectedLocation,
    LatLng? selectedCoordinates,
    Iterable<GeoLocation>? locations,
    Iterable<GeoLocation>? timezones,
  }) {
    final controller = MockTimezoneController();
    when(controller.selectedLocation).thenReturn(selectedLocation);
    when(controller.locations).thenReturn(locations ?? const <GeoLocation>[]);
    when(controller.timezones).thenReturn(timezones ?? const <GeoLocation>[]);
    when(controller.searchLocation(''))
        .thenAnswer((_) async => const <GeoLocation>[]);
    when(controller.searchTimezone(''))
        .thenAnswer((_) async => const <GeoLocation>[]);
    return controller;
  }

  MockTimezoneModel buildModel({String? timezone}) {
    final model = MockTimezoneModel();
    when(model.init()).thenAnswer((_) async => timezone ?? '');
    return model;
  }

  Widget buildPage(
    TimezoneModel model,
    TimezoneController controller,
  ) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimezoneController>.value(value: controller),
        ChangeNotifierProvider<TimezoneModel>.value(value: model),
      ],
      child: const TimezonePage(),
    );
  }

  testWidgets('initializes the model', (tester) async {
    final model = buildModel();
    final controller = buildController();
    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));
    verify(model.init()).called(1);
  });

  testWidgets('saves the location', (tester) async {
    final model = buildModel();
    final controller = buildController();
    when(model.init()).thenAnswer((_) async => '');
    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.nextLabel,
    );
    await tester.tap(continueButton);
    verify(model.save(null)).called(1);
  });

  testWidgets('search location', (tester) async {
    final model = buildModel();
    final controller = buildController();
    when(controller.searchLocation('test'))
        .thenAnswer((_) async => const <GeoLocation>[]);

    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

    await tester.enterText(find.byType(EditableText).first, 'test');
    await tester.pump();
    verify(controller.searchLocation('test')).called(1);
  });

  testWidgets('search timezone', (tester) async {
    final model = buildModel();
    final controller = buildController();
    when(controller.searchTimezone('test'))
        .thenAnswer((_) async => const <GeoLocation>[]);

    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

    await tester.enterText(find.byType(EditableText).last, 'test');
    await tester.pump();
    verify(controller.searchTimezone('test')).called(1);
  });

  testWidgets('select location', (tester) async {
    const locations = <GeoLocation>[
      GeoLocation(name: 'a'),
      GeoLocation(name: 'b'),
    ];

    final model = buildModel();
    final controller = buildController();
    when(controller.searchLocation('b')).thenAnswer((_) async => locations);
    when(controller.selectLocation(GeoLocation())).thenAnswer((_) {});

    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

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
    verify(controller.selectLocation(GeoLocation(name: 'b'))).called(1);
  });

  testWidgets('select timezone', (tester) async {
    const timezones = <GeoLocation>[
      GeoLocation(timezone: 'a'),
      GeoLocation(timezone: 'b'),
    ];

    final model = buildModel();
    final controller = buildController();
    when(controller.searchTimezone('b')).thenAnswer((_) async => timezones);
    when(controller.selectTimezone(GeoLocation())).thenAnswer((_) {});

    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

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
    verify(controller.selectTimezone(GeoLocation(timezone: 'b'))).called(1);
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
    final controller = buildController();
    when(controller.searchCoordinates(any)).thenAnswer((_) async => locations);
    when(controller.searchTimezone(any)).thenAnswer((_) async => timezones);

    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

    expect(find.byType(TimezoneMap), findsOneWidget);
    await tester.tap(find.byType(TimezoneMap));

    const expected = GeoLocation(
      name: 'Timezone A',
      admin: '',
      country: '',
      timezone: 'Timezone/A',
    );

    verify(controller.searchCoordinates(any)).called(1);
    verify(controller.selectLocation(expected)).called(1);
  });

  testWidgets('format location', (tester) async {
    final model = buildModel();
    final controller = buildController();
    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

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
    final controller = buildController();
    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

    final page = find.byType(TimezonePage);
    expect(page, findsOneWidget);

    final state = tester.state<TimezonePageState>(page);

    const timezone = GeoLocation(timezone: 'America/New_York');
    expect(
      state.formatTimezone(timezone),
      'America/New York',
    );
  });

  testWidgets('creates a model and controller', (tester) async {
    final client = MockSubiquityClient();
    when(client.getTimezone())
        .thenAnswer((_) async => TimeZoneInfo(timezone: '', fromGeoip: false));
    registerMockService<SubiquityClient>(client);

    final service = MockGeoService();
    when(service.searchTimezone(any)).thenAnswer((_) async => []);
    registerMockService<GeoService>(service);

    await tester.pumpWidget(tester.buildApp(TimezonePage.create));

    final page = find.byType(TimezonePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<TimezoneModel>(context, listen: false);
    expect(model, isNotNull);
    final controller = Provider.of<TimezoneController>(context, listen: false);
    expect(controller, isNotNull);
  });

  testWidgets('back button is disabled', (tester) async {
    final model = buildModel();
    final controller = buildController();
    await tester
        .pumpWidget(tester.buildApp((_) => buildPage(model, controller)));

    final backButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.previousLabel,
    );
    expect(backButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(backButton).enabled, isFalse);
  });
}
