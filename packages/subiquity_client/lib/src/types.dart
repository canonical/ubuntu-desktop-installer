import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

// ignore_for_file: invalid_annotation_target

enum ErrorReportState {
  INCOMPLETE,
  LOADING,
  DONE,
  ERROR_GENERATING,
  ERROR_LOADING,
}

enum ErrorReportKind {
  BLOCK_PROBE_FAIL,
  DISK_PROBE_FAIL,
  INSTALL_FAIL,
  UI,
  NETWORK_FAIL,
  NETWORK_CLIENT_FAIL,
  SERVER_REQUEST_FAIL,
  UNKNOWN,
}

@freezed
class ErrorReportRef with _$ErrorReportRef {
  const factory ErrorReportRef({
    required ErrorReportState state,
    required String base,
    required ErrorReportKind kind,
    required bool seen,
    required String? oopsId,
  }) = _ErrorReportRef;

  factory ErrorReportRef.fromJson(Map<String, dynamic> json) =>
      _$ErrorReportRefFromJson(json);
}

enum ApplicationState {
  STARTING_UP,
  CLOUD_INIT_WAIT,
  EARLY_COMMANDS,
  WAITING,
  NEEDS_CONFIRMATION,
  RUNNING,
  POST_WAIT,
  POST_RUNNING,
  UU_RUNNING,
  UU_CANCELLING,
  DONE,
  ERROR,
  EXITED,
}

@freezed
class ApplicationStatus with _$ApplicationStatus {
  const factory ApplicationStatus({
    required ApplicationState state,
    required String confirmingTty,
    required ErrorReportRef? error,
    required bool? cloudInitOk,
    required bool? interactive,
    required String echoSyslogId,
    required String logSyslogId,
    required String eventSyslogId,
  }) = _ApplicationStatus;

  factory ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStatusFromJson(json);
}

Map<int, String> _keycodesFromJson(List<dynamic> keycodes) {
  return {
    for (final keycode in keycodes) keycode[0] as int: keycode[1] as String,
  };
}

List<dynamic> _keycodesToJson(Map<int, String> keycodes) {
  return keycodes.entries.map((e) => [e.key, e.value]).toList();
}

@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class AnyStep with _$AnyStep {
  @FreezedUnionValue('StepPressKey')
  const factory AnyStep.stepPressKey({
    required List<String> symbols,
    @JsonKey(fromJson: _keycodesFromJson, toJson: _keycodesToJson)
        required Map<int, String> keycodes,
  }) = StepPressKey;

  @FreezedUnionValue('StepKeyPresent')
  const factory AnyStep.stepKeyPresent({
    required String symbol,
    required String yes,
    required String no,
  }) = StepKeyPresent;

  @FreezedUnionValue('StepResult')
  const factory AnyStep.stepResult({
    required String layout,
    required String variant,
  }) = StepResult;

  factory AnyStep.fromJson(Map<String, dynamic> json) =>
      _$AnyStepFromJson(json);
}

@freezed
class KeyboardSetting with _$KeyboardSetting {
  const factory KeyboardSetting({
    required String layout,
    @Default('') String variant,
    String? toggle,
  }) = _KeyboardSetting;

  factory KeyboardSetting.fromJson(Map<String, dynamic> json) =>
      _$KeyboardSettingFromJson(json);
}

@freezed
class KeyboardVariant with _$KeyboardVariant {
  const factory KeyboardVariant({
    required String code,
    required String name,
  }) = _KeyboardVariant;

  factory KeyboardVariant.fromJson(Map<String, dynamic> json) =>
      _$KeyboardVariantFromJson(json);
}

@freezed
class KeyboardLayout with _$KeyboardLayout {
  const factory KeyboardLayout({
    required String code,
    required String name,
    required List<KeyboardVariant> variants,
  }) = _KeyboardLayout;

  factory KeyboardLayout.fromJson(Map<String, dynamic> json) =>
      _$KeyboardLayoutFromJson(json);
}

@freezed
class KeyboardSetup with _$KeyboardSetup {
  const factory KeyboardSetup({
    required KeyboardSetting setting,
    required List<KeyboardLayout> layouts,
  }) = _KeyboardSetup;

  factory KeyboardSetup.fromJson(Map<String, dynamic> json) =>
      _$KeyboardSetupFromJson(json);
}

@freezed
class SourceSelection with _$SourceSelection {
  const factory SourceSelection({
    required String name,
    required String description,
    required String id,
    required int size,
    required String variant,
    @JsonKey(name: 'default') required bool isDefault,
  }) = _SourceSelection;

  factory SourceSelection.fromJson(Map<String, dynamic> json) =>
      _$SourceSelectionFromJson(json);
}

@freezed
class SourceSelectionAndSetting with _$SourceSelectionAndSetting {
  const factory SourceSelectionAndSetting({
    required List<SourceSelection> sources,
    required String currentId,
    required bool searchDrivers,
  }) = _SourceSelectionAndSetting;

  factory SourceSelectionAndSetting.fromJson(Map<String, dynamic> json) =>
      _$SourceSelectionAndSettingFromJson(json);
}

enum ProbeStatus {
  PROBING,
  FAILED,
  DONE,
}

