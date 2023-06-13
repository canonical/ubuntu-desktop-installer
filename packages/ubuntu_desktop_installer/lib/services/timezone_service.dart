import 'package:subiquity_client/subiquity_client.dart';

abstract class TimezoneService {
  Future<String> getTimezone();
  Future<void> setTimezone(String timezone);
}

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
