import 'package:subiquity_client/subiquity_client.dart';

abstract class SessionService {
  Future<void> reboot();
  Future<void> shutdown();
}

class SubiquitySessionService implements SessionService {
  const SubiquitySessionService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<void> reboot() {
    return _subiquity.reboot();
  }

  @override
  Future<void> shutdown() {
    return _subiquity.shutdown();
  }
}
