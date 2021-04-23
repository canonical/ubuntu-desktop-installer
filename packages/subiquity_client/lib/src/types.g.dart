// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeyboardSetting _$_$_KeyboardSettingFromJson(Map<String, dynamic> json) {
  return _$_KeyboardSetting(
    layout: json['layout'] as String?,
    variant: json['variant'] as String?,
    toggle: json['toggle'] as String?,
  );
}

Map<String, dynamic> _$_$_KeyboardSettingToJson(_$_KeyboardSetting instance) =>
    <String, dynamic>{
      'layout': instance.layout,
      'variant': instance.variant,
      'toggle': instance.toggle,
    };

_$_IdentityData _$_$_IdentityDataFromJson(Map<String, dynamic> json) {
  return _$_IdentityData(
    realname: json['realname'] as String?,
    username: json['username'] as String?,
    cryptedPassword: json['crypted_password'] as String?,
    hostname: json['hostname'] as String?,
  );
}

Map<String, dynamic> _$_$_IdentityDataToJson(_$_IdentityData instance) =>
    <String, dynamic>{
      'realname': instance.realname,
      'username': instance.username,
      'crypted_password': instance.cryptedPassword,
      'hostname': instance.hostname,
    };

_$_SSHData _$_$_SSHDataFromJson(Map<String, dynamic> json) {
  return _$_SSHData(
    installServer: json['install_server'] as bool?,
    allowPw: json['allow_pw'] as bool?,
    authorizedKeys: json['authorized_keys'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$_$_SSHDataToJson(_$_SSHData instance) =>
    <String, dynamic>{
      'install_server': instance.installServer,
      'allow_pw': instance.allowPw,
      'authorized_keys': instance.authorizedKeys,
    };

_$_ErrorReportRef _$_$_ErrorReportRefFromJson(Map<String, dynamic> json) {
  return _$_ErrorReportRef(
    state: _$enumDecodeNullable(_$ErrorReportStateEnumMap, json['state']),
    base: json['base'] as String?,
    kind: _$enumDecodeNullable(_$ErrorReportKindEnumMap, json['kind']),
    seen: json['seen'] as bool?,
    oopsId: json['oops_id'] as String?,
  );
}

Map<String, dynamic> _$_$_ErrorReportRefToJson(_$_ErrorReportRef instance) =>
    <String, dynamic>{
      'state': _$ErrorReportStateEnumMap[instance.state],
      'base': instance.base,
      'kind': _$ErrorReportKindEnumMap[instance.kind],
      'seen': instance.seen,
      'oops_id': instance.oopsId,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ErrorReportStateEnumMap = {
  ErrorReportState.INCOMPLETE: 'INCOMPLETE',
  ErrorReportState.LOADING: 'LOADING',
  ErrorReportState.DONE: 'DONE',
  ErrorReportState.ERROR_GENERATING: 'ERROR_GENERATING',
  ErrorReportState.ERROR_LOADING: 'ERROR_LOADING',
};

const _$ErrorReportKindEnumMap = {
  ErrorReportKind.BLOCK_PROBE_FAIL: 'BLOCK_PROBE_FAIL',
  ErrorReportKind.DISK_PROBE_FAIL: 'DISK_PROBE_FAIL',
  ErrorReportKind.INSTALL_FAIL: 'INSTALL_FAIL',
  ErrorReportKind.UI: 'UI',
  ErrorReportKind.NETWORK_FAIL: 'NETWORK_FAIL',
  ErrorReportKind.SERVER_REQUEST_FAIL: 'SERVER_REQUEST_FAIL',
  ErrorReportKind.UNKNOWN: 'UNKNOWN',
};

_$_ApplicationStatus _$_$_ApplicationStatusFromJson(Map<String, dynamic> json) {
  return _$_ApplicationStatus(
    state: _$enumDecodeNullable(_$ApplicationStateEnumMap, json['state']),
    confirmingTty: json['confirming_tty'] as String?,
    error: json['error'] == null
        ? null
        : ErrorReportRef.fromJson(json['error'] as Map<String, dynamic>),
    cloudInitOk: json['cloud_init_ok'] as bool?,
    interactive: json['interactive'] as bool?,
    echoSyslogId: json['echo_syslog_id'] as String?,
    logSyslogId: json['log_syslog_id'] as String?,
    eventSyslogId: json['event_syslog_id'] as String?,
  );
}

Map<String, dynamic> _$_$_ApplicationStatusToJson(
        _$_ApplicationStatus instance) =>
    <String, dynamic>{
      'state': _$ApplicationStateEnumMap[instance.state],
      'confirming_tty': instance.confirmingTty,
      'error': instance.error?.toJson(),
      'cloud_init_ok': instance.cloudInitOk,
      'interactive': instance.interactive,
      'echo_syslog_id': instance.echoSyslogId,
      'log_syslog_id': instance.logSyslogId,
      'event_syslog_id': instance.eventSyslogId,
    };

const _$ApplicationStateEnumMap = {
  ApplicationState.UNKNOWN: 'UNKNOWN',
  ApplicationState.STARTING_UP: 'STARTING_UP',
  ApplicationState.WAITING: 'WAITING',
  ApplicationState.NEEDS_CONFIRMATION: 'NEEDS_CONFIRMATION',
  ApplicationState.RUNNING: 'RUNNING',
  ApplicationState.POST_WAIT: 'POST_WAIT',
  ApplicationState.POST_RUNNING: 'POST_RUNNING',
  ApplicationState.UU_RUNNING: 'UU_RUNNING',
  ApplicationState.UU_CANCELLING: 'UU_CANCELLING',
  ApplicationState.DONE: 'DONE',
  ApplicationState.ERROR: 'ERROR',
};
