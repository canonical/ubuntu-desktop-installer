import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GeoLocation &&
        other.name == name &&
        other.admin == admin &&
        other.country == country &&
        other.country2 == country2 &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.timezone == timezone;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      admin,
      country,
      country2,
      latitude,
      longitude,
      timezone,
    );
  }
}

/// Provides Geoname and GeoIP lookups.
class GeoService {
  /// Constructs a service with the given [geoip] lookup. Optionally, a list
  /// of [sources] can be provided.
  GeoService(GeoIP geoip, {List<GeoSource>? sources})
      : _geoip = geoip,
        _geosources = sources ?? <GeoSource>[];

  final GeoIP _geoip;
  final List<GeoSource> _geosources;

  /// Initializes the service and returns the current location.
  Future<GeoLocation?> init() => _geoip.lookup();

  /// Adds a new [source], which is used for searching.
  void addSource(GeoSource source) => _geosources.add(source);

  /// Removes the specified [source].
  void removeSource(GeoSource source) => _geosources.remove(source);

  /// Looks up the sources and returns locations matching the [name], if any.
  Future<Iterable<GeoLocation>> search(String name) async {
    final locations = await Future.wait([
      for (final geosource in _geosources) geosource.search(name),
    ]).then((value) => Set.of(value.expand((e) => e)));
    log.debug('$name: ${locations.length} locations');
    return locations;
  }

  /// Cancels ongoing lookups.
  Future<void> cancel() {
    return Future.wait([
      for (final geosource in _geosources) geosource.cancel(),
    ]);
  }
}

/// Geolocation lookup source.
abstract class GeoSource {
  /// Looks up the sources and returns locations matching the [name], if any.
  Future<Iterable<GeoLocation>> search(String name);

  /// Cancels an ongoing lookup.
  Future<void> cancel();
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
  Future<Iterable<GeoLocation>> search(String name) async {
    await cancel();
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
  Future<void> cancel() async => _token?.cancel();

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
      if (data is! Iterable) throw FormatException();
      final locations = data.cast<Map<String, dynamic>>();
      return Future.wait(locations.map(_geodata.fromJson));
    } on FormatException {
      log.error('Invalid geoname data: ${response.data}');
    }
    return const <GeoLocation>[];
  }
}

/// Performs offline lookups from local geodata from geonames.org:
/// - `cities15000.txt`
/// - `admin1CodesASCII.txt`
/// - `countryInfo.txt`
class Geodata implements GeoSource {
  /// Constructs a lazily loaded geodata.
  Geodata({
    required FutureOr<String> Function() loadCities,
    required FutureOr<String> Function() loadAdmins,
    required FutureOr<String> Function() loadCountries,
  })  : _loadCities = loadCities,
        _loadAdmins = loadAdmins,
        _loadCountries = loadCountries;

  final FutureOr<String> Function() _loadCities;
  final FutureOr<String> Function() _loadAdmins;
  final FutureOr<String> Function() _loadCountries;

  var _initialized = false;
  final _cities = <String, List<GeoLocation>>{};
  final _admins = <String, List<GeoLocation>>{};
  final _countries = <String, List<GeoLocation>>{};
  late final Map<String, String> _countries2;

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

  /// Constructs a [GeoLocation] from [xml] data.
  Future<GeoLocation?> fromXml(String xml) async {
    await _ensureInitialized();
    try {
      final element = XmlDocument.parse(xml).rootElement;
      if (element.getTextOrNull('Status') != 'OK') return null;
      return GeoLocation(
        name: element.getTextOrNull('City'),
        admin: element.getTextOrNull('RegionName'),
        country: element.getTextOrNull('CountryName'),
        country2: element.getTextOrNull('CountryCode'),
        latitude: element.getDoubleOrNull('Latitude'),
        longitude: element.getDoubleOrNull('Longitude'),
        timezone: element.getTextOrNull('TimeZone'),
      );
    } on XmlException {
      log.error('Invalid GeoIP data: $xml');
    }
  }

  @override
  Future<Iterable<GeoLocation>> search(String name) async {
    if (name.isEmpty) return const <GeoLocation>[];
    await _ensureInitialized();
    final locations = <GeoLocation>{
      ..._cities.find(name, _cityWhere),
      ..._admins.find(name, _adminWhere),
      ..._countries.find(name, _countryWhere),
    };
    return locations;
  }

