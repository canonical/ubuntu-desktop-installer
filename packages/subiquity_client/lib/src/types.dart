import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

// ignore_for_file: invalid_annotation_target

// subiquity serializes `Dict[int, Any]` as `List[List[int, Any]]`
class JsonMapConverter
    implements JsonConverter<Map<int, String>, List<dynamic>> {
  const JsonMapConverter();

  @override
  Map<int, String> fromJson(List<dynamic> json) {
    return {
      for (final entry in json) entry[0] as int: entry[1] as String,
    };
  }

  @override
  List<dynamic> toJson(Map<int, String> values) {
    return [
      for (final entry in values.entries) [entry.key, entry.value],
    ];
  }
}

// subiquitycore.models.network
class NetDevInfo {
  const NetDevInfo._();
  factory NetDevInfo.fromJson(Map<String, dynamic> json) =>
      const NetDevInfo._();
  Map<String, dynamic> toJson() => {};
}

// Union[Partition, Gap]
typedef DiskObject = PartitionOrGap;

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

enum PasswordKind {
  NONE,
  KNOWN,
  UNKNOWN,
}

@freezed
class KeyFingerprint with _$KeyFingerprint {
  const factory KeyFingerprint({
    required String keytype,
    required String fingerprint,
  }) = _KeyFingerprint;

  factory KeyFingerprint.fromJson(Map<String, dynamic> json) =>
      _$KeyFingerprintFromJson(json);
}

@freezed
class LiveSessionSSHInfo with _$LiveSessionSSHInfo {
  const factory LiveSessionSSHInfo({
    required String username,
    required PasswordKind passwordKind,
    required String? password,
    required List<KeyFingerprint> authorizedKeyFingerprints,
    required List<String> ips,
    required List<KeyFingerprint> hostKeyFingerprints,
  }) = _LiveSessionSSHInfo;

  factory LiveSessionSSHInfo.fromJson(Map<String, dynamic> json) =>
      _$LiveSessionSSHInfoFromJson(json);
}

enum RefreshCheckState {
  UNKNOWN,
  AVAILABLE,
  UNAVAILABLE,
}

@freezed
class RefreshStatus with _$RefreshStatus {
  const factory RefreshStatus({
    required RefreshCheckState availability,
    @Default('') String currentSnapVersion,
    @Default('') String newSnapVersion,
  }) = _RefreshStatus;

  factory RefreshStatus.fromJson(Map<String, dynamic> json) =>
      _$RefreshStatusFromJson(json);
}

