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

_$_KeyboardVariant _$_$_KeyboardVariantFromJson(Map<String, dynamic> json) {
  return _$_KeyboardVariant(
    code: json['code'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$_$_KeyboardVariantToJson(_$_KeyboardVariant instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

_$_KeyboardLayout _$_$_KeyboardLayoutFromJson(Map<String, dynamic> json) {
  return _$_KeyboardLayout(
    code: json['code'] as String?,
    name: json['name'] as String?,
    variants: (json['variants'] as List<dynamic>?)
        ?.map((e) => KeyboardVariant.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_KeyboardLayoutToJson(_$_KeyboardLayout instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'variants': instance.variants,
    };

_$_KeyboardSetup _$_$_KeyboardSetupFromJson(Map<String, dynamic> json) {
  return _$_KeyboardSetup(
    setting: json['setting'] == null
        ? null
        : KeyboardSetting.fromJson(json['setting'] as Map<String, dynamic>),
    layouts: (json['layouts'] as List<dynamic>?)
        ?.map((e) => KeyboardLayout.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_KeyboardSetupToJson(_$_KeyboardSetup instance) =>
    <String, dynamic>{
      'setting': instance.setting,
      'layouts': instance.layouts,
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

_$_TimezoneData _$_$_TimezoneDataFromJson(Map<String, dynamic> json) {
  return _$_TimezoneData(
    timezone: json['timezone'] as String?,
    fromGeoIP: json['from_geoip'] as bool?,
  );
}

Map<String, dynamic> _$_$_TimezoneDataToJson(_$_TimezoneData instance) =>
    <String, dynamic>{
      'timezone': instance.timezone,
      'from_geoip': instance.fromGeoIP,
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

_$_Partition _$_$_PartitionFromJson(Map<String, dynamic> json) {
  return _$_Partition(
    size: json['size'] as int?,
    number: json['number'] as int?,
    annotations: (json['annotations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_PartitionToJson(_$_Partition instance) =>
    <String, dynamic>{
      'size': instance.size,
      'number': instance.number,
      'annotations': instance.annotations,
    };

_$_Disk _$_$_DiskFromJson(Map<String, dynamic> json) {
  return _$_Disk(
    id: json['id'] as String?,
    label: json['label'] as String?,
    type: json['type'] as String?,
    size: json['size'] as int?,
    usageLabels: (json['usage_labels'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    partitions: (json['partitions'] as List<dynamic>?)
        ?.map((e) => Partition.fromJson(e as Map<String, dynamic>))
        .toList(),
    okForGuided: json['ok_for_guided'] as bool?,
  );
}

Map<String, dynamic> _$_$_DiskToJson(_$_Disk instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'size': instance.size,
      'usage_labels': instance.usageLabels,
      'partitions': instance.partitions,
      'ok_for_guided': instance.okForGuided,
    };

_$_GuidedChoice _$_$_GuidedChoiceFromJson(Map<String, dynamic> json) {
  return _$_GuidedChoice(
    diskId: json['disk_id'] as String?,
    useLvm: json['use_lvm'] as bool?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$_$_GuidedChoiceToJson(_$_GuidedChoice instance) =>
    <String, dynamic>{
      'disk_id': instance.diskId,
      'use_lvm': instance.useLvm,
      'password': instance.password,
    };

_$_GuidedStorageResponse _$_$_GuidedStorageResponseFromJson(
    Map<String, dynamic> json) {
  return _$_GuidedStorageResponse(
    status: _$enumDecodeNullable(_$ProbeStatusEnumMap, json['status']),
    errorReport: json['error_report'] == null
        ? null
        : ErrorReportRef.fromJson(json['error_report'] as Map<String, dynamic>),
    disks: (json['disks'] as List<dynamic>?)
        ?.map((e) => Disk.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_GuidedStorageResponseToJson(
        _$_GuidedStorageResponse instance) =>
    <String, dynamic>{
      'status': _$ProbeStatusEnumMap[instance.status],
      'error_report': instance.errorReport,
      'disks': instance.disks,
    };

const _$ProbeStatusEnumMap = {
  ProbeStatus.PROBING: 'PROBING',
  ProbeStatus.FAILED: 'FAILED',
  ProbeStatus.DONE: 'DONE',
};

_$_StorageResponse _$_$_StorageResponseFromJson(Map<String, dynamic> json) {
  return _$_StorageResponse(
    status: _$enumDecodeNullable(_$ProbeStatusEnumMap, json['status']),
    errorReport: json['error_report'] == null
        ? null
        : ErrorReportRef.fromJson(json['error_report'] as Map<String, dynamic>),
    bootloader: _$enumDecodeNullable(_$BootloaderEnumMap, json['bootloader']),
    origConfig: json['orig_config'] as List<dynamic>?,
    config: json['config'] as List<dynamic>?,
    blockdev: json['blockdev'] as Map<String, dynamic>?,
    dasd: json['dasd'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$_$_StorageResponseToJson(_$_StorageResponse instance) =>
    <String, dynamic>{
      'status': _$ProbeStatusEnumMap[instance.status],
      'error_report': instance.errorReport,
      'bootloader': _$BootloaderEnumMap[instance.bootloader],
      'orig_config': instance.origConfig,
      'config': instance.config,
      'blockdev': instance.blockdev,
      'dasd': instance.dasd,
    };

const _$BootloaderEnumMap = {
  Bootloader.NONE: 'NONE',
  Bootloader.BIOS: 'BIOS',
  Bootloader.UEFI: 'UEFI',
  Bootloader.PREP: 'PREP',
};
