// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SourceSelection _$_$_SourceSelectionFromJson(Map<String, dynamic> json) {
  return _$_SourceSelection(
    name: json['name'] as String?,
    description: json['description'] as String?,
    id: json['id'] as String?,
    size: json['size'] as int?,
    variant: json['variant'] as String?,
    isDefault: json['default'] as bool?,
  );
}

Map<String, dynamic> _$_$_SourceSelectionToJson(_$_SourceSelection instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'id': instance.id,
      'size': instance.size,
      'variant': instance.variant,
      'default': instance.isDefault,
    };

_$_SourceSelectionAndSetting _$_$_SourceSelectionAndSettingFromJson(
    Map<String, dynamic> json) {
  return _$_SourceSelectionAndSetting(
    sources: (json['sources'] as List<dynamic>?)
        ?.map((e) => SourceSelection.fromJson(e as Map<String, dynamic>))
        .toList(),
    currentId: json['current_id'] as String?,
  );
}

Map<String, dynamic> _$_$_SourceSelectionAndSettingToJson(
        _$_SourceSelectionAndSetting instance) =>
    <String, dynamic>{
      'sources': instance.sources,
      'current_id': instance.currentId,
    };

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
    realname: json['realname'] as String? ?? '',
    username: json['username'] as String? ?? '',
    cryptedPassword: json['crypted_password'] as String?,
    hostname: json['hostname'] as String? ?? '',
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
    wipe: _wipeFromString(json['wipe'] as String?),
    preserve: json['preserve'] as bool?,
    annotations: (json['annotations'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    mount: json['mount'] as String?,
    format: json['format'] as String?,
    grubDevice: json['grub_device'] as bool?,
  );
}

Map<String, dynamic> _$_$_PartitionToJson(_$_Partition instance) =>
    <String, dynamic>{
      'size': instance.size,
      'number': instance.number,
      'wipe': _wipeToString(instance.wipe),
      'preserve': instance.preserve,
      'annotations': instance.annotations,
      'mount': instance.mount,
      'format': instance.format,
      'grub_device': instance.grubDevice,
    };