@Freezed(unionKey: '\$type', unionValueCase: FreezedUnionCase.pascal)
class AnyStep with _$AnyStep {
  @FreezedUnionValue('StepPressKey')
  @JsonMapConverter()
  const factory AnyStep.stepPressKey({
    required List<String> symbols,
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

@freezed
class ZdevInfo with _$ZdevInfo {
  const factory ZdevInfo({
    required String id,
    required String type,
    required bool on,
    required bool exists,
    required bool pers,
    required bool auto,
    required bool failed,
    required String names,
  }) = _ZdevInfo;

  factory ZdevInfo.fromJson(Map<String, dynamic> json) =>
      _$ZdevInfoFromJson(json);
}

enum WLANSupportInstallState {
  NOT_NEEDED,
  NOT_AVAILABLE,
  INSTALLING,
  FAILED,
  DONE,
}

@freezed
class NetworkStatus with _$NetworkStatus {
  const factory NetworkStatus({
    required List<NetDevInfo> devices,
    required WLANSupportInstallState wlanSupportInstallState,
  }) = _NetworkStatus;

  factory NetworkStatus.fromJson(Map<String, dynamic> json) =>
      _$NetworkStatusFromJson(json);
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
class PartitionOrGap with _$PartitionOrGap {
  @FreezedUnionValue('Partition')
  const factory PartitionOrGap.partition({
    int? size,
    int? number,
    bool? preserve,
    String? wipe,
    @Default([]) List<String> annotations,
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
  const factory PartitionOrGap.gap({
    required int offset,
    required int size,
  }) = Gap;

  factory PartitionOrGap.fromJson(Map<String, dynamic> json) =>
      _$PartitionOrGapFromJson(json);
}

@freezed
class Disk with _$Disk {
  const factory Disk({
    required String id,
    required String label,
    required String type,
    required int size,
    required List<String> usageLabels,
    required List<PartitionOrGap> partitions,
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
class AddPartitionV2 with _$AddPartitionV2 {
  const factory AddPartitionV2({
    required String diskId,
    required Partition partition,
    required Gap gap,
  }) = _AddPartitionV2;

  factory AddPartitionV2.fromJson(Map<String, dynamic> json) =>
      _$AddPartitionV2FromJson(json);
}

@freezed
class ModifyPartitionV2 with _$ModifyPartitionV2 {
  const factory ModifyPartitionV2({
    required String diskId,
    required Partition partition,
  }) = _ModifyPartitionV2;

  factory ModifyPartitionV2.fromJson(Map<String, dynamic> json) =>
      _$ModifyPartitionV2FromJson(json);
}

@freezed
class ReformatDisk with _$ReformatDisk {
  const factory ReformatDisk({
    required String diskId,
    String? ptable,
  }) = _ReformatDisk;

  factory ReformatDisk.fromJson(Map<String, dynamic> json) =>
      _$ReformatDiskFromJson(json);
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
    required bool installServer,
    required bool allowPw,
    @Default([]) List<String> authorizedKeys,
  }) = _SSHData;

  factory SSHData.fromJson(Map<String, dynamic> json) =>
      _$SSHDataFromJson(json);
}

enum SnapCheckState {
  FAILED,
  LOADING,
  DONE,
}

@freezed
class ChannelSnapInfo with _$ChannelSnapInfo {
  const factory ChannelSnapInfo({
    required String channelName,
    required String revision,
    required String confinement,
    required String version,
    required int size,
    required DateTime releasedAt,
  }) = _ChannelSnapInfo;

  factory ChannelSnapInfo.fromJson(Map<String, dynamic> json) =>
      _$ChannelSnapInfoFromJson(json);
}

@freezed
class SnapInfo with _$SnapInfo {
  const factory SnapInfo({
    required String name,
    @Default('') String summary,
    @Default('') String publisher,
    @Default(false) bool verified,
    @Default(false) bool starred,
    @Default('') String description,
    @Default('') String confinement,
    @Default('') String license,
    @Default([]) List<ChannelSnapInfo> channels,
  }) = _SnapInfo;

  factory SnapInfo.fromJson(Map<String, dynamic> json) =>
      _$SnapInfoFromJson(json);
}

@freezed
class DriversResponse with _$DriversResponse {
  const factory DriversResponse({
    required bool install,
    required List<String>? drivers,
    required bool localOnly,
    required bool searchDrivers,
  }) = _DriversResponse;

  factory DriversResponse.fromJson(Map<String, dynamic> json) =>
      _$DriversResponseFromJson(json);
}

@freezed
class DriversPayload with _$DriversPayload {
  const factory DriversPayload({
    required bool install,
  }) = _DriversPayload;

  factory DriversPayload.fromJson(Map<String, dynamic> json) =>
      _$DriversPayloadFromJson(json);
}

@freezed
class SnapSelection with _$SnapSelection {
  const factory SnapSelection({
    required String name,
    required String channel,
    @Default(false) bool classic,
  }) = _SnapSelection;

  factory SnapSelection.fromJson(Map<String, dynamic> json) =>
      _$SnapSelectionFromJson(json);
}

@freezed
class SnapListResponse with _$SnapListResponse {
  const factory SnapListResponse({
    required SnapCheckState status,
    @Default([]) List<SnapInfo> snaps,
    @Default([]) List<SnapSelection> selections,
  }) = _SnapListResponse;

  factory SnapListResponse.fromJson(Map<String, dynamic> json) =>
      _$SnapListResponseFromJson(json);
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
class UbuntuProInfo with _$UbuntuProInfo {
  const factory UbuntuProInfo({
    required String token,
  }) = _UbuntuProInfo;

  factory UbuntuProInfo.fromJson(Map<String, dynamic> json) =>
      _$UbuntuProInfoFromJson(json);
}

enum UbuntuProCheckTokenStatus {
  VALID_TOKEN,
  INVALID_TOKEN,
  EXPIRED_TOKEN,
  UNKNOWN_ERROR,
}

@freezed
class UbuntuProService with _$UbuntuProService {
  const factory UbuntuProService({
    required String name,
    required String description,
  }) = _UbuntuProService;

  factory UbuntuProService.fromJson(Map<String, dynamic> json) =>
      _$UbuntuProServiceFromJson(json);
}

@freezed
class UbuntuProCheckTokenAnswer with _$UbuntuProCheckTokenAnswer {
  const factory UbuntuProCheckTokenAnswer({
    required UbuntuProCheckTokenStatus status,
    required List<UbuntuProService>? services,
  }) = _UbuntuProCheckTokenAnswer;

  factory UbuntuProCheckTokenAnswer.fromJson(Map<String, dynamic> json) =>
      _$UbuntuProCheckTokenAnswerFromJson(json);
}

enum ShutdownMode {
  REBOOT,
  POWEROFF,
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
