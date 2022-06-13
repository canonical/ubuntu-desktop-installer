import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/where_are_you/where_are_you_model.dart';
import 'package:ubuntu_desktop_installer/pages/where_are_you/where_are_you_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';
import 'where_are_you_model_test.mocks.dart';
import 'where_are_you_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([WhereAreYouModel])
void main() {
  WhereAreYouModel buildModel({
    bool? isInitialized,
    GeoLocation? selectedLocation,
    Iterable<GeoLocation>? locations,
    Iterable<GeoLocation>? timezones,
  }) {
    final model = MockWhereAreYouModel();
    when(model.isInitialized).thenReturn(isInitialized ?? true);
    when(model.selectedLocation).thenReturn(selectedLocation);
    when(model.locations).thenReturn(locations ?? const <GeoLocation>[]);
    when(model.timezones).thenReturn(timezones ?? const <GeoLocation>[]);
    when(model.searchLocation(''))
        .thenAnswer((_) async => const <GeoLocation>[]);
    when(model.searchTimezone(''))
        .thenAnswer((_) async => const <GeoLocation>[]);
    return model;
  }

  Widget buildPage(WhereAreYouModel model) {
    return ChangeNotifierProvider<WhereAreYouModel>.value(
      value: model,
      child: WhereAreYouPage(),
    );
  }

  testWidgets('initializes the model', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    verify(model.init()).called(1);
  });

  testWidgets('saves the location', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    await tester.tap(continueButton);
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
    when(model.selectLocation(GeoLocation())).thenAnswer((_) {});

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
    verify(model.selectLocation(GeoLocation(name: 'b'))).called(1);
  });

  testWidgets('select timezone', (tester) async {
    const timezones = <GeoLocation>[
      GeoLocation(timezone: 'a'),
      GeoLocation(timezone: 'b'),
    ];

    final model = buildModel();
    when(model.searchTimezone('b')).thenAnswer((_) async => timezones);
    when(model.selectTimezone(GeoLocation())).thenAnswer((_) {});

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
    verify(model.selectTimezone(GeoLocation(timezone: 'b'))).called(1);
  });

  testWidgets('format location', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final page = find.byType(WhereAreYouPage);
    expect(page, findsOneWidget);

    final state = tester.state<WhereAreYouPageState>(page);

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

    final page = find.byType(WhereAreYouPage);
    expect(page, findsOneWidget);

    final state = tester.state<WhereAreYouPageState>(page);

    const timezone = GeoLocation(timezone: 'America/New_York');
    expect(
      state.formatTimezone(timezone),
      'America/New York',
    );
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.timezone())
        .thenAnswer((_) async => TimeZoneInfo(timezone: '', fromGeoip: false));
    registerMockService<SubiquityClient>(client);

    final service = MockGeoService();
    when(service.searchTimezone(any)).thenAnswer((_) async => []);
    registerMockService<GeoService>(service);

    await tester.pumpWidget(tester.buildApp(WhereAreYouPage.create));

    final page = find.byType(WhereAreYouPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<WhereAreYouModel>(context, listen: false);
    expect(model, isNotNull);
  });

  testWidgets('back button is disabled', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final backButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.backAction,
    );
    expect(backButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(backButton).enabled, isFalse);
  });
}
