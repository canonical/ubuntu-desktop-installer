import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final log = Logger('geo_service');

final _options = BaseOptions(
  connectTimeout: 1000,
  receiveTimeout: 1000,
  responseType: ResponseType.plain,
);

/// Presents a geographic location.
@immutable
class GeoLocation {
  const GeoLocation({
    this.name,
    this.admin,
    this.country,
    this.country2,
    this.latitude,
    this.longitude,
    this.timezone,
  });

  /// The name of the city.
  final String? name;

  /// The name of the administrative area.
  final String? admin;

  /// The name of the country.
  final String? country;

  /// The ISO-3166 country code.
  final String? country2;

  /// The latitude of the location.
  final double? latitude;

  /// The longitude of the location.
  final double? longitude;

  /// The timezone of the location.
  final String? timezone;

  /// Returns a copy with the specified non-null fields updated.
  GeoLocation copyWith({
    String? name,
    String? admin,
    String? country,
    String? country2,
    double? latitude,
    double? longitude,
    String? timezone,
  }) {
    return GeoLocation(
      name: name ?? this.name,
      admin: admin ?? this.admin,
      country: country ?? this.country,
      country2: country2 ?? this.country2,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
    );
  }

  @override
  String toString() =>
      'GeoLocation(name: $name, admin: $admin, country: $country, country2: $country2, latitude: $latitude, longitude: $longitude, timezone: $timezone)';

  /// Formats the location for display (e.g. "San Francisco (California, United States)")
  String toDisplayString() {
    final parts = [name, admin, country].where((s) => s?.isNotEmpty == true);
    if (parts.length <= 1) {
      return parts.singleOrNull ?? '';
    } else {
      return '${parts.first} (${parts.skip(1).join(', ')})';
    }
  }

  /// Formats the location's timezone for display (e.g. "America/Los Angeles")
  String toTimezoneString() => (timezone ?? '').replaceAll('_', ' ');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeoLocation &&
        // ignore case-insensitive duplicate alternate names such as "london"
        name?.toLowerCase() == other.name?.toLowerCase() &&
        admin == other.admin &&
        country == other.country &&
        country2 == other.country2 &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        timezone == other.timezone;
  }

  @override
  int get hashCode {
    return Object.hash(
      name?.toLowerCase(),
      admin,
      country,
      country2,
      latitude,
      longitude,
      timezone,
    );
  }
}

/// Provides Geoname lookups.
class GeoService {
  /// Constructs a service with the given list of Geoname [sources].
  GeoService({List<GeoSource>? sources})
      : _geosources = sources ?? <GeoSource>[];

  final List<GeoSource> _geosources;

  /// Adds a new [source], which is used for searching.
  void addSource(GeoSource source) => _geosources.add(source);

  /// Removes the specified [source].
  void removeSource(GeoSource source) => _geosources.remove(source);

  /// Looks up the sources and returns locations matching [location], if any.
  Future<Iterable<GeoLocation>> searchLocation(String location) async {
    final locations = await Future.wait([
      for (final geosource in _geosources) geosource.searchLocation(location),
    ]).then((value) => Set.of(value.expand((locations) => locations)));
    log.debug('Search "$location" matches ${locations.length} locations');
    return locations;
  }

  /// Looks up the sources and returns timezones matching [timezone], if any.
  Future<Iterable<GeoLocation>> searchTimezone(String timezone) async {
    final timezones = await Future.wait([
      for (final geosource in _geosources) geosource.searchTimezone(timezone),
    ]).then((value) => Set.of(value.expand((timezones) => timezones)));
    log.debug('Search "$timezone" matches ${timezones.length} timezones');
    return timezones;
  }

  /// Cancels ongoing lookups.
  Future<void> cancelSearch() {
    return Future.wait([
      for (final geosource in _geosources) geosource.cancelSearch(),
    ]);
  }
}

/// Geolocation lookup source.
abstract class GeoSource {
  /// Looks up the sources and returns locations matching the [location], if any.
  Future<Iterable<GeoLocation>> searchLocation(String location);

