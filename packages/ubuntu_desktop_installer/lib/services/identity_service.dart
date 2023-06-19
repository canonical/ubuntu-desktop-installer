import 'package:meta/meta.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'config_service.dart';

// TODO: remove subiquity-dependency
export 'package:subiquity_client/subiquity_client.dart' show UsernameValidation;

@immutable
class Identity {
  const Identity({
    this.realname = '',
    this.username = '',
    this.cryptedPassword = '',
    this.hostname = '',
    this.autoLogin = false,
  });

  final String realname;
  final String username;
  final String cryptedPassword;
  final String hostname;
  final bool autoLogin;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Identity &&
        other.realname == realname &&
        other.username == username &&
        other.cryptedPassword == cryptedPassword &&
        other.hostname == hostname &&
        other.autoLogin == autoLogin;
  }

  @override
  int get hashCode {
    return Object.hash(
      realname,
      username,
      cryptedPassword,
      hostname,
      autoLogin,
    );
  }

  @override
  String toString() {
    return 'Identity(realname: $realname, username: $username, cryptedPassword: $cryptedPassword, hostname: $hostname, autoLogin: $autoLogin)';
  }
}

abstract class IdentityService {
  Future<Identity> getIdentity();
  Future<void> setIdentity(Identity identity);
  Future<UsernameValidation> validateUsername(String username);
}

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
      cryptedPassword: data.cryptedPassword,
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
      cryptedPassword: identity.cryptedPassword,
      hostname: identity.hostname,
    ));
  }

  @override
  Future<UsernameValidation> validateUsername(String username) {
    return _subiquity.validateUsername(username);
  }
}
