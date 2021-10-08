import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

// ignore_for_file: invalid_annotation_target

enum Variant { SERVER, DESKTOP, WSL_SETUP, WSL_CONFIGURATION }

@freezed
class SourceSelection with _$SourceSelection {
  const factory SourceSelection({
    String? name,
    String? description,
    String? id,
    int? size,
    String? variant,
    @JsonKey(name: 'default') bool? isDefault,
  }) = _SourceSelection;

  factory SourceSelection.fromJson(Map<String, dynamic> json) =>
      _$SourceSelectionFromJson(json);
}

@freezed
class SourceSelectionAndSetting with _$SourceSelectionAndSetting {
  const factory SourceSelectionAndSetting({
    List<SourceSelection>? sources,
    @JsonKey(name: 'current_id') String? currentId,
  }) = _SourceSelectionAndSetting;

  factory SourceSelectionAndSetting.fromJson(Map<String, dynamic> json) =>
      _$SourceSelectionAndSettingFromJson(json);
}

@freezed
class KeyboardSetting with _$KeyboardSetting {
  const factory KeyboardSetting({
    String? layout,
    String? variant,
    String? toggle,
  }) = _KeyboardSetting;

  factory KeyboardSetting.fromJson(Map<String, dynamic> json) =>
      _$KeyboardSettingFromJson(json);
}

@freezed
class KeyboardVariant with _$KeyboardVariant {
  const factory KeyboardVariant({
    String? code,
    String? name,
  }) = _KeyboardVariant;

  factory KeyboardVariant.fromJson(Map<String, dynamic> json) =>
      _$KeyboardVariantFromJson(json);
}

@freezed
class KeyboardLayout with _$KeyboardLayout {
  const factory KeyboardLayout({
    String? code,
    String? name,
    List<KeyboardVariant>? variants,
  }) = _KeyboardLayout;

  factory KeyboardLayout.fromJson(Map<String, dynamic> json) =>
      _$KeyboardLayoutFromJson(json);
}

@freezed
class KeyboardSetup with _$KeyboardSetup {
  const factory KeyboardSetup({
    KeyboardSetting? setting,
    List<KeyboardLayout>? layouts,
  }) = _KeyboardSetup;

  factory KeyboardSetup.fromJson(Map<String, dynamic> json) =>
      _$KeyboardSetupFromJson(json);
}

@freezed
class IdentityData with _$IdentityData {
  const factory IdentityData({
    @Default('') String? realname,
    @Default('') String? username,
    @Default('') @JsonKey(name: 'crypted_password') String? cryptedPassword,
    @Default('') String? hostname,
  }) = _IdentityData;

  factory IdentityData.fromJson(Map<String, dynamic> json) =>
      _$IdentityDataFromJson(json);
}

@freezed
class TimezoneData with _$TimezoneData {
  const factory TimezoneData({
    String? timezone,
    @JsonKey(name: 'from_geoip') bool? fromGeoIP,
  }) = _TimezoneData;

  factory TimezoneData.fromJson(Map<String, dynamic> json) =>
      _$TimezoneDataFromJson(json);
}

