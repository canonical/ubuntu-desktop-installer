// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/where_are_you_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/services/geo_service.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [GeoService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGeoService extends _i1.Mock implements _i2.GeoService {
  MockGeoService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.GeoLocation?> init() =>
      (super.noSuchMethod(Invocation.method(#init, []),
              returnValue: Future<_i2.GeoLocation?>.value())
          as _i3.Future<_i2.GeoLocation?>);
  @override
  void addSource(_i2.GeoSource? source) =>
      super.noSuchMethod(Invocation.method(#addSource, [source]),
          returnValueForMissingStub: null);
  @override
  void removeSource(_i2.GeoSource? source) =>
      super.noSuchMethod(Invocation.method(#removeSource, [source]),
          returnValueForMissingStub: null);
  @override
  _i3.Future<Iterable<_i2.GeoLocation>> searchLocation(String? location) =>
      (super.noSuchMethod(Invocation.method(#searchLocation, [location]),
              returnValue:
                  Future<Iterable<_i2.GeoLocation>>.value(<_i2.GeoLocation>[]))
          as _i3.Future<Iterable<_i2.GeoLocation>>);
  @override
  _i3.Future<Iterable<_i2.GeoLocation>> searchTimezone(String? timezone) =>
      (super.noSuchMethod(Invocation.method(#searchTimezone, [timezone]),
              returnValue:
                  Future<Iterable<_i2.GeoLocation>>.value(<_i2.GeoLocation>[]))
          as _i3.Future<Iterable<_i2.GeoLocation>>);
  @override
  _i3.Future<void> cancelSearch() =>
      (super.noSuchMethod(Invocation.method(#cancelSearch, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}
