class KeyboardSetting {
  String layout;
  String variant;
  String toggle;
}

class IdentityData {
  String realname;
  String username;
  String crypted_password;
  String hostname;
}

class SSHData {
  bool install_server;
  bool allow_pw;
  List<dynamic> authorized_keys;
}

enum ApplicationState {
  UNKNOWN,
  STARTING,
  EARLY_COMMANDS,
  INTERACTIVE,
  NON_INTERACTIVE,
}

class ApplicationStatus {
  ApplicationState state;
  String early_commands_syslog_id;
  String log_syslog_id;
  String event_syslog_id;
}
