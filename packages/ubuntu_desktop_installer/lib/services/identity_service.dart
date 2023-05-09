import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart'
    show IdentityData, UsernameValidation;

abstract class IdentityService {
  Future<IdentityData> getIdentity();
  Future<void> setIdentity(IdentityData identity);
  Future<UsernameValidation> validateUsername(String username);
}

class SubiquityIdentityService implements IdentityService {
  const SubiquityIdentityService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<IdentityData> getIdentity() => _subiquity.getIdentity();

  @override
  Future<void> setIdentity(IdentityData identity) {
    return _subiquity.setIdentity(identity);
  }

  @override
  Future<UsernameValidation> validateUsername(String username) {
    return _subiquity.validateUsername(username);
  }
}
