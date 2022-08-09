import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final log = Logger('where_are_you');

class WhereAreYouModel extends SafeChangeNotifier {
  WhereAreYouModel(this._client);

  final SubiquityClient _client;

  Future<String> init() async {
    return _client.timezone().then((data) async {
      log.debug('Initialized ${data.timezone}');
      return data.timezone;
    });
  }

  Future<void> save(String? timezone) async {
    log.debug('Saved $timezone');
    _client.setTimezone(timezone ?? 'geoip');
  }
}
