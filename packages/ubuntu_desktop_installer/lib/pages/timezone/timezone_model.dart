import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final log = Logger('timezone');

class TimezoneModel extends SafeChangeNotifier {
  TimezoneModel(this._service);

  final TimezoneService _service;

  Future<String> init() async {
    return _service.getTimezone().then((timezone) async {
      log.debug('Initialized $timezone');
      return timezone;
    });
  }

  Future<void> save(String? timezone) async {
    log.debug('Saved $timezone');
    _service.setTimezone(timezone ?? 'geoip');
  }
}