  /// Looks up the sources and returns timezones matching the [timezone], if any.
  Future<Iterable<GeoLocation>> searchTimezone(String timezone);

  /// Cancels an ongoing lookup.
  Future<void> cancelSearch();
}

/// Performs online lookups from a geoname service (geoname-lookup.ubuntu.com).
class Geoname implements GeoSource {
  Geoname({
    required this.url,
    required Geodata geodata,
    this.parameters,
    @visibleForTesting Dio? dio,
  })  : _dio = dio ?? Dio(_options),
        _geodata = geodata;

  /// The URL of the geoname service.
  String url;

  /// The parameters for the geoname service, e.g. {release: jammy, lang: en}.
  Map<String, String>? parameters;

  final Dio _dio;
  CancelToken? _token;
  final Geodata _geodata;

  @override
  Future<Iterable<GeoLocation>> searchLocation(String name) async {
    await cancelSearch();
    try {
      final response = await _sendRequest(name);
      return _handleResponse(response);
    } on DioError catch (e) {
      if (!CancelToken.isCancel(e) && e.error is! SocketException) {
        log.error('Geoname lookup error: ${e.message}');
      }
    }
    return const <GeoLocation>[];
  }

  @override
  Future<Iterable<GeoLocation>> searchTimezone(String name) async {
    return const <GeoLocation>[];
  }

  @override
  Future<void> cancelSearch() async => _token?.cancel();

  Future<Response> _sendRequest(String query) {
    return _dio.get(
      url,
      queryParameters: <String, String>{'query': query, ...?parameters},
      cancelToken: _token = CancelToken(),
    );
  }

  Future<Iterable<GeoLocation>> _handleResponse(Response response) async {
    if (response.statusCode != 200) log.error(response.statusMessage);
    try {
      final data = json.decode(response.data.toString());
      if (data is! Iterable) throw const FormatException();
      final locations = data.cast<Map<String, dynamic>>();
      return Future.wait(locations.map(_geodata.fromJson));
    } on FormatException {
      log.error('Invalid geoname data: ${response.data}');
    }
    return const <GeoLocation>[];
  }
}

/// Performs offline lookups from local geodata from geonames.org:
/// - `admin1CodesASCII.txt`
/// - `cities15000.txt`
/// - `countryInfo.txt`
/// - `timeZones.txt`
class Geodata implements GeoSource {
  /// Constructs a lazily loaded geodata.
  Geodata({
    required FutureOr<String> Function() loadCities,
    required FutureOr<String> Function() loadAdmins,
    required FutureOr<String> Function() loadCountries,
    required FutureOr<String> Function() loadTimezones,
  })  : _loadCities = loadCities,
        _loadAdmins = loadAdmins,
        _loadCountries = loadCountries,
        _loadTimezones = loadTimezones;

  final FutureOr<String> Function() _loadCities;
  final FutureOr<String> Function() _loadAdmins;
  final FutureOr<String> Function() _loadCountries;
  final FutureOr<String> Function() _loadTimezones;

  var _initialized = false;
  final _timezones = <GeoLocation>{};
  final _cities = <String, Set<GeoLocation>>{}; // {city[0]: [cities]}
  late final Map<String, String> _countries2; // {country: code}

  /// Constructs a [GeoLocation] from [json] data.
  Future<GeoLocation> fromJson(Map<String, dynamic> json) async {
    await _ensureInitialized();
    return GeoLocation(
      name: json.getStringOrNull('name'),
      admin: json.getStringOrNull('admin1'),
      country: json.getStringOrNull('country'),
      country2: json.getStringOrNull('country2', _countries2[json['country']]),
      latitude: json.getDoubleOrNull('latitude'),
      longitude: json.getDoubleOrNull('longitude'),
      timezone: json.getStringOrNull('timezone'),
    );
  }

  @override
  Future<Iterable<GeoLocation>> searchLocation(String location) async {
    await _ensureInitialized();
    final key = location.toSearch();
    if (key.isEmpty) return const <GeoLocation>[];
    return _cities.findWhere(key, (city) => key == city.name?.toSearch());
  }

