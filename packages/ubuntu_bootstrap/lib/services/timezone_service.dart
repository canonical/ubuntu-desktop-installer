import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_provision/services.dart';

class SubiquityTimezoneService implements TimezoneService {
  const SubiquityTimezoneService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<String> getTimezone() {
    return _subiquity.getTimezone().then((info) => info.timezone);
  }

  @override
  Future<void> setTimezone(String timezone) {
    return _subiquity.setTimezone(timezone);
  }
}
