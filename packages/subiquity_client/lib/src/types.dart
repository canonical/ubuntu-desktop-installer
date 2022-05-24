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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ErrorReportRef({
    ErrorReportState? state,
    String? base,
    ErrorReportKind? kind,
    bool? seen,
    String? oopsId,
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ApplicationStatus({
    ApplicationState? state,
    String? confirmingTty,
    ErrorReportRef? error,
    bool? cloudInitOk,
    bool? interactive,
    String? echoSyslogId,
    String? logSyslogId,
    String? eventSyslogId,
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory AnyStep.stepPressKey({
    required List<String> symbols,
    @JsonKey(fromJson: _keycodesFromJson, toJson: _keycodesToJson)
        required Map<int, String> keycodes,
  }) = StepPressKey;

  @FreezedUnionValue('StepKeyPresent')
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory AnyStep.stepKeyPresent({
    required String symbol,
    required String yes,
    required String no,
  }) = StepKeyPresent;

  @FreezedUnionValue('StepResult')
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory AnyStep.stepResult({
    required String layout,
    required String variant,
  }) = StepResult;

  factory AnyStep.fromJson(Map<String, dynamic> json) =>
      _$AnyStepFromJson(json);
}

@freezed
class KeyboardSetting with _$KeyboardSetting {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory KeyboardVariant({
    required String code,
    required String name,
  }) = _KeyboardVariant;

  factory KeyboardVariant.fromJson(Map<String, dynamic> json) =>
      _$KeyboardVariantFromJson(json);
}

@freezed
class KeyboardLayout with _$KeyboardLayout {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory KeyboardSetup({
    required KeyboardSetting setting,
    required List<KeyboardLayout> layouts,
  }) = _KeyboardSetup;

  factory KeyboardSetup.fromJson(Map<String, dynamic> json) =>
      _$KeyboardSetupFromJson(json);
}

@freezed
class SourceSelection with _$SourceSelection {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DiskObject.gap({
    required int offset,
    required int size,
  }) = Gap;

  factory DiskObject.fromJson(Map<String, dynamic> json) =>
      _$DiskObjectFromJson(json);
}

@freezed
class Disk with _$Disk {
  const Disk._();

  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Disk({
    String? id,
    String? label,
    String? path,
    String? type,
    int? size,
    List<String>? usageLabels,
    @JsonKey(name: 'partitions') List<DiskObject>? objects,
    bool? okForGuided,
    String? ptable,
    bool? preserve,
    bool? bootDevice,
    String? model,
    String? vendor,
  }) = _Disk;

  List<Partition>? get partitions => objects?.whereType<Partition>().toList();

  factory Disk.fromJson(Map<String, dynamic> json) => _$DiskFromJson(json);
}

@freezed
class GuidedChoice with _$GuidedChoice {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory GuidedChoice({
    String? diskId,
    bool? useLvm,
    String? password,
  }) = _GuidedChoice;

  factory GuidedChoice.fromJson(Map<String, dynamic> json) =>
      _$GuidedChoiceFromJson(json);
}

@freezed
class GuidedStorageResponse with _$GuidedStorageResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory GuidedStorageResponse({
    ProbeStatus? status,
    ErrorReportRef? errorReport,
    List<Disk>? disks,
  }) = _GuidedStorageResponse;

  factory GuidedStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$GuidedStorageResponseFromJson(json);
}

@freezed
class StorageResponse with _$StorageResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory StorageResponse({
    ProbeStatus? status,
    ErrorReportRef? errorReport,
    Bootloader? bootloader,
    List<dynamic>? origConfig,
    List<dynamic>? config,
    Map<String, dynamic>? blockdev,
    Map<String, dynamic>? dasd,
  }) = _StorageResponse;

  factory StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseFromJson(json);
}

@freezed
class StorageResponseV2 with _$StorageResponseV2 {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory StorageResponseV2({
    List<Disk>? disks,
    bool? needRoot,
    bool? needBoot,
    ErrorReportRef? errorReport,
  }) = _StorageResponseV2;

  factory StorageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$StorageResponseV2FromJson(json);
}

@freezed
class IdentityData with _$IdentityData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SSHData({
    bool? installServer,
    bool? allowPw,
    List<dynamic>? authorizedKeys,
  }) = _SSHData;

  factory SSHData.fromJson(Map<String, dynamic> json) =>
      _$SSHDataFromJson(json);
}

@freezed
class TimezoneInfo with _$TimezoneInfo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory TimezoneInfo({
    String? timezone,
    bool? fromGeoip,
  }) = _TimezoneInfo;

  factory TimezoneInfo.fromJson(Map<String, dynamic> json) =>
      _$TimezoneInfoFromJson(json);
}

@freezed
class WSLConfigurationBase with _$WSLConfigurationBase {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WSLConfigurationBase({
    String? automountRoot,
    String? automountOptions,
    bool? networkGeneratehosts,
    bool? networkGenerateresolvconf,
  }) = _WSLConfigurationBase;

  factory WSLConfigurationBase.fromJson(Map<String, dynamic> json) =>
      _$WSLConfigurationBaseFromJson(json);
}

@freezed
class WSLConfigurationAdvanced with _$WSLConfigurationAdvanced {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WSLConfigurationAdvanced({
    bool? automountEnabled,
    bool? automountMountfstab,
    bool? interopEnabled,
    bool? interopAppendwindowspath,
    bool? systemdEnabled,
  }) = _WSLConfigurationAdvanced;

  factory WSLConfigurationAdvanced.fromJson(Map<String, dynamic> json) =>
      _$WSLConfigurationAdvancedFromJson(json);
}
