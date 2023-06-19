import 'package:subiquity_client/subiquity_client.dart';

abstract class SessionService {
  Future<void> reboot({bool immediate = false});
  Future<void> shutdown({bool immediate = false});
}

class SubiquitySessionService implements SessionService {
  const SubiquitySessionService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<void> reboot({bool immediate = false}) {
    return _subiquity.reboot(immediate: immediate);
  }

  @override
  Future<void> shutdown({bool immediate = false}) {
    return _subiquity.shutdown(immediate: immediate);
  }
}
