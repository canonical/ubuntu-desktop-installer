import 'package:meta/meta.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';

import 'config_service.dart';

// TODO: remove subiquity-dependency
export 'package:subiquity_client/subiquity_client.dart' show UsernameValidation;

@immutable
class Identity {
  const Identity({
    this.realname = '',
    this.username = '',
    this.password = '',
    this.hostname = '',
    this.autoLogin = false,
  });

  final String realname;
  final String username;
  final String password;
  final String hostname;
  final bool autoLogin;

  Identity copyWith({
    String? realname,
    String? username,
    String? password,
    String? hostname,
    bool? autoLogin,
  }) {
    return Identity(
      realname: realname ?? this.realname,
      username: username ?? this.username,
      password: password ?? this.password,
      hostname: hostname ?? this.hostname,
      autoLogin: autoLogin ?? this.autoLogin,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Identity &&
        other.realname == realname &&
        other.username == username &&
        other.password == password &&
        other.hostname == hostname &&
        other.autoLogin == autoLogin;
  }

  @override
  int get hashCode {
    return Object.hash(
      realname,
      username,
      password,
      hostname,
      autoLogin,
    );
  }

  @override
  String toString() {
    final hiddenPassword = '*' * password.length;
    return 'Identity(realname: $realname, username: $username, password: $hiddenPassword, hostname: $hostname, autoLogin: $autoLogin)';
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
      cryptedPassword: encryptPassword(identity.password),
      hostname: identity.hostname,
    ));
  }

  @override
  Future<UsernameValidation> validateUsername(String username) {
    return _subiquity.validateUsername(username);
  }
}
