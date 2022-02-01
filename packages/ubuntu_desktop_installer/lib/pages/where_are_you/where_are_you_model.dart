import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

import '../../services.dart';

final log = Logger('where_are_you');

class WhereAreYouModel extends SafeChangeNotifier {
  WhereAreYouModel(
      {required SubiquityClient client, required GeoService service})
      : _client = client,
        _service = service;

  final SubiquityClient _client;
  final GeoService _service;

  LatLng? _lastCoordinates;
  String? _lastLocation;
  String? _lastTimezone;
  GeoLocation? _selectedLocation;
  Iterable<GeoLocation> _locations = const <GeoLocation>[];
  Iterable<GeoLocation> _timezones = const <GeoLocation>[];

  var _initialized = false;
  bool get isInitialized => _initialized;

  Future<void> init() async {
    return _client.timezone().then((data) async {
      if (data.timezone.isNotEmpty) {
        final timezones = await _service.searchTimezone(data.timezone);
        _selectedLocation = timezones.firstOrNull;
      }
      _initialized = true;
      log.debug('Initialized $_selectedLocation');
      notifyListeners();
    });
  }

  Future<void> save() async {
    log.debug('Saved $_selectedLocation');
    _client.setTimezone(_selectedLocation?.timezone ?? 'geoip');
  }

  GeoLocation? get selectedLocation => _selectedLocation;

  void selectLocation(GeoLocation? location) {
    if (_selectedLocation == location) return;
    _selectedLocation = location;
    _lastLocation = null;
    log.debug('Selected location $location');
    notifyListeners();
  }

  void selectTimezone(GeoLocation? timezone) {
    if (_selectedLocation == timezone) return;
    _selectedLocation = timezone;
    _lastTimezone = null;
    log.debug('Selected timezone $timezone');
    notifyListeners();
  }

  Iterable<GeoLocation> get locations => _locations;
  Iterable<GeoLocation> get timezones => _timezones;

  Iterable<GeoLocation> _updateLocations(Iterable<GeoLocation> locations) {
    _locations = locations;
    notifyListeners();
    return _locations;
  }

  Iterable<GeoLocation> _updateTimezones(Iterable<GeoLocation> timezones) {
    _timezones = timezones;
    notifyListeners();
    return _timezones;
  }

  Future<Iterable<GeoLocation>> searchLocation(String location) async {
    if (location.isEmpty) return const <GeoLocation>[];
    if (_lastLocation == location) return _locations;
    _lastLocation = location;
    return _service.searchLocation(location).then(_updateLocations);
  }

  Future<Iterable<GeoLocation>> searchCoordinates(LatLng coordinates) async {
    if (_lastCoordinates == coordinates) return _locations;
    _lastCoordinates = coordinates;
    return _service.searchCoordinates(coordinates).then(_updateLocations);
  }

  Future<Iterable<GeoLocation>> searchTimezone(String timezone) async {
    if (_lastTimezone == timezone) return _timezones;
    _lastTimezone = timezone;
    return _service.searchTimezone(timezone).then(_updateTimezones);
  }
}