@freezed
class SSHData with _$SSHData {
  const factory SSHData({
    @JsonKey(name: 'install_server') bool? installServer,
    @JsonKey(name: 'allow_pw') bool? allowPw,
    @JsonKey(name: 'authorized_keys') List<dynamic>? authorizedKeys,
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
class ErrorReportRef with _$ErrorReportRef {
  const factory ErrorReportRef({
    ErrorReportState? state,
    String? base,
    ErrorReportKind? kind,
    bool? seen,
    @JsonKey(name: 'oops_id') String? oopsId,
  }) = _ErrorReportRef;

  factory ErrorReportRef.fromJson(Map<String, dynamic> json) =>
      _$ErrorReportRefFromJson(json);
}

@freezed
class ApplicationStatus with _$ApplicationStatus {
  @JsonSerializable(explicitToJson: true)
  const factory ApplicationStatus({
    ApplicationState? state,
    @JsonKey(name: 'confirming_tty') String? confirmingTty,
    ErrorReportRef? error,
    @JsonKey(name: 'cloud_init_ok') bool? cloudInitOk,
    bool? interactive,
    @JsonKey(name: 'echo_syslog_id') String? echoSyslogId,
    @JsonKey(name: 'log_syslog_id') String? logSyslogId,
    @JsonKey(name: 'event_syslog_id') String? eventSyslogId,
  }) = _ApplicationStatus;

  factory ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStatusFromJson(json);
}

enum ProbeStatus { PROBING, FAILED, DONE }

enum Bootloader { NONE, BIOS, UEFI, PREP }

bool? _wipeFromString(String? value) =>
    value == null ? null : value == 'superblock';
String? _wipeToString(bool? value) =>
    value != null && value == true ? 'superblock' : null;

@freezed
class Partition with _$Partition {
  const factory Partition({
    int? size,
    int? number,
    @JsonKey(fromJson: _wipeFromString, toJson: _wipeToString) bool? wipe,
    bool? preserve,
    @Default([]) List<String>? annotations,
    String? mount,
    String? format,
    @JsonKey(name: 'grub_device') bool? grubDevice,
  }) = _Partition;

  factory Partition.fromJson(Map<String, dynamic> json) =>
      _$PartitionFromJson(json);
}

@freezed
class Disk with _$Disk {
  const factory Disk({
    String? id,
    String? label,
    String? path,
    String? type,
    int? size,
    @JsonKey(name: 'usage_labels') List<String>? usageLabels,
    List<Partition>? partitions,
    @JsonKey(name: 'free_for_partitions') int? freeForPartitions,
    @JsonKey(name: 'ok_for_guided') bool? okForGuided,
    String? ptable,
    bool? preserve,
    @JsonKey(name: 'grub_device') bool? grubDevice,
  }) = _Disk;

  factory Disk.fromJson(Map<String, dynamic> json) => _$DiskFromJson(json);
}

@freezed
class GuidedChoice with _$GuidedChoice {
  const factory GuidedChoice({
    @JsonKey(name: 'disk_id') String? diskId,
    @JsonKey(name: 'use_lvm') bool? useLvm,
    String? password,
  }) = _GuidedChoice;

  factory GuidedChoice.fromJson(Map<String, dynamic> json) =>
      _$GuidedChoiceFromJson(json);
}

@freezed
class GuidedStorageResponse with _$GuidedStorageResponse {
  const factory GuidedStorageResponse({
    ProbeStatus? status,
    @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
    List<Disk>? disks,
  }) = _GuidedStorageResponse;

  factory GuidedStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$GuidedStorageResponseFromJson(json);
}

@freezed
class StorageResponse with _$StorageResponse {
  const factory StorageResponse({
    ProbeStatus? status,
    @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
    Bootloader? bootloader,
    @JsonKey(name: 'orig_config') List<dynamic>? origConfig,
    List<dynamic>? config,
    Map<String, dynamic>? blockdev,
    Map<String, dynamic>? dasd,
  }) = _StorageResponse;

  factory StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseFromJson(json);
}

@freezed
class StorageResponseV2 with _$StorageResponseV2 {
  const factory StorageResponseV2({
    List<Disk>? disks,
    @JsonKey(name: 'need_root') bool? needRoot,
    @JsonKey(name: 'need_boot') bool? needBoot,
    @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
  }) = _StorageResponseV2;

  factory StorageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseV2FromJson(json);
}

@freezed
class WSLConfigurationBase with _$WSLConfigurationBase {
  const factory WSLConfigurationBase({
    @JsonKey(name: 'automount_root') String? automountRoot,
    @JsonKey(name: 'automount_options') String? automountOptions,
    @JsonKey(name: 'network_generatehosts') bool? networkGeneratehosts,
    @JsonKey(name: 'network_generateresolvconf')
        bool? networkGenerateresolvconf,
  }) = _WSLConfigurationBase;

  factory WSLConfigurationBase.fromJson(Map<String, dynamic> json) =>
      _$WSLConfigurationBaseFromJson(json);
}

@freezed
class WSLConfigurationAdvanced with _$WSLConfigurationAdvanced {
  const factory WSLConfigurationAdvanced({
    @JsonKey(name: 'gui_theme') String? guiTheme,
    @JsonKey(name: 'gui_followwintheme') bool? guiFollowwintheme,
    @JsonKey(name: 'interop_guiintegration') bool? interopGuiintegration,
    @JsonKey(name: 'interop_audiointegration') bool? interopAudiointegration,
    @JsonKey(name: 'interop_advancedipdetection')
        bool? interopAdvancedipdetection,
    @JsonKey(name: 'motd_wslnewsenabled') bool? motdWSLnewsenabled,
    @JsonKey(name: 'automount_enabled') bool? automountEnabled,
    @JsonKey(name: 'automount_mountfstab') bool? automountMountfstab,
    @JsonKey(name: 'interop_enabled') bool? interopEnabled,
    @JsonKey(name: 'interop_appendwindowspath') bool? interopAppendwindowspath,
  }) = _WSLConfigurationAdvanced;

  factory WSLConfigurationAdvanced.fromJson(Map<String, dynamic> json) =>
      _$WSLConfigurationAdvancedFromJson(json);
}

@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class KeyboardStep with _$KeyboardStep {
  @FreezedUnionValue('StepPressKey')
  const factory KeyboardStep.pressKey({
    List<String>? symbols,
    List<List<dynamic>>? keycodes,
  }) = StepPressKey;

  @FreezedUnionValue('StepKeyPresent')
  const factory KeyboardStep.keyPresent({
    String? symbol,
    String? yes,
    String? no,
  }) = StepKeyPresent;

  @FreezedUnionValue('StepResult')
  const factory KeyboardStep.result({
    String? layout,
    String? variant,
  }) = StepResult;

  factory KeyboardStep.fromJson(Map<String, dynamic> json) =>
      _$KeyboardStepFromJson(json);
}
