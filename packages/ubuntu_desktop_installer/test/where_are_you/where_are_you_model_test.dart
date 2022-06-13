import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/where_are_you/where_are_you_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'where_are_you_model_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([GeoService])
void main() {
  test('init', () async {
    final location = GeoLocation(name: 'Stockholm');

    final client = MockSubiquityClient();
    when(client.timezone()).thenAnswer(
        (_) async => TimeZoneInfo(timezone: location.name!, fromGeoip: false));
    final service = MockGeoService();
    when(service.searchTimezone(location.name))
        .thenAnswer((_) async => [location]);

    final model = WhereAreYouModel(client: client, service: service);
    expect(model.isInitialized, isFalse);

    await model.init();

    verify(client.timezone()).called(1);
    expect(model.isInitialized, isTrue);
    expect(model.selectedLocation, equals(location));
  });

  test('save', () async {
    final location = GeoLocation(timezone: 'Europe/Oslo');

    final client = MockSubiquityClient();
    when(client.setTimezone('geoip')).thenAnswer((_) async {});
    when(client.setTimezone(location.timezone)).thenAnswer((_) async {});
    final service = MockGeoService();

    final model = WhereAreYouModel(client: client, service: service);
    expect(model.selectedLocation, isNull);

    await model.save();
    verify(client.setTimezone('geoip')).called(1);

    model.selectLocation(location);
    expect(model.selectedLocation, equals(location));

    await model.save();
    verify(client.setTimezone(location.timezone)).called(1);
  });

  test('select location', () async {
    final location = GeoLocation(name: 'Helsinki, Finland');

    final client = MockSubiquityClient();
    final service = MockGeoService();

    final model = WhereAreYouModel(client: client, service: service);
    expect(model.selectedLocation, isNull);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);

    model.selectLocation(location);
    expect(model.selectedLocation, equals(location));
    expect(wasNotified, isTrue);
  });

  test('select timezone', () async {
    final location = GeoLocation(name: 'Helsinki, Finland');

    final client = MockSubiquityClient();
    final service = MockGeoService();

    final model = WhereAreYouModel(client: client, service: service);
    expect(model.selectedLocation, isNull);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);

    model.selectTimezone(location);
    expect(model.selectedLocation, equals(location));
    expect(wasNotified, isTrue);
  });

  test('search location', () async {
    final location = GeoLocation(name: 'Copenhagen', country: 'Denmark');

    final client = MockSubiquityClient();
    final service = MockGeoService();
    when(service.searchLocation('Copenhagen'))
        .thenAnswer((_) async => [location]);
    when(service.searchLocation('Denmark')).thenAnswer((_) async => [location]);

    final model = WhereAreYouModel(client: client, service: service);
    model.selectLocation(GeoLocation());
    expect(model.selectedLocation, isNotNull);
    expect(model.locations, isEmpty);

    final locations = await model.searchLocation(location.name!);
    expect(locations, equals([location]));
    verify(service.searchLocation(location.name!)).called(1);

    await model.searchLocation(location.name!);
    expect(model.locations, equals([location]));
    verifyNever(service.searchLocation(location.name!));

    await model.searchLocation(location.country!);
    verify(service.searchLocation(location.country!)).called(1);
  });

  test('search timezone', () async {
    final location = GeoLocation(
      name: 'Copenhagen',
      country: 'Denmark',
      country2: 'DK',
      timezone: 'Europe/Copenhagen',
    );

    final client = MockSubiquityClient();
    final service = MockGeoService();
    when(service.searchTimezone(location.timezone!))
        .thenAnswer((_) async => [location]);

    final model = WhereAreYouModel(client: client, service: service);
    model.selectTimezone(GeoLocation());
    expect(model.selectedLocation, isNotNull);
    expect(model.locations, isEmpty);

    final timezones = await model.searchTimezone(location.timezone!);
    expect(timezones, equals([location]));
    verify(service.searchTimezone(location.timezone!)).called(1);

    await model.searchTimezone(location.timezone!);
    expect(model.timezones, equals([location]));
    verifyNever(service.searchTimezone(location.timezone!));
  });
}