_$_Disk _$_$_DiskFromJson(Map<String, dynamic> json) {
  return _$_Disk(
    id: json['id'] as String?,
    label: json['label'] as String?,
    path: json['path'] as String?,
    type: json['type'] as String?,
    size: json['size'] as int?,
    usageLabels: (json['usage_labels'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    partitions: (json['partitions'] as List<dynamic>?)
        ?.map((e) => Partition.fromJson(e as Map<String, dynamic>))
        .toList(),
    freeForPartitions: json['free_for_partitions'] as int?,
    okForGuided: json['ok_for_guided'] as bool?,
    ptable: json['ptable'] as String?,
    preserve: json['preserve'] as bool?,
    grubDevice: json['grub_device'] as bool?,
  );
}

Map<String, dynamic> _$_$_DiskToJson(_$_Disk instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'path': instance.path,
      'type': instance.type,
      'size': instance.size,
      'usage_labels': instance.usageLabels,
      'partitions': instance.partitions,
      'free_for_partitions': instance.freeForPartitions,
      'ok_for_guided': instance.okForGuided,
      'ptable': instance.ptable,
      'preserve': instance.preserve,
      'grub_device': instance.grubDevice,
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

_$_StorageResponseV2 _$_$_StorageResponseV2FromJson(Map<String, dynamic> json) {
  return _$_StorageResponseV2(
    disks: (json['disks'] as List<dynamic>?)
        ?.map((e) => Disk.fromJson(e as Map<String, dynamic>))
        .toList(),
    needRoot: json['need_root'] as bool?,
    needBoot: json['need_boot'] as bool?,
    errorReport: json['error_report'] == null
        ? null
        : ErrorReportRef.fromJson(json['error_report'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StorageResponseV2ToJson(
        _$_StorageResponseV2 instance) =>
    <String, dynamic>{
      'disks': instance.disks,
      'need_root': instance.needRoot,
      'need_boot': instance.needBoot,
      'error_report': instance.errorReport,
    };

_$_WSLConfigurationBase _$_$_WSLConfigurationBaseFromJson(
    Map<String, dynamic> json) {
  return _$_WSLConfigurationBase(
    automountRoot: json['automount_root'] as String?,
    automountOptions: json['automount_options'] as String?,
    networkGeneratehosts: json['network_generatehosts'] as bool?,
    networkGenerateresolvconf: json['network_generateresolvconf'] as bool?,
  );
}

Map<String, dynamic> _$_$_WSLConfigurationBaseToJson(
        _$_WSLConfigurationBase instance) =>
    <String, dynamic>{
      'automount_root': instance.automountRoot,
      'automount_options': instance.automountOptions,
      'network_generatehosts': instance.networkGeneratehosts,
      'network_generateresolvconf': instance.networkGenerateresolvconf,
    };

_$_WSLConfigurationAdvanced _$_$_WSLConfigurationAdvancedFromJson(
    Map<String, dynamic> json) {
  return _$_WSLConfigurationAdvanced(
    guiTheme: json['gui_theme'] as String?,
    guiFollowwintheme: json['gui_followwintheme'] as bool?,
    interopGuiintegration: json['interop_guiintegration'] as bool?,
    interopAudiointegration: json['interop_audiointegration'] as bool?,
    interopAdvancedipdetection: json['interop_advancedipdetection'] as bool?,
    motdWSLnewsenabled: json['motd_wslnewsenabled'] as bool?,
    automountEnabled: json['automount_enabled'] as bool?,
    automountMountfstab: json['automount_mountfstab'] as bool?,
    interopEnabled: json['interop_enabled'] as bool?,
    interopAppendwindowspath: json['interop_appendwindowspath'] as bool?,
  );
}

Map<String, dynamic> _$_$_WSLConfigurationAdvancedToJson(
        _$_WSLConfigurationAdvanced instance) =>
    <String, dynamic>{
      'gui_theme': instance.guiTheme,
      'gui_followwintheme': instance.guiFollowwintheme,
      'interop_guiintegration': instance.interopGuiintegration,
      'interop_audiointegration': instance.interopAudiointegration,
      'interop_advancedipdetection': instance.interopAdvancedipdetection,
      'motd_wslnewsenabled': instance.motdWSLnewsenabled,
      'automount_enabled': instance.automountEnabled,
      'automount_mountfstab': instance.automountMountfstab,
      'interop_enabled': instance.interopEnabled,
      'interop_appendwindowspath': instance.interopAppendwindowspath,
    };

_$StepPressKey _$_$StepPressKeyFromJson(Map<String, dynamic> json) {
  return _$StepPressKey(
    symbols:
        (json['symbols'] as List<dynamic>?)?.map((e) => e as String).toList(),
    keycodes: (json['keycodes'] as List<dynamic>?)
        ?.map((e) => e as List<dynamic>)
        .toList(),
  );
}

Map<String, dynamic> _$_$StepPressKeyToJson(_$StepPressKey instance) =>
    <String, dynamic>{
      'symbols': instance.symbols,
      'keycodes': instance.keycodes,
    };

_$StepKeyPresent _$_$StepKeyPresentFromJson(Map<String, dynamic> json) {
  return _$StepKeyPresent(
    symbol: json['symbol'] as String?,
    yes: json['yes'] as String?,
    no: json['no'] as String?,
  );
}

Map<String, dynamic> _$_$StepKeyPresentToJson(_$StepKeyPresent instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'yes': instance.yes,
      'no': instance.no,
    };

_$StepResult _$_$StepResultFromJson(Map<String, dynamic> json) {
  return _$StepResult(
    layout: json['layout'] as String?,
    variant: json['variant'] as String?,
  );
}

Map<String, dynamic> _$_$StepResultToJson(_$StepResult instance) =>
    <String, dynamic>{
      'layout': instance.layout,
      'variant': instance.variant,
    };
