import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
abstract class KeyboardSetting with _$KeyboardSetting {
  const factory KeyboardSetting({
    String layout,
    String variant,
    String toggle,
  }) = _KeyboardSetting;

  factory KeyboardSetting.fromJson(Map<String, dynamic> json) =>
      _$KeyboardSettingFromJson(json);
}

@freezed
abstract class IdentityData with _$IdentityData {
  const factory IdentityData({
    String realname,
    String username,
    @JsonKey(name: 'crypted_password') String cryptedPassword,
    String hostname,
  }) = _IdentityData;

  factory IdentityData.fromJson(Map<String, dynamic> json) =>
      _$IdentityDataFromJson(json);
}

@freezed
abstract class SSHData with _$SSHData {
  const factory SSHData({
    @JsonKey(name: 'install_server') bool installServer,
    @JsonKey(name: 'allow_pw') bool allowPw,
    @JsonKey(name: 'authorized_keys') List<dynamic> authorizedKeys,
  }) = _SSHData;

  factory SSHData.fromJson(Map<String, dynamic> json) =>
      _$SSHDataFromJson(json);
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

@freezed
abstract class ErrorReportRef with _$ErrorReportRef {
  const factory ErrorReportRef({
    ErrorReportState state,
    String base,
    ErrorReportKind kind,
    bool seen,
    @JsonKey(name: 'oops_id') String oopsId,
  }) = _ErrorReportRef;

  factory ErrorReportRef.fromJson(Map<String, dynamic> json) =>
      _$ErrorReportRefFromJson(json);
}

@freezed
abstract class ApplicationStatus with _$ApplicationStatus {
  @JsonSerializable(explicitToJson: true)
  const factory ApplicationStatus({
    ApplicationState state,
    @JsonKey(name: 'confirming_tty') String confirmingTty,
    ErrorReportRef error,
    @JsonKey(name: 'cloud_init_ok') bool cloudInitOk,
    bool interactive,
    @JsonKey(name: 'echo_syslog_id') String echoSyslogId,
    @JsonKey(name: 'log_syslog_id') String logSyslogId,
    @JsonKey(name: 'event_syslog_id') String eventSyslogId,
  }) = _ApplicationStatus;

  factory ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStatusFromJson(json);
}
