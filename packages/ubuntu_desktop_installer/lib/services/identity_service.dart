import 'package:crypt/crypt.dart';
import 'package:meta/meta.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_provision/services.dart';

import 'config_service.dart';

class SubiquityIdentityService implements IdentityService {
  const SubiquityIdentityService(this._subiquity, this._config);

  final SubiquityClient _subiquity;
  final ConfigService _config;

  /// The auto-login user config key for testing purposes.
  @visibleForTesting
  static const kAutoLoginUser = 'AutoLoginUser';

  @override
  Future<Identity> getIdentity() async {
    final data = await _subiquity.getIdentity();
    return Identity(
      realname: data.realname,
      username: data.username,
      hostname: data.hostname,
      autoLogin: await _config.get(kAutoLoginUser) != null,
    );
  }

  @override
  Future<void> setIdentity(Identity identity) async {
    if (identity.autoLogin) {
      await _config.set(kAutoLoginUser, identity.username);
    } else {
      await _config.set(kAutoLoginUser, null);
    }

    return _subiquity.setIdentity(IdentityData(
      realname: identity.realname,
      username: identity.username,
      cryptedPassword: Crypt.sha512(identity.password).toString(),
      hostname: identity.hostname,
    ));
  }

  @override
  Future<UsernameValidation> validateUsername(String username) {
    return _subiquity.validateUsername(username);
  }
}
