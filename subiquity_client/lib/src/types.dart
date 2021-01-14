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
  STARTING_UP,
  WAITING,
  NEEDS_CONFIRMATION,
  RUNNING,
  POST_WAIT,
  POST_RUNNING,
  UU_RUNNING,
  UU_CANCELLING,
  DONE,
  ERROR
}

enum ErrorReportState {
  INCOMPLETE,
  LOADING,
  DONE,
  ERROR_GENERATING,
  ERROR_LOADING
}

enum ErrorReportKind {
  BLOCK_PROBE_FAIL,
  DISK_PROBE_FAIL,
  INSTALL_FAIL,
  UI,
  NETWORK_FAIL,
  SERVER_REQUEST_FAIL,
  UNKNOWN
}

class ErrorReportRef {
  ErrorReportState state;
  String base;
  ErrorReportKind kind;
  bool seen;
  String oops_id;
}

class ApplicationStatus {
  ApplicationState state;
  String confirming_tty;
  ErrorReportRef error;
  bool cloud_init_ok;
  bool interactive;
  String echo_syslog_id;
  String log_syslog_id;
  String event_syslog_id;
}
