// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorReportRef _$_$_ErrorReportRefFromJson(Map<String, dynamic> json) {
  return _$_ErrorReportRef(
    state: _$enumDecode(_$ErrorReportStateEnumMap, json['state']),
    base: json['base'] as String,
    kind: _$enumDecode(_$ErrorReportKindEnumMap, json['kind']),
    seen: json['seen'] as bool,
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
  ErrorReportKind.NETWORK_CLIENT_FAIL: 'NETWORK_CLIENT_FAIL',
  ErrorReportKind.SERVER_REQUEST_FAIL: 'SERVER_REQUEST_FAIL',
  ErrorReportKind.UNKNOWN: 'UNKNOWN',
};

_$_ApplicationStatus _$_$_ApplicationStatusFromJson(Map<String, dynamic> json) {
  return _$_ApplicationStatus(
    state: _$enumDecode(_$ApplicationStateEnumMap, json['state']),
    confirmingTty: json['confirming_tty'] as String,
    error: json['error'] == null
        ? null
        : ErrorReportRef.fromJson(json['error'] as Map<String, dynamic>),
    cloudInitOk: json['cloud_init_ok'] as bool?,
    interactive: json['interactive'] as bool?,
    echoSyslogId: json['echo_syslog_id'] as String,
    logSyslogId: json['log_syslog_id'] as String,
    eventSyslogId: json['event_syslog_id'] as String,
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
  ApplicationState.STARTING_UP: 'STARTING_UP',
  ApplicationState.CLOUD_INIT_WAIT: 'CLOUD_INIT_WAIT',
  ApplicationState.EARLY_COMMANDS: 'EARLY_COMMANDS',
  ApplicationState.WAITING: 'WAITING',
  ApplicationState.NEEDS_CONFIRMATION: 'NEEDS_CONFIRMATION',
  ApplicationState.RUNNING: 'RUNNING',
  ApplicationState.POST_WAIT: 'POST_WAIT',
  ApplicationState.POST_RUNNING: 'POST_RUNNING',
  ApplicationState.UU_RUNNING: 'UU_RUNNING',
  ApplicationState.UU_CANCELLING: 'UU_CANCELLING',
  ApplicationState.DONE: 'DONE',
  ApplicationState.ERROR: 'ERROR',
  ApplicationState.EXITED: 'EXITED',
};

_$_KeyFingerprint _$_$_KeyFingerprintFromJson(Map<String, dynamic> json) {
  return _$_KeyFingerprint(
    keytype: json['keytype'] as String,
    fingerprint: json['fingerprint'] as String,
  );
}

Map<String, dynamic> _$_$_KeyFingerprintToJson(_$_KeyFingerprint instance) =>
    <String, dynamic>{
      'keytype': instance.keytype,
      'fingerprint': instance.fingerprint,
    };

_$_LiveSessionSSHInfo _$_$_LiveSessionSSHInfoFromJson(
    Map<String, dynamic> json) {
  return _$_LiveSessionSSHInfo(
    username: json['username'] as String,
    passwordKind: _$enumDecode(_$PasswordKindEnumMap, json['password_kind']),
    password: json['password'] as String?,
    authorizedKeyFingerprints:
        (json['authorized_key_fingerprints'] as List<dynamic>)
            .map((e) => KeyFingerprint.fromJson(e as Map<String, dynamic>))
            .toList(),
    ips: (json['ips'] as List<dynamic>).map((e) => e as String).toList(),
    hostKeyFingerprints: (json['host_key_fingerprints'] as List<dynamic>)
        .map((e) => KeyFingerprint.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_LiveSessionSSHInfoToJson(
        _$_LiveSessionSSHInfo instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password_kind': _$PasswordKindEnumMap[instance.passwordKind],
      'password': instance.password,
      'authorized_key_fingerprints':
          instance.authorizedKeyFingerprints.map((e) => e.toJson()).toList(),
      'ips': instance.ips,
      'host_key_fingerprints':
          instance.hostKeyFingerprints.map((e) => e.toJson()).toList(),
    };

const _$PasswordKindEnumMap = {
  PasswordKind.NONE: 'NONE',
  PasswordKind.KNOWN: 'KNOWN',
  PasswordKind.UNKNOWN: 'UNKNOWN',
};

_$_RefreshStatus _$_$_RefreshStatusFromJson(Map<String, dynamic> json) {
  return _$_RefreshStatus(
    availability:
        _$enumDecode(_$RefreshCheckStateEnumMap, json['availability']),
    currentSnapVersion: json['current_snap_version'] as String? ?? '',
    newSnapVersion: json['new_snap_version'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_RefreshStatusToJson(_$_RefreshStatus instance) =>
    <String, dynamic>{
      'availability': _$RefreshCheckStateEnumMap[instance.availability],
      'current_snap_version': instance.currentSnapVersion,
      'new_snap_version': instance.newSnapVersion,
    };

const _$RefreshCheckStateEnumMap = {
  RefreshCheckState.UNKNOWN: 'UNKNOWN',
  RefreshCheckState.AVAILABLE: 'AVAILABLE',
  RefreshCheckState.UNAVAILABLE: 'UNAVAILABLE',
};

_$StepPressKey _$_$StepPressKeyFromJson(Map<String, dynamic> json) {
  return _$StepPressKey(
    symbols:
        (json['symbols'] as List<dynamic>).map((e) => e as String).toList(),
    keycodes: const JsonMapConverter().fromJson(json['keycodes'] as List),
  );
}

Map<String, dynamic> _$_$StepPressKeyToJson(_$StepPressKey instance) =>
    <String, dynamic>{
      'symbols': instance.symbols,
      'keycodes': const JsonMapConverter().toJson(instance.keycodes),
    };

_$StepKeyPresent _$_$StepKeyPresentFromJson(Map<String, dynamic> json) {
  return _$StepKeyPresent(
    symbol: json['symbol'] as String,
    yes: json['yes'] as String,
    no: json['no'] as String,
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
    layout: json['layout'] as String,
    variant: json['variant'] as String,
  );
}

Map<String, dynamic> _$_$StepResultToJson(_$StepResult instance) =>
    <String, dynamic>{
      'layout': instance.layout,
      'variant': instance.variant,
    };

_$_KeyboardSetting _$_$_KeyboardSettingFromJson(Map<String, dynamic> json) {
  return _$_KeyboardSetting(
    layout: json['layout'] as String,
    variant: json['variant'] as String? ?? '',
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
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_KeyboardVariantToJson(_$_KeyboardVariant instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

_$_KeyboardLayout _$_$_KeyboardLayoutFromJson(Map<String, dynamic> json) {
  return _$_KeyboardLayout(
    code: json['code'] as String,
    name: json['name'] as String,
    variants: (json['variants'] as List<dynamic>)
        .map((e) => KeyboardVariant.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_KeyboardLayoutToJson(_$_KeyboardLayout instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
    };

_$_KeyboardSetup _$_$_KeyboardSetupFromJson(Map<String, dynamic> json) {
  return _$_KeyboardSetup(
    setting: KeyboardSetting.fromJson(json['setting'] as Map<String, dynamic>),
    layouts: (json['layouts'] as List<dynamic>)
        .map((e) => KeyboardLayout.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_KeyboardSetupToJson(_$_KeyboardSetup instance) =>
    <String, dynamic>{
      'setting': instance.setting.toJson(),
      'layouts': instance.layouts.map((e) => e.toJson()).toList(),
    };

_$_SourceSelection _$_$_SourceSelectionFromJson(Map<String, dynamic> json) {
  return _$_SourceSelection(
    name: json['name'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
    size: json['size'] as int,
    variant: json['variant'] as String,
    isDefault: json['default'] as bool,
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
    sources: (json['sources'] as List<dynamic>)
        .map((e) => SourceSelection.fromJson(e as Map<String, dynamic>))
        .toList(),
    currentId: json['current_id'] as String,
    searchDrivers: json['search_drivers'] as bool,
  );
}

Map<String, dynamic> _$_$_SourceSelectionAndSettingToJson(
        _$_SourceSelectionAndSetting instance) =>
    <String, dynamic>{
      'sources': instance.sources.map((e) => e.toJson()).toList(),
      'current_id': instance.currentId,
      'search_drivers': instance.searchDrivers,
    };

_$_ZdevInfo _$_$_ZdevInfoFromJson(Map<String, dynamic> json) {
  return _$_ZdevInfo(
    id: json['id'] as String,
    type: json['type'] as String,
    on: json['on'] as bool,
    exists: json['exists'] as bool,
    pers: json['pers'] as bool,
    auto: json['auto'] as bool,
    failed: json['failed'] as bool,
    names: json['names'] as String,
  );
}

Map<String, dynamic> _$_$_ZdevInfoToJson(_$_ZdevInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'on': instance.on,
      'exists': instance.exists,
      'pers': instance.pers,
      'auto': instance.auto,
      'failed': instance.failed,
      'names': instance.names,
    };

_$_NetworkStatus _$_$_NetworkStatusFromJson(Map<String, dynamic> json) {
  return _$_NetworkStatus(
    devices: (json['devices'] as List<dynamic>)
        .map((e) => NetDevInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    wlanSupportInstallState: _$enumDecode(
        _$WLANSupportInstallStateEnumMap, json['wlan_support_install_state']),
  );
}

Map<String, dynamic> _$_$_NetworkStatusToJson(_$_NetworkStatus instance) =>
    <String, dynamic>{
      'devices': instance.devices.map((e) => e.toJson()).toList(),
      'wlan_support_install_state':
          _$WLANSupportInstallStateEnumMap[instance.wlanSupportInstallState],
    };

const _$WLANSupportInstallStateEnumMap = {
  WLANSupportInstallState.NOT_NEEDED: 'NOT_NEEDED',
  WLANSupportInstallState.NOT_AVAILABLE: 'NOT_AVAILABLE',
  WLANSupportInstallState.INSTALLING: 'INSTALLING',
  WLANSupportInstallState.FAILED: 'FAILED',
  WLANSupportInstallState.DONE: 'DONE',
};

_$_OsProber _$_$_OsProberFromJson(Map<String, dynamic> json) {
  return _$_OsProber(
    long: json['long'] as String,
    label: json['label'] as String,
    type: json['type'] as String,
    subpath: json['subpath'] as String?,
    version: json['version'] as String?,
  );
}

Map<String, dynamic> _$_$_OsProberToJson(_$_OsProber instance) =>
    <String, dynamic>{
      'long': instance.long,
      'label': instance.label,
      'type': instance.type,
      'subpath': instance.subpath,
      'version': instance.version,
    };

_$Partition _$_$PartitionFromJson(Map<String, dynamic> json) {
  return _$Partition(
    size: json['size'] as int?,
    number: json['number'] as int?,
    preserve: json['preserve'] as bool?,
    wipe: json['wipe'] as String?,
    annotations: (json['annotations'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    mount: json['mount'] as String?,
    format: json['format'] as String?,
    grubDevice: json['grub_device'] as bool?,
    boot: json['boot'] as bool?,
    os: json['os'] == null
        ? null
        : OsProber.fromJson(json['os'] as Map<String, dynamic>),
    offset: json['offset'] as int?,
    resize: json['resize'] as bool?,
    path: json['path'] as String?,
  );
}

Map<String, dynamic> _$_$PartitionToJson(_$Partition instance) =>
    <String, dynamic>{
      'size': instance.size,
      'number': instance.number,
      'preserve': instance.preserve,
      'wipe': instance.wipe,
      'annotations': instance.annotations,
      'mount': instance.mount,
      'format': instance.format,
      'grub_device': instance.grubDevice,
      'boot': instance.boot,
      'os': instance.os?.toJson(),
      'offset': instance.offset,
      'resize': instance.resize,
      'path': instance.path,
    };

_$Gap _$_$GapFromJson(Map<String, dynamic> json) {
  return _$Gap(
    offset: json['offset'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$_$GapToJson(_$Gap instance) => <String, dynamic>{
      'offset': instance.offset,
      'size': instance.size,
    };

_$_Disk _$_$_DiskFromJson(Map<String, dynamic> json) {
  return _$_Disk(
    id: json['id'] as String,
    label: json['label'] as String,
    type: json['type'] as String,
    size: json['size'] as int,
    usageLabels: (json['usage_labels'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    partitions: (json['partitions'] as List<dynamic>)
        .map((e) => PartitionOrGap.fromJson(e as Map<String, dynamic>))
        .toList(),
    okForGuided: json['ok_for_guided'] as bool,
    ptable: json['ptable'] as String?,
    preserve: json['preserve'] as bool,
    path: json['path'] as String?,
    bootDevice: json['boot_device'] as bool,
    model: json['model'] as String?,
    vendor: json['vendor'] as String?,
  );
}

Map<String, dynamic> _$_$_DiskToJson(_$_Disk instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'size': instance.size,
      'usage_labels': instance.usageLabels,
      'partitions': instance.partitions.map((e) => e.toJson()).toList(),
      'ok_for_guided': instance.okForGuided,
      'ptable': instance.ptable,
      'preserve': instance.preserve,
      'path': instance.path,
      'boot_device': instance.bootDevice,
      'model': instance.model,
      'vendor': instance.vendor,
    };

_$_GuidedChoice _$_$_GuidedChoiceFromJson(Map<String, dynamic> json) {
  return _$_GuidedChoice(
    diskId: json['disk_id'] as String,
    useLvm: json['use_lvm'] as bool? ?? false,
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
    status: _$enumDecode(_$ProbeStatusEnumMap, json['status']),
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
      'error_report': instance.errorReport?.toJson(),
      'disks': instance.disks?.map((e) => e.toJson()).toList(),
    };

const _$ProbeStatusEnumMap = {
  ProbeStatus.PROBING: 'PROBING',
  ProbeStatus.FAILED: 'FAILED',
  ProbeStatus.DONE: 'DONE',
};

_$_StorageResponse _$_$_StorageResponseFromJson(Map<String, dynamic> json) {
  return _$_StorageResponse(
    status: _$enumDecode(_$ProbeStatusEnumMap, json['status']),
    errorReport: json['error_report'] == null
        ? null
        : ErrorReportRef.fromJson(json['error_report'] as Map<String, dynamic>),
    bootloader: _$enumDecodeNullable(_$BootloaderEnumMap, json['bootloader']),
    origConfig: json['orig_config'] as List<dynamic>?,
    config: json['config'] as List<dynamic>?,
    blockdev: json['blockdev'] as Map<String, dynamic>?,
    dasd: json['dasd'] as Map<String, dynamic>?,
    storageVersion: json['storage_version'] as int? ?? 1,
  );
}

Map<String, dynamic> _$_$_StorageResponseToJson(_$_StorageResponse instance) =>
    <String, dynamic>{
      'status': _$ProbeStatusEnumMap[instance.status],
      'error_report': instance.errorReport?.toJson(),
      'bootloader': _$BootloaderEnumMap[instance.bootloader],
      'orig_config': instance.origConfig,
      'config': instance.config,
      'blockdev': instance.blockdev,
      'dasd': instance.dasd,
      'storage_version': instance.storageVersion,
    };

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

const _$BootloaderEnumMap = {
  Bootloader.NONE: 'NONE',
  Bootloader.BIOS: 'BIOS',
  Bootloader.UEFI: 'UEFI',
  Bootloader.PREP: 'PREP',
};

_$_StorageResponseV2 _$_$_StorageResponseV2FromJson(Map<String, dynamic> json) {
  return _$_StorageResponseV2(
    disks: (json['disks'] as List<dynamic>)
        .map((e) => Disk.fromJson(e as Map<String, dynamic>))
        .toList(),
    needRoot: json['need_root'] as bool,
    needBoot: json['need_boot'] as bool,
    errorReport: json['error_report'] == null
        ? null
        : ErrorReportRef.fromJson(json['error_report'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StorageResponseV2ToJson(
        _$_StorageResponseV2 instance) =>
    <String, dynamic>{
      'disks': instance.disks.map((e) => e.toJson()).toList(),
      'need_root': instance.needRoot,
      'need_boot': instance.needBoot,
      'error_report': instance.errorReport?.toJson(),
    };

_$_AddPartitionV2 _$_$_AddPartitionV2FromJson(Map<String, dynamic> json) {
  return _$_AddPartitionV2(
    diskId: json['disk_id'] as String,
    partition: Partition.fromJson(json['partition'] as Map<String, dynamic>),
    gap: Gap.fromJson(json['gap'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AddPartitionV2ToJson(_$_AddPartitionV2 instance) =>
    <String, dynamic>{
      'disk_id': instance.diskId,
      'partition': instance.partition.toJson(),
      'gap': instance.gap.toJson(),
    };

_$_ModifyPartitionV2 _$_$_ModifyPartitionV2FromJson(Map<String, dynamic> json) {
  return _$_ModifyPartitionV2(
    diskId: json['disk_id'] as String,
    partition: Partition.fromJson(json['partition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ModifyPartitionV2ToJson(
        _$_ModifyPartitionV2 instance) =>
    <String, dynamic>{
      'disk_id': instance.diskId,
      'partition': instance.partition.toJson(),
    };

_$_ReformatDisk _$_$_ReformatDiskFromJson(Map<String, dynamic> json) {
  return _$_ReformatDisk(
    diskId: json['disk_id'] as String,
    ptable: json['ptable'] as String?,
  );
}

Map<String, dynamic> _$_$_ReformatDiskToJson(_$_ReformatDisk instance) =>
    <String, dynamic>{
      'disk_id': instance.diskId,
      'ptable': instance.ptable,
    };

_$_IdentityData _$_$_IdentityDataFromJson(Map<String, dynamic> json) {
  return _$_IdentityData(
    realname: json['realname'] as String? ?? '',
    username: json['username'] as String? ?? '',
    cryptedPassword: json['crypted_password'] as String? ?? '',
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

_$_SSHData _$_$_SSHDataFromJson(Map<String, dynamic> json) {
  return _$_SSHData(
    installServer: json['install_server'] as bool,
    allowPw: json['allow_pw'] as bool,
    authorizedKeys: (json['authorized_keys'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SSHDataToJson(_$_SSHData instance) =>
    <String, dynamic>{
      'install_server': instance.installServer,
      'allow_pw': instance.allowPw,
      'authorized_keys': instance.authorizedKeys,
    };

_$_ChannelSnapInfo _$_$_ChannelSnapInfoFromJson(Map<String, dynamic> json) {
  return _$_ChannelSnapInfo(
    channelName: json['channel_name'] as String,
    revision: json['revision'] as String,
    confinement: json['confinement'] as String,
    version: json['version'] as String,
    size: json['size'] as int,
    releasedAt: DateTime.parse(json['released_at'] as String),
  );
}

Map<String, dynamic> _$_$_ChannelSnapInfoToJson(_$_ChannelSnapInfo instance) =>
    <String, dynamic>{
      'channel_name': instance.channelName,
      'revision': instance.revision,
      'confinement': instance.confinement,
      'version': instance.version,
      'size': instance.size,
      'released_at': instance.releasedAt.toIso8601String(),
    };

_$_SnapInfo _$_$_SnapInfoFromJson(Map<String, dynamic> json) {
  return _$_SnapInfo(
    name: json['name'] as String,
    summary: json['summary'] as String? ?? '',
    publisher: json['publisher'] as String? ?? '',
    verified: json['verified'] as bool? ?? false,
    starred: json['starred'] as bool? ?? false,
    description: json['description'] as String? ?? '',
    confinement: json['confinement'] as String? ?? '',
    license: json['license'] as String? ?? '',
    channels: (json['channels'] as List<dynamic>?)
            ?.map((e) => ChannelSnapInfo.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SnapInfoToJson(_$_SnapInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
      'publisher': instance.publisher,
      'verified': instance.verified,
      'starred': instance.starred,
      'description': instance.description,
      'confinement': instance.confinement,
      'license': instance.license,
      'channels': instance.channels.map((e) => e.toJson()).toList(),
    };

_$_DriversResponse _$_$_DriversResponseFromJson(Map<String, dynamic> json) {
  return _$_DriversResponse(
    install: json['install'] as bool,
    drivers:
        (json['drivers'] as List<dynamic>?)?.map((e) => e as String).toList(),
    localOnly: json['local_only'] as bool,
    searchDrivers: json['search_drivers'] as bool,
  );
}

Map<String, dynamic> _$_$_DriversResponseToJson(_$_DriversResponse instance) =>
    <String, dynamic>{
      'install': instance.install,
      'drivers': instance.drivers,
      'local_only': instance.localOnly,
      'search_drivers': instance.searchDrivers,
    };

_$_DriversPayload _$_$_DriversPayloadFromJson(Map<String, dynamic> json) {
  return _$_DriversPayload(
    install: json['install'] as bool,
  );
}

Map<String, dynamic> _$_$_DriversPayloadToJson(_$_DriversPayload instance) =>
    <String, dynamic>{
      'install': instance.install,
    };

_$_SnapSelection _$_$_SnapSelectionFromJson(Map<String, dynamic> json) {
  return _$_SnapSelection(
    name: json['name'] as String,
    channel: json['channel'] as String,
    classic: json['classic'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_SnapSelectionToJson(_$_SnapSelection instance) =>
    <String, dynamic>{
      'name': instance.name,
      'channel': instance.channel,
      'classic': instance.classic,
    };

_$_SnapListResponse _$_$_SnapListResponseFromJson(Map<String, dynamic> json) {
  return _$_SnapListResponse(
    status: _$enumDecode(_$SnapCheckStateEnumMap, json['status']),
    snaps: (json['snaps'] as List<dynamic>?)
            ?.map((e) => SnapInfo.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    selections: (json['selections'] as List<dynamic>?)
            ?.map((e) => SnapSelection.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SnapListResponseToJson(
        _$_SnapListResponse instance) =>
    <String, dynamic>{
      'status': _$SnapCheckStateEnumMap[instance.status],
      'snaps': instance.snaps.map((e) => e.toJson()).toList(),
      'selections': instance.selections.map((e) => e.toJson()).toList(),
    };

const _$SnapCheckStateEnumMap = {
  SnapCheckState.FAILED: 'FAILED',
  SnapCheckState.LOADING: 'LOADING',
  SnapCheckState.DONE: 'DONE',
};

_$_TimeZoneInfo _$_$_TimeZoneInfoFromJson(Map<String, dynamic> json) {
  return _$_TimeZoneInfo(
    timezone: json['timezone'] as String,
    fromGeoip: json['from_geoip'] as bool,
  );
}

Map<String, dynamic> _$_$_TimeZoneInfoToJson(_$_TimeZoneInfo instance) =>
    <String, dynamic>{
      'timezone': instance.timezone,
      'from_geoip': instance.fromGeoip,
    };

_$_UbuntuProInfo _$_$_UbuntuProInfoFromJson(Map<String, dynamic> json) {
  return _$_UbuntuProInfo(
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$_$_UbuntuProInfoToJson(_$_UbuntuProInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

_$_UbuntuProService _$_$_UbuntuProServiceFromJson(Map<String, dynamic> json) {
  return _$_UbuntuProService(
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_UbuntuProServiceToJson(
        _$_UbuntuProService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

_$_UbuntuProCheckTokenAnswer _$_$_UbuntuProCheckTokenAnswerFromJson(
    Map<String, dynamic> json) {
  return _$_UbuntuProCheckTokenAnswer(
    status: _$enumDecode(_$UbuntuProCheckTokenStatusEnumMap, json['status']),
    services: (json['services'] as List<dynamic>?)
        ?.map((e) => UbuntuProService.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_UbuntuProCheckTokenAnswerToJson(
        _$_UbuntuProCheckTokenAnswer instance) =>
    <String, dynamic>{
      'status': _$UbuntuProCheckTokenStatusEnumMap[instance.status],
      'services': instance.services?.map((e) => e.toJson()).toList(),
    };

const _$UbuntuProCheckTokenStatusEnumMap = {
  UbuntuProCheckTokenStatus.VALID_TOKEN: 'VALID_TOKEN',
  UbuntuProCheckTokenStatus.INVALID_TOKEN: 'INVALID_TOKEN',
  UbuntuProCheckTokenStatus.EXPIRED_TOKEN: 'EXPIRED_TOKEN',
  UbuntuProCheckTokenStatus.UNKNOWN_ERROR: 'UNKNOWN_ERROR',
};

_$_WSLConfigurationBase _$_$_WSLConfigurationBaseFromJson(
    Map<String, dynamic> json) {
  return _$_WSLConfigurationBase(
    automountRoot: json['automount_root'] as String? ?? '/mnt/',
    automountOptions: json['automount_options'] as String? ?? '',
    networkGeneratehosts: json['network_generatehosts'] as bool? ?? true,
    networkGenerateresolvconf:
        json['network_generateresolvconf'] as bool? ?? true,
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
    automountEnabled: json['automount_enabled'] as bool? ?? true,
    automountMountfstab: json['automount_mountfstab'] as bool? ?? true,
    interopEnabled: json['interop_enabled'] as bool? ?? true,
    interopAppendwindowspath:
        json['interop_appendwindowspath'] as bool? ?? true,
    systemdEnabled: json['systemd_enabled'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_WSLConfigurationAdvancedToJson(
        _$_WSLConfigurationAdvanced instance) =>
    <String, dynamic>{
      'automount_enabled': instance.automountEnabled,
      'automount_mountfstab': instance.automountMountfstab,
      'interop_enabled': instance.interopEnabled,
      'interop_appendwindowspath': instance.interopAppendwindowspath,
      'systemd_enabled': instance.systemdEnabled,
    };
