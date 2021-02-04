class KeyboardSetting {
  String layout;
  String variant;
  String toggle;
}

class IdentityData {
  String realname;
  String username;
  String cryptedPassword;
  String hostname;
}

class SSHData {
  bool installServer;
  bool allowPw;
  List<dynamic> authorizedKeys;
}

// ignore: non_constant_identifier_names
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

// ignore: non_constant_identifier_names
enum ErrorReportState {
  INCOMPLETE,
  LOADING,
  DONE,
  ERROR_GENERATING,
  ERROR_LOADING
}

// ignore: non_constant_identifier_names
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
  String oopsId;
}

class ApplicationStatus {
  ApplicationState state;
  String confirming_tty;
  ErrorReportRef error;
  bool cloudInitOk;
  bool interactive;
  String echoSyslogId;
  String logSyslogId;
  String eventSyslogId;
}