  @override
  Future<void> cancel() async {}

  static bool _cityWhere(String name, GeoLocation city) {
    return city.name?.toLowerCase().startsWith(name) == true;
  }

  static bool _adminWhere(String name, GeoLocation city) {
    return _cityWhere(name, city) ||
        city.admin?.toLowerCase().startsWith(name) == true;
  }

  static bool _countryWhere(String name, GeoLocation city) {
    return _cityWhere(name, city) ||
        _adminWhere(name, city) ||
        city.country?.toLowerCase().startsWith(name) == true;
  }

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    _initialized = true;
    var count = 0;
    final adminCodes = _parse(await _loadAdmins(), code: 0, name: 1);
    final countryCodes = _parse(await _loadCountries(), code: 0, name: 4);
    for (final line in _tokenize(await _loadCities())) {
      final baseCity = GeoLocation(
        name: line[1],
        admin: adminCodes['${line[8]}.${line[10]}'],
        country: countryCodes[line[8]],
        country2: line[8],
        latitude: double.tryParse(line[4]),
        longitude: double.tryParse(line[5]),
        timezone: line[17],
      );
      final alternateNames = line[3].split(',');
      for (final name in [baseCity.name!, ...alternateNames]) {
        final city = baseCity.copyWith(name: name);
        _cities.insert(city.name, city);
        _admins.insert(city.admin, city);
        _countries.insert(city.country, city);
      }
      ++count;
    }
    log.info('Initialized local data: $count locations');
    _countries2 = countryCodes.reverse();
  }
}

/// Performs lookups from a geo IP online service (geoip.ubuntu.com/lookup).
class GeoIP {
  GeoIP({
    required this.url,
    required Geodata geodata,
    @visibleForTesting Dio? dio,
  })  : _dio = dio ?? Dio(_options),
        _geodata = geodata;

  /// GeoIP lookup URL.
  final String url;

  final Dio _dio;
  CancelToken? _token;
  final Geodata _geodata;

  /// Looks up the current geographic location.
  Future<GeoLocation?> lookup() async {
    await cancel();
    try {
      final response = await _sendRequest();
      return _handleResponse(response);
    } on DioError catch (e) {
      if (!CancelToken.isCancel(e)) {
        log.error('GeoIP lookup error: ${e.message}');
      }
    }
  }

  /// Cancels an ongoing lookup.
  Future<void> cancel() async => _token?.cancel();

  Future<Response> _sendRequest() {
    log.info('GeoIP lookup request: $url');
    return _dio.get(url, cancelToken: _token = CancelToken());
  }

  Future<GeoLocation?> _handleResponse(Response response) async {
    if (response.statusCode != 200) log.error(response.statusMessage);
    final location = await _geodata.fromXml(response.data.toString());
    log.info('GeoIP lookup response: $location');
    return location;
  }
}

extension _JsonMap on Map<String, dynamic> {
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

extension _MapList<T> on Map<String, List<T>> {
  List<T> find(String key, bool Function(String, T) f) {
    final res = <T>[];
    final keys = key
        .toLowerCase()
        .split(RegExp(r'[ ,\(\)]'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);
    final values = keys.expand<T>((word) => this[word[0]] ?? []);
    for (final value in values) {
      if (keys.every((key) => f(key, value))) res.add(value);
    }
    return res;
  }

  void insert(String? key, T value) {
    if (key?.isNotEmpty == true) {
      final k = key![0].toLowerCase();
      this[k] ??= <T>[];
      this[k]!.add(value);
    }
  }
}

extension _StringMap on Map<String, String> {
  Map<String, String> reverse<T>() => Map.fromIterables(values, keys);
}

extension _GetXmlText on XmlElement? {
  String? getTextOrNull(String name) => this?.getElement(name)?.text;
  double? getDoubleOrNull(String name) =>
      double.tryParse(getTextOrNull(name) ?? '');
}

Map<String, String> _parse(
  String data, {
  required int code,
  required int name,
}) {
  final codes = <String, String>{};
  for (final line in _tokenize(data)) {
    if (line.length < code || line.length < name) continue;
    codes[line[code]] = line[name];
  }
  return codes;
}

Iterable<List<String>> _tokenize(String data) {
  return LineSplitter.split(data).map((line) => line
      .split('#') // ignore comments
      .first
      .split('\t') // tab-separated data
      .toList());
}