enum Bootloader {
  NONE,
  BIOS,
  UEFI,
  PREP,
}

@freezed
class OsProber with _$OsProber {
  const factory OsProber({
    required String long,
    required String label,
    required String type,
    String? subpath,
    String? version,
  }) = _OsProber;

  factory OsProber.fromJson(Map<String, dynamic> json) =>
      _$OsProberFromJson(json);
}

@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class DiskObject with _$DiskObject {
  @FreezedUnionValue('Partition')
  const factory DiskObject.partition({
    int? size,
    int? number,
    bool? preserve,
    String? wipe,
    @Default([]) List<String>? annotations,
    String? mount,
    String? format,
    bool? grubDevice,
    bool? boot,
    OsProber? os,
    int? offset,
    bool? resize,
    String? path,
  }) = Partition;

  @FreezedUnionValue('Gap')
  const factory DiskObject.gap({
    required int offset,
    required int size,
  }) = Gap;

  factory DiskObject.fromJson(Map<String, dynamic> json) =>
      _$DiskObjectFromJson(json);
}

@freezed
class Disk with _$Disk {
  const factory Disk({
    required String id,
    required String label,
    required String type,
    required int size,
    required List<String> usageLabels,
    required List<DiskObject> partitions,
    required bool okForGuided,
    required String? ptable,
    required bool preserve,
    required String? path,
    required bool bootDevice,
    String? model,
    String? vendor,
  }) = _Disk;

  factory Disk.fromJson(Map<String, dynamic> json) => _$DiskFromJson(json);
}

@freezed
class GuidedChoice with _$GuidedChoice {
  const factory GuidedChoice({
    required String diskId,
    @Default(false) bool useLvm,
    String? password,
  }) = _GuidedChoice;

  factory GuidedChoice.fromJson(Map<String, dynamic> json) =>
      _$GuidedChoiceFromJson(json);
}

@freezed
class GuidedStorageResponse with _$GuidedStorageResponse {
  const factory GuidedStorageResponse({
    required ProbeStatus status,
    ErrorReportRef? errorReport,
    List<Disk>? disks,
  }) = _GuidedStorageResponse;

  factory GuidedStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$GuidedStorageResponseFromJson(json);
}

@freezed
class StorageResponse with _$StorageResponse {
  const factory StorageResponse({
    required ProbeStatus status,
    ErrorReportRef? errorReport,
    Bootloader? bootloader,
    List<dynamic>? origConfig,
    List<dynamic>? config,
    Map<String, dynamic>? blockdev,
    Map<String, dynamic>? dasd,
    @Default(1) int storageVersion,
  }) = _StorageResponse;

  factory StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseFromJson(json);
}

@freezed
class StorageResponseV2 with _$StorageResponseV2 {
  const factory StorageResponseV2({
    required List<Disk> disks,
    required bool needRoot,
    required bool needBoot,
    ErrorReportRef? errorReport,
  }) = _StorageResponseV2;

  factory StorageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseV2FromJson(json);
}

@freezed
class IdentityData with _$IdentityData {
  const factory IdentityData({
    @Default('') String realname,
    @Default('') String username,
    @Default('') String cryptedPassword,
    @Default('') String hostname,
  }) = _IdentityData;

  factory IdentityData.fromJson(Map<String, dynamic> json) =>
      _$IdentityDataFromJson(json);
}

enum UsernameValidation {
  OK,
  ALREADY_IN_USE,
  SYSTEM_RESERVED,
  INVALID_CHARS,
  TOO_LONG,
}

@freezed
class SSHData with _$SSHData {
  const factory SSHData({
    bool? installServer,
    bool? allowPw,
    List<dynamic>? authorizedKeys,
  }) = _SSHData;

  factory SSHData.fromJson(Map<String, dynamic> json) =>
      _$SSHDataFromJson(json);
}

@freezed
class TimeZoneInfo with _$TimeZoneInfo {
  const factory TimeZoneInfo({
    required String timezone,
    required bool fromGeoip,
  }) = _TimeZoneInfo;

  factory TimeZoneInfo.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneInfoFromJson(json);
}

@freezed
class WSLConfigurationBase with _$WSLConfigurationBase {
  const factory WSLConfigurationBase({
    @Default('/mnt/') String automountRoot,
    @Default('') String automountOptions,
    @Default(true) bool networkGeneratehosts,
    @Default(true) bool networkGenerateresolvconf,
  }) = _WSLConfigurationBase;

  factory WSLConfigurationBase.fromJson(Map<String, dynamic> json) =>
      _$WSLConfigurationBaseFromJson(json);
}

@freezed
class WSLConfigurationAdvanced with _$WSLConfigurationAdvanced {
  const factory WSLConfigurationAdvanced({
    @Default(true) bool automountEnabled,
    @Default(true) bool automountMountfstab,
    @Default(true) bool interopEnabled,
    @Default(true) bool interopAppendwindowspath,
    @Default(false) bool systemdEnabled,
  }) = _WSLConfigurationAdvanced;

  factory WSLConfigurationAdvanced.fromJson(Map<String, dynamic> json) =>
      _$WSLConfigurationAdvancedFromJson(json);
}
