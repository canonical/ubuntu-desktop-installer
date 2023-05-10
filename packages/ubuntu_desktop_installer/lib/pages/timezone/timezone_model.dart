import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final log = Logger('timezone');

final timezoneModelProvider = ChangeNotifierProvider(
  (_) => TimezoneModel(
    getService<TimezoneService>(),
    getService<GeoService>(),
  ),
);

class TimezoneModel extends TimezoneController {
  TimezoneModel(this._service, GeoService geo) : super(service: geo);

  final TimezoneService _service;

  Future<void> init() async {
    return _service.getTimezone().then((timezone) async {
      log.debug('Initialized $timezone');
      return searchTimezone(timezone).then((timezones) {
        selectTimezone(timezones.firstOrNull);
      });
    });
  }

  Future<void> save() async {
    final timezone = selectedLocation?.timezone ?? 'geoip';
    log.debug('Saved $timezone');
    _service.setTimezone(timezone);
  }
}
