import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

// ignore_for_file: invalid_annotation_target

enum Variant { SERVER, DESKTOP, WSL_SETUP, WSL_CONFIGURATION }

extension VariantString on Variant {
  static Variant fromString(String value) {
    return Variant.values.firstWhere((v) => value == v.toVariantString());
  }

  String toVariantString() => name.toLowerCase();
}

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
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SourceSelectionAndSetting({
    List<SourceSelection>? sources,
    String? currentId,
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
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory IdentityData({
    @Default('') String? realname,
    @Default('') String? username,
    @Default('') String? cryptedPassword,
    @Default('') String? hostname,
  }) = _IdentityData;

  factory IdentityData.fromJson(Map<String, dynamic> json) =>
      _$IdentityDataFromJson(json);
}

@freezed
class TimezoneData with _$TimezoneData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TimezoneData({
    String? timezone,
    bool? fromGeoip,
  }) = _TimezoneData;

  factory TimezoneData.fromJson(Map<String, dynamic> json) =>
      _$TimezoneDataFromJson(json);
}

@freezed
class SSHData with _$SSHData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SSHData({
    bool? installServer,
    bool? allowPw,
    List<dynamic>? authorizedKeys,
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
  @JsonSerializable(fieldRename: FieldRename.snake)
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

enum ProbeStatus { PROBING, FAILED, DONE }

enum Bootloader { NONE, BIOS, UEFI, PREP }

@freezed
class OsProber with _$OsProber {
  @JsonSerializable(fieldRename: FieldRename.snake)
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

bool? _wipeFromString(String? value) =>
    value == null ? null : value == 'superblock';
String? _wipeToString(bool? value) =>
    value != null && value == true ? 'superblock' : null;

@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class DiskObject with _$DiskObject {
  @FreezedUnionValue('Partition')
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DiskObject.partition({
    int? offset,
    int? size,
    int? number,
    @JsonKey(fromJson: _wipeFromString, toJson: _wipeToString) bool? wipe,
    bool? preserve,
    @Default([]) List<String>? annotations,
    String? mount,
    String? format,
    bool? grubDevice,
    OsProber? os,
  }) = Partition;

  @FreezedUnionValue('Gap')
  const factory DiskObject.gap({
    int? offset,
    int? size,
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
    int? freeForPartitions,
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
  @JsonSerializable(fieldRename: FieldRename.snake)
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
  @JsonSerializable(fieldRename: FieldRename.snake)
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
  @JsonSerializable(fieldRename: FieldRename.snake)
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
  @JsonSerializable(fieldRename: FieldRename.snake)
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
class WSLConfigurationBase with _$WSLConfigurationBase {
  @JsonSerializable(fieldRename: FieldRename.snake)
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
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WSLConfigurationAdvanced({
    String? guiTheme,
    bool? guiFollowwintheme,
    bool? interopGuiintegration,
    bool? interopAudiointegration,
    bool? interopAdvancedipdetection,
    bool? motdWslnewsenabled,
    bool? automountEnabled,
    bool? automountMountfstab,
    bool? interopEnabled,
    bool? interopAppendwindowspath,
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
