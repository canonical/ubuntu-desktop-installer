import 'package:meta/meta.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart' show UsernameValidation;

abstract class IdentityService {
  Future<Identity> getIdentity();
  Future<void> setIdentity(Identity identity);
  Future<UsernameValidation> validateUsername(String username);
}

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