  @override
  Future<Iterable<GeoLocation>> searchTimezone(String timezone) async {
    await _ensureInitialized();
    final key = timezone.toSearch();
    if (key.isEmpty) return _timezones;
    return _timezones.where((location) {
      return location.timezone?.toSearch().contains(key) == true;
    });
  }

  @override
  Future<void> cancelSearch() async {}

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    _initialized = true;
    // admin code (column 0) and its name (column 1) from admin1CodesASCII.txt
    final admins = _parseMap(await _loadAdmins(), key: 0, value: 1);
    // country code (column 0) and its name (column 4) from countryInfo.txt
    final countries = _parseMap(await _loadCountries(), key: 0, value: 4);

    var count = 0;
    for (final line in _parseTable(await _loadCities())) {
      if (line.length < 18) continue;

      final city = GeoLocation(
        admin: admins['${line[8]}.${line[10]}'],
        country: countries[line[8]],
        country2: line[8],
        latitude: double.tryParse(line[4]),
        longitude: double.tryParse(line[5]),
        timezone: line[17],
      );

      // include alternate city names
      final names = <String>{line[1], ...line[3].split(',')};
      for (final name in names) {
        _cities.insert(name.toSearch(), city.copyWith(name: name));
      }
      ++count;
    }
    log.info('Loaded $count offline locations');

    // swap {code: name} to {name: code} for geoip lookup that has no codes
    _countries2 = countries.inverse();

    final timezones = _parseMap(await _loadTimezones(), key: 1, value: 0);
    for (final entry in timezones.entries) {
      // skip invalid lines, such as the header
      if (entry.value.length != 2 || !entry.key.contains('/')) continue;

      _timezones.add(GeoLocation(
        country: countries[entry.value],
        country2: entry.value,
        timezone: entry.key,
      ));
    }
    log.info('Loaded ${_timezones.length} timezones');
  }
}

extension _JsonValue on Map<String, dynamic> {
  String? getStringOrNull(String key, [String? fallback]) {
    final value = this[key];
    return value is String ? value : fallback;
  }

  double? getDoubleOrNull(String key) {
    final value = this[key];
    return value is double
        ? value
        : value is String
            ? double.tryParse(value)
            : null;
  }
}

// parses and indexes two columns from tabular data
Map<String, String> _parseMap(
  String data, {
  required int key,
  required int value,
}) {
  final map = <String, String>{};
  for (final line in _parseTable(data)) {
    if (key >= line.length || value >= line.length) continue;
    map[line[key]] = line[value];
  }
  return map;
}

// parses tabular data (assets/*.txt)
Iterable<List<String>> _parseTable(String data) {
  return LineSplitter.split(data).map((line) => line
      .split('#') // ignore comments
      .first
      .split('\t') // tab-separated data
      .toList());
}

// trimmed lowercase string with commas and parentheses etc. removed, suitable
// for searching
extension _SearchString on String {
  // makes a string suitable for searching
  // - trim leading and trailing whitespace
  // - converts to lowercase for case-insensitive matching
  // - remove commas and parentheses etc.
  String toSearch() => trim().toLowerCase().replaceAll(RegExp('[\\W]+'), ' ');
}

extension _InverseMap on Map<String, String> {
  // invert {key: value} to {value: key}
  Map<String, String> inverse<T>() => Map.fromIterables(values, keys);
}

// 1-level "trie" for fast access to all items starting with a specific letter
extension _TrieSet<T> on Map<String, Set<T>> {
  List<T> findWhere(String key, bool Function(T) f) {
    final res = <T>[];
    final values = this[key[0]] ?? <T>[];
    for (final value in values) {
      if (f(value)) res.add(value);
    }
    return res;
  }

  void insert(String key, T value) {
    if (key.isNotEmpty) {
      final k = key[0];
      this[k] ??= <T>{};
      this[k]!.add(value);
    }
  }
}
