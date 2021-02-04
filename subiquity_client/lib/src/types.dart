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

enum ApplicationState {
  // ignore: non_constant_identifier_names
  UNKNOWN,
  // ignore: non_constant_identifier_names
  STARTING_UP,
  // ignore: non_constant_identifier_names
  WAITING,
  // ignore: non_constant_identifier_names
  NEEDS_CONFIRMATION,
  // ignore: non_constant_identifier_names
  RUNNING,
  // ignore: non_constant_identifier_names
  POST_WAIT,
  // ignore: non_constant_identifier_names
  POST_RUNNING,
  // ignore: non_constant_identifier_names
  UU_RUNNING,
  // ignore: non_constant_identifier_names
  UU_CANCELLING,
  // ignore: non_constant_identifier_names
  DONE,
  // ignore: non_constant_identifier_names
  ERROR
}

enum ErrorReportState {
  // ignore: non_constant_identifier_names
  INCOMPLETE,
  // ignore: non_constant_identifier_names
  LOADING,
  // ignore: non_constant_identifier_names
  DONE,
  // ignore: non_constant_identifier_names
  ERROR_GENERATING,
  // ignore: non_constant_identifier_names
  ERROR_LOADING
}

enum ErrorReportKind {
  // ignore: non_constant_identifier_names
  BLOCK_PROBE_FAIL,
  // ignore: non_constant_identifier_names
  DISK_PROBE_FAIL,
  // ignore: non_constant_identifier_names
  INSTALL_FAIL,
  // ignore: non_constant_identifier_names
  UI,
  // ignore: non_constant_identifier_names
  NETWORK_FAIL,
  // ignore: non_constant_identifier_names
  SERVER_REQUEST_FAIL,
  // ignore: non_constant_identifier_names
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
  String confirmingTty;
  ErrorReportRef error;
  bool cloudInitOk;
  bool interactive;
  String echoSyslogId;
  String logSyslogId;
  String eventSyslogId;
}
