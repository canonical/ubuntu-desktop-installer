// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorReportRef _$ErrorReportRefFromJson(Map<String, dynamic> json) {
  return _ErrorReportRef.fromJson(json);
}

/// @nodoc
class _$ErrorReportRefTearOff {
  const _$ErrorReportRefTearOff();

  _ErrorReportRef call(
      {required ErrorReportState state,
      required String base,
      required ErrorReportKind kind,
      required bool seen,
      required String? oopsId}) {
    return _ErrorReportRef(
      state: state,
      base: base,
      kind: kind,
      seen: seen,
      oopsId: oopsId,
    );
  }

  ErrorReportRef fromJson(Map<String, Object> json) {
    return ErrorReportRef.fromJson(json);
  }
}

/// @nodoc
const $ErrorReportRef = _$ErrorReportRefTearOff();

/// @nodoc
mixin _$ErrorReportRef {
  ErrorReportState get state => throw _privateConstructorUsedError;
  String get base => throw _privateConstructorUsedError;
  ErrorReportKind get kind => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;
  String? get oopsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorReportRefCopyWith<ErrorReportRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorReportRefCopyWith<$Res> {
  factory $ErrorReportRefCopyWith(
          ErrorReportRef value, $Res Function(ErrorReportRef) then) =
      _$ErrorReportRefCopyWithImpl<$Res>;
  $Res call(
      {ErrorReportState state,
      String base,
      ErrorReportKind kind,
      bool seen,
      String? oopsId});
}

/// @nodoc
class _$ErrorReportRefCopyWithImpl<$Res>
    implements $ErrorReportRefCopyWith<$Res> {
  _$ErrorReportRefCopyWithImpl(this._value, this._then);

  final ErrorReportRef _value;
  // ignore: unused_field
  final $Res Function(ErrorReportRef) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? base = freezed,
    Object? kind = freezed,
    Object? seen = freezed,
    Object? oopsId = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ErrorReportState,
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as ErrorReportKind,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      oopsId: oopsId == freezed
          ? _value.oopsId
          : oopsId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ErrorReportRefCopyWith<$Res>
    implements $ErrorReportRefCopyWith<$Res> {
  factory _$ErrorReportRefCopyWith(
          _ErrorReportRef value, $Res Function(_ErrorReportRef) then) =
      __$ErrorReportRefCopyWithImpl<$Res>;
  @override
  $Res call(
      {ErrorReportState state,
      String base,
      ErrorReportKind kind,
      bool seen,
      String? oopsId});
}

/// @nodoc
class __$ErrorReportRefCopyWithImpl<$Res>
    extends _$ErrorReportRefCopyWithImpl<$Res>
    implements _$ErrorReportRefCopyWith<$Res> {
  __$ErrorReportRefCopyWithImpl(
      _ErrorReportRef _value, $Res Function(_ErrorReportRef) _then)
      : super(_value, (v) => _then(v as _ErrorReportRef));

  @override
  _ErrorReportRef get _value => super._value as _ErrorReportRef;

  @override
  $Res call({
    Object? state = freezed,
    Object? base = freezed,
    Object? kind = freezed,
    Object? seen = freezed,
    Object? oopsId = freezed,
  }) {
    return _then(_ErrorReportRef(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ErrorReportState,
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as ErrorReportKind,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      oopsId: oopsId == freezed
          ? _value.oopsId
          : oopsId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorReportRef implements _ErrorReportRef {
  const _$_ErrorReportRef(
      {required this.state,
      required this.base,
      required this.kind,
      required this.seen,
      required this.oopsId});

  factory _$_ErrorReportRef.fromJson(Map<String, dynamic> json) =>
      _$_$_ErrorReportRefFromJson(json);

  @override
  final ErrorReportState state;
  @override
  final String base;
  @override
  final ErrorReportKind kind;
  @override
  final bool seen;
  @override
  final String? oopsId;

  @override
  String toString() {
    return 'ErrorReportRef(state: $state, base: $base, kind: $kind, seen: $seen, oopsId: $oopsId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorReportRef &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.seen, seen) ||
                const DeepCollectionEquality().equals(other.seen, seen)) &&
            (identical(other.oopsId, oopsId) ||
                const DeepCollectionEquality().equals(other.oopsId, oopsId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(seen) ^
      const DeepCollectionEquality().hash(oopsId);

  @JsonKey(ignore: true)
  @override
  _$ErrorReportRefCopyWith<_ErrorReportRef> get copyWith =>
      __$ErrorReportRefCopyWithImpl<_ErrorReportRef>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ErrorReportRefToJson(this);
  }
}

abstract class _ErrorReportRef implements ErrorReportRef {
  const factory _ErrorReportRef(
      {required ErrorReportState state,
      required String base,
      required ErrorReportKind kind,
      required bool seen,
      required String? oopsId}) = _$_ErrorReportRef;

  factory _ErrorReportRef.fromJson(Map<String, dynamic> json) =
      _$_ErrorReportRef.fromJson;

  @override
  ErrorReportState get state => throw _privateConstructorUsedError;
  @override
  String get base => throw _privateConstructorUsedError;
  @override
  ErrorReportKind get kind => throw _privateConstructorUsedError;
  @override
  bool get seen => throw _privateConstructorUsedError;
  @override
  String? get oopsId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorReportRefCopyWith<_ErrorReportRef> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationStatus _$ApplicationStatusFromJson(Map<String, dynamic> json) {
  return _ApplicationStatus.fromJson(json);
}

/// @nodoc
class _$ApplicationStatusTearOff {
  const _$ApplicationStatusTearOff();

  _ApplicationStatus call(
      {required ApplicationState state,
      required String confirmingTty,
      required ErrorReportRef? error,
      required bool? cloudInitOk,
      required bool? interactive,
      required String echoSyslogId,
      required String logSyslogId,
      required String eventSyslogId}) {
    return _ApplicationStatus(
      state: state,
      confirmingTty: confirmingTty,
      error: error,
      cloudInitOk: cloudInitOk,
      interactive: interactive,
      echoSyslogId: echoSyslogId,
      logSyslogId: logSyslogId,
      eventSyslogId: eventSyslogId,
    );
  }

  ApplicationStatus fromJson(Map<String, Object> json) {
    return ApplicationStatus.fromJson(json);
  }
}

/// @nodoc
const $ApplicationStatus = _$ApplicationStatusTearOff();

/// @nodoc
mixin _$ApplicationStatus {
  ApplicationState get state => throw _privateConstructorUsedError;
  String get confirmingTty => throw _privateConstructorUsedError;
  ErrorReportRef? get error => throw _privateConstructorUsedError;
  bool? get cloudInitOk => throw _privateConstructorUsedError;
  bool? get interactive => throw _privateConstructorUsedError;
  String get echoSyslogId => throw _privateConstructorUsedError;
  String get logSyslogId => throw _privateConstructorUsedError;
  String get eventSyslogId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationStatusCopyWith<ApplicationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStatusCopyWith<$Res> {
  factory $ApplicationStatusCopyWith(
          ApplicationStatus value, $Res Function(ApplicationStatus) then) =
      _$ApplicationStatusCopyWithImpl<$Res>;
  $Res call(
      {ApplicationState state,
      String confirmingTty,
      ErrorReportRef? error,
      bool? cloudInitOk,
      bool? interactive,
      String echoSyslogId,
      String logSyslogId,
      String eventSyslogId});

  $ErrorReportRefCopyWith<$Res>? get error;
}

/// @nodoc
class _$ApplicationStatusCopyWithImpl<$Res>
    implements $ApplicationStatusCopyWith<$Res> {
  _$ApplicationStatusCopyWithImpl(this._value, this._then);

  final ApplicationStatus _value;
  // ignore: unused_field
  final $Res Function(ApplicationStatus) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? confirmingTty = freezed,
    Object? error = freezed,
    Object? cloudInitOk = freezed,
    Object? interactive = freezed,
    Object? echoSyslogId = freezed,
    Object? logSyslogId = freezed,
    Object? eventSyslogId = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ApplicationState,
      confirmingTty: confirmingTty == freezed
          ? _value.confirmingTty
          : confirmingTty // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      cloudInitOk: cloudInitOk == freezed
          ? _value.cloudInitOk
          : cloudInitOk // ignore: cast_nullable_to_non_nullable
              as bool?,
      interactive: interactive == freezed
          ? _value.interactive
          : interactive // ignore: cast_nullable_to_non_nullable
              as bool?,
      echoSyslogId: echoSyslogId == freezed
          ? _value.echoSyslogId
          : echoSyslogId // ignore: cast_nullable_to_non_nullable
              as String,
      logSyslogId: logSyslogId == freezed
          ? _value.logSyslogId
          : logSyslogId // ignore: cast_nullable_to_non_nullable
              as String,
      eventSyslogId: eventSyslogId == freezed
          ? _value.eventSyslogId
          : eventSyslogId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ErrorReportRefCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorReportRefCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
abstract class _$ApplicationStatusCopyWith<$Res>
    implements $ApplicationStatusCopyWith<$Res> {
  factory _$ApplicationStatusCopyWith(
          _ApplicationStatus value, $Res Function(_ApplicationStatus) then) =
      __$ApplicationStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {ApplicationState state,
      String confirmingTty,
      ErrorReportRef? error,
      bool? cloudInitOk,
      bool? interactive,
      String echoSyslogId,
      String logSyslogId,
      String eventSyslogId});

  @override
  $ErrorReportRefCopyWith<$Res>? get error;
}

/// @nodoc
class __$ApplicationStatusCopyWithImpl<$Res>
    extends _$ApplicationStatusCopyWithImpl<$Res>
    implements _$ApplicationStatusCopyWith<$Res> {
  __$ApplicationStatusCopyWithImpl(
      _ApplicationStatus _value, $Res Function(_ApplicationStatus) _then)
      : super(_value, (v) => _then(v as _ApplicationStatus));

  @override
  _ApplicationStatus get _value => super._value as _ApplicationStatus;

  @override
  $Res call({
    Object? state = freezed,
    Object? confirmingTty = freezed,
    Object? error = freezed,
    Object? cloudInitOk = freezed,
    Object? interactive = freezed,
    Object? echoSyslogId = freezed,
    Object? logSyslogId = freezed,
    Object? eventSyslogId = freezed,
  }) {
    return _then(_ApplicationStatus(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ApplicationState,
      confirmingTty: confirmingTty == freezed
          ? _value.confirmingTty
          : confirmingTty // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      cloudInitOk: cloudInitOk == freezed
          ? _value.cloudInitOk
          : cloudInitOk // ignore: cast_nullable_to_non_nullable
              as bool?,
      interactive: interactive == freezed
          ? _value.interactive
          : interactive // ignore: cast_nullable_to_non_nullable
              as bool?,
      echoSyslogId: echoSyslogId == freezed
          ? _value.echoSyslogId
          : echoSyslogId // ignore: cast_nullable_to_non_nullable
              as String,
      logSyslogId: logSyslogId == freezed
          ? _value.logSyslogId
          : logSyslogId // ignore: cast_nullable_to_non_nullable
              as String,
      eventSyslogId: eventSyslogId == freezed
          ? _value.eventSyslogId
          : eventSyslogId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationStatus implements _ApplicationStatus {
  const _$_ApplicationStatus(
      {required this.state,
      required this.confirmingTty,
      required this.error,
      required this.cloudInitOk,
      required this.interactive,
      required this.echoSyslogId,
      required this.logSyslogId,
      required this.eventSyslogId});

  factory _$_ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      _$_$_ApplicationStatusFromJson(json);

  @override
  final ApplicationState state;
  @override
  final String confirmingTty;
  @override
  final ErrorReportRef? error;
  @override
  final bool? cloudInitOk;
  @override
  final bool? interactive;
  @override
  final String echoSyslogId;
  @override
  final String logSyslogId;
  @override
  final String eventSyslogId;

  @override
  String toString() {
    return 'ApplicationStatus(state: $state, confirmingTty: $confirmingTty, error: $error, cloudInitOk: $cloudInitOk, interactive: $interactive, echoSyslogId: $echoSyslogId, logSyslogId: $logSyslogId, eventSyslogId: $eventSyslogId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApplicationStatus &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.confirmingTty, confirmingTty) ||
                const DeepCollectionEquality()
                    .equals(other.confirmingTty, confirmingTty)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.cloudInitOk, cloudInitOk) ||
                const DeepCollectionEquality()
                    .equals(other.cloudInitOk, cloudInitOk)) &&
            (identical(other.interactive, interactive) ||
                const DeepCollectionEquality()
                    .equals(other.interactive, interactive)) &&
            (identical(other.echoSyslogId, echoSyslogId) ||
                const DeepCollectionEquality()
                    .equals(other.echoSyslogId, echoSyslogId)) &&
            (identical(other.logSyslogId, logSyslogId) ||
                const DeepCollectionEquality()
                    .equals(other.logSyslogId, logSyslogId)) &&
            (identical(other.eventSyslogId, eventSyslogId) ||
                const DeepCollectionEquality()
                    .equals(other.eventSyslogId, eventSyslogId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(confirmingTty) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(cloudInitOk) ^
      const DeepCollectionEquality().hash(interactive) ^
      const DeepCollectionEquality().hash(echoSyslogId) ^
      const DeepCollectionEquality().hash(logSyslogId) ^
      const DeepCollectionEquality().hash(eventSyslogId);

  @JsonKey(ignore: true)
  @override
  _$ApplicationStatusCopyWith<_ApplicationStatus> get copyWith =>
      __$ApplicationStatusCopyWithImpl<_ApplicationStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApplicationStatusToJson(this);
  }
}

abstract class _ApplicationStatus implements ApplicationStatus {
  const factory _ApplicationStatus(
      {required ApplicationState state,
      required String confirmingTty,
      required ErrorReportRef? error,
      required bool? cloudInitOk,
      required bool? interactive,
      required String echoSyslogId,
      required String logSyslogId,
      required String eventSyslogId}) = _$_ApplicationStatus;

  factory _ApplicationStatus.fromJson(Map<String, dynamic> json) =
      _$_ApplicationStatus.fromJson;

  @override
  ApplicationState get state => throw _privateConstructorUsedError;
  @override
  String get confirmingTty => throw _privateConstructorUsedError;
  @override
  ErrorReportRef? get error => throw _privateConstructorUsedError;
  @override
  bool? get cloudInitOk => throw _privateConstructorUsedError;
  @override
  bool? get interactive => throw _privateConstructorUsedError;
  @override
  String get echoSyslogId => throw _privateConstructorUsedError;
  @override
  String get logSyslogId => throw _privateConstructorUsedError;
  @override
  String get eventSyslogId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationStatusCopyWith<_ApplicationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyFingerprint _$KeyFingerprintFromJson(Map<String, dynamic> json) {
  return _KeyFingerprint.fromJson(json);
}

/// @nodoc
class _$KeyFingerprintTearOff {
  const _$KeyFingerprintTearOff();

  _KeyFingerprint call({required String keytype, required String fingerprint}) {
    return _KeyFingerprint(
      keytype: keytype,
      fingerprint: fingerprint,
    );
  }

  KeyFingerprint fromJson(Map<String, Object> json) {
    return KeyFingerprint.fromJson(json);
  }
}

/// @nodoc
const $KeyFingerprint = _$KeyFingerprintTearOff();

/// @nodoc
mixin _$KeyFingerprint {
  String get keytype => throw _privateConstructorUsedError;
  String get fingerprint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyFingerprintCopyWith<KeyFingerprint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyFingerprintCopyWith<$Res> {
  factory $KeyFingerprintCopyWith(
          KeyFingerprint value, $Res Function(KeyFingerprint) then) =
      _$KeyFingerprintCopyWithImpl<$Res>;
  $Res call({String keytype, String fingerprint});
}

/// @nodoc
class _$KeyFingerprintCopyWithImpl<$Res>
    implements $KeyFingerprintCopyWith<$Res> {
  _$KeyFingerprintCopyWithImpl(this._value, this._then);

  final KeyFingerprint _value;
  // ignore: unused_field
  final $Res Function(KeyFingerprint) _then;

  @override
  $Res call({
    Object? keytype = freezed,
    Object? fingerprint = freezed,
  }) {
    return _then(_value.copyWith(
      keytype: keytype == freezed
          ? _value.keytype
          : keytype // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$KeyFingerprintCopyWith<$Res>
    implements $KeyFingerprintCopyWith<$Res> {
  factory _$KeyFingerprintCopyWith(
          _KeyFingerprint value, $Res Function(_KeyFingerprint) then) =
      __$KeyFingerprintCopyWithImpl<$Res>;
  @override
  $Res call({String keytype, String fingerprint});
}

/// @nodoc
class __$KeyFingerprintCopyWithImpl<$Res>
    extends _$KeyFingerprintCopyWithImpl<$Res>
    implements _$KeyFingerprintCopyWith<$Res> {
  __$KeyFingerprintCopyWithImpl(
      _KeyFingerprint _value, $Res Function(_KeyFingerprint) _then)
      : super(_value, (v) => _then(v as _KeyFingerprint));

  @override
  _KeyFingerprint get _value => super._value as _KeyFingerprint;

  @override
  $Res call({
    Object? keytype = freezed,
    Object? fingerprint = freezed,
  }) {
    return _then(_KeyFingerprint(
      keytype: keytype == freezed
          ? _value.keytype
          : keytype // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyFingerprint implements _KeyFingerprint {
  const _$_KeyFingerprint({required this.keytype, required this.fingerprint});

  factory _$_KeyFingerprint.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyFingerprintFromJson(json);

  @override
  final String keytype;
  @override
  final String fingerprint;

  @override
  String toString() {
    return 'KeyFingerprint(keytype: $keytype, fingerprint: $fingerprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyFingerprint &&
            (identical(other.keytype, keytype) ||
                const DeepCollectionEquality()
                    .equals(other.keytype, keytype)) &&
            (identical(other.fingerprint, fingerprint) ||
                const DeepCollectionEquality()
                    .equals(other.fingerprint, fingerprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(keytype) ^
      const DeepCollectionEquality().hash(fingerprint);

  @JsonKey(ignore: true)
  @override
  _$KeyFingerprintCopyWith<_KeyFingerprint> get copyWith =>
      __$KeyFingerprintCopyWithImpl<_KeyFingerprint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KeyFingerprintToJson(this);
  }
}

abstract class _KeyFingerprint implements KeyFingerprint {
  const factory _KeyFingerprint(
      {required String keytype,
      required String fingerprint}) = _$_KeyFingerprint;

  factory _KeyFingerprint.fromJson(Map<String, dynamic> json) =
      _$_KeyFingerprint.fromJson;

  @override
  String get keytype => throw _privateConstructorUsedError;
  @override
  String get fingerprint => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyFingerprintCopyWith<_KeyFingerprint> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveSessionSSHInfo _$LiveSessionSSHInfoFromJson(Map<String, dynamic> json) {
  return _LiveSessionSSHInfo.fromJson(json);
}

/// @nodoc
class _$LiveSessionSSHInfoTearOff {
  const _$LiveSessionSSHInfoTearOff();

  _LiveSessionSSHInfo call(
      {required String username,
      required PasswordKind passwordKind,
      required String? password,
      required List<KeyFingerprint> authorizedKeyFingerprints,
      required List<String> ips,
      required List<KeyFingerprint> hostKeyFingerprints}) {
    return _LiveSessionSSHInfo(
      username: username,
      passwordKind: passwordKind,
      password: password,
      authorizedKeyFingerprints: authorizedKeyFingerprints,
      ips: ips,
      hostKeyFingerprints: hostKeyFingerprints,
    );
  }

  LiveSessionSSHInfo fromJson(Map<String, Object> json) {
    return LiveSessionSSHInfo.fromJson(json);
  }
}

/// @nodoc
const $LiveSessionSSHInfo = _$LiveSessionSSHInfoTearOff();

/// @nodoc
mixin _$LiveSessionSSHInfo {
  String get username => throw _privateConstructorUsedError;
  PasswordKind get passwordKind => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  List<KeyFingerprint> get authorizedKeyFingerprints =>
      throw _privateConstructorUsedError;
  List<String> get ips => throw _privateConstructorUsedError;
  List<KeyFingerprint> get hostKeyFingerprints =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveSessionSSHInfoCopyWith<LiveSessionSSHInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveSessionSSHInfoCopyWith<$Res> {
  factory $LiveSessionSSHInfoCopyWith(
          LiveSessionSSHInfo value, $Res Function(LiveSessionSSHInfo) then) =
      _$LiveSessionSSHInfoCopyWithImpl<$Res>;
  $Res call(
      {String username,
      PasswordKind passwordKind,
      String? password,
      List<KeyFingerprint> authorizedKeyFingerprints,
      List<String> ips,
      List<KeyFingerprint> hostKeyFingerprints});
}

/// @nodoc
class _$LiveSessionSSHInfoCopyWithImpl<$Res>
    implements $LiveSessionSSHInfoCopyWith<$Res> {
  _$LiveSessionSSHInfoCopyWithImpl(this._value, this._then);

  final LiveSessionSSHInfo _value;
  // ignore: unused_field
  final $Res Function(LiveSessionSSHInfo) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? passwordKind = freezed,
    Object? password = freezed,
    Object? authorizedKeyFingerprints = freezed,
    Object? ips = freezed,
    Object? hostKeyFingerprints = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      passwordKind: passwordKind == freezed
          ? _value.passwordKind
          : passwordKind // ignore: cast_nullable_to_non_nullable
              as PasswordKind,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizedKeyFingerprints: authorizedKeyFingerprints == freezed
          ? _value.authorizedKeyFingerprints
          : authorizedKeyFingerprints // ignore: cast_nullable_to_non_nullable
              as List<KeyFingerprint>,
      ips: ips == freezed
          ? _value.ips
          : ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hostKeyFingerprints: hostKeyFingerprints == freezed
          ? _value.hostKeyFingerprints
          : hostKeyFingerprints // ignore: cast_nullable_to_non_nullable
              as List<KeyFingerprint>,
    ));
  }
}

/// @nodoc
abstract class _$LiveSessionSSHInfoCopyWith<$Res>
    implements $LiveSessionSSHInfoCopyWith<$Res> {
  factory _$LiveSessionSSHInfoCopyWith(
          _LiveSessionSSHInfo value, $Res Function(_LiveSessionSSHInfo) then) =
      __$LiveSessionSSHInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      PasswordKind passwordKind,
      String? password,
      List<KeyFingerprint> authorizedKeyFingerprints,
      List<String> ips,
      List<KeyFingerprint> hostKeyFingerprints});
}

/// @nodoc
class __$LiveSessionSSHInfoCopyWithImpl<$Res>
    extends _$LiveSessionSSHInfoCopyWithImpl<$Res>
    implements _$LiveSessionSSHInfoCopyWith<$Res> {
  __$LiveSessionSSHInfoCopyWithImpl(
      _LiveSessionSSHInfo _value, $Res Function(_LiveSessionSSHInfo) _then)
      : super(_value, (v) => _then(v as _LiveSessionSSHInfo));

  @override
  _LiveSessionSSHInfo get _value => super._value as _LiveSessionSSHInfo;

  @override
  $Res call({
    Object? username = freezed,
    Object? passwordKind = freezed,
    Object? password = freezed,
    Object? authorizedKeyFingerprints = freezed,
    Object? ips = freezed,
    Object? hostKeyFingerprints = freezed,
  }) {
    return _then(_LiveSessionSSHInfo(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      passwordKind: passwordKind == freezed
          ? _value.passwordKind
          : passwordKind // ignore: cast_nullable_to_non_nullable
              as PasswordKind,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizedKeyFingerprints: authorizedKeyFingerprints == freezed
          ? _value.authorizedKeyFingerprints
          : authorizedKeyFingerprints // ignore: cast_nullable_to_non_nullable
              as List<KeyFingerprint>,
      ips: ips == freezed
          ? _value.ips
          : ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hostKeyFingerprints: hostKeyFingerprints == freezed
          ? _value.hostKeyFingerprints
          : hostKeyFingerprints // ignore: cast_nullable_to_non_nullable
              as List<KeyFingerprint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LiveSessionSSHInfo implements _LiveSessionSSHInfo {
  const _$_LiveSessionSSHInfo(
      {required this.username,
      required this.passwordKind,
      required this.password,
      required this.authorizedKeyFingerprints,
      required this.ips,
      required this.hostKeyFingerprints});

  factory _$_LiveSessionSSHInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_LiveSessionSSHInfoFromJson(json);

  @override
  final String username;
  @override
  final PasswordKind passwordKind;
  @override
  final String? password;
  @override
  final List<KeyFingerprint> authorizedKeyFingerprints;
  @override
  final List<String> ips;
  @override
  final List<KeyFingerprint> hostKeyFingerprints;

  @override
  String toString() {
    return 'LiveSessionSSHInfo(username: $username, passwordKind: $passwordKind, password: $password, authorizedKeyFingerprints: $authorizedKeyFingerprints, ips: $ips, hostKeyFingerprints: $hostKeyFingerprints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LiveSessionSSHInfo &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.passwordKind, passwordKind) ||
                const DeepCollectionEquality()
                    .equals(other.passwordKind, passwordKind)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.authorizedKeyFingerprints,
                    authorizedKeyFingerprints) ||
                const DeepCollectionEquality().equals(
                    other.authorizedKeyFingerprints,
                    authorizedKeyFingerprints)) &&
            (identical(other.ips, ips) ||
                const DeepCollectionEquality().equals(other.ips, ips)) &&
            (identical(other.hostKeyFingerprints, hostKeyFingerprints) ||
                const DeepCollectionEquality()
                    .equals(other.hostKeyFingerprints, hostKeyFingerprints)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(passwordKind) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(authorizedKeyFingerprints) ^
      const DeepCollectionEquality().hash(ips) ^
      const DeepCollectionEquality().hash(hostKeyFingerprints);

  @JsonKey(ignore: true)
  @override
  _$LiveSessionSSHInfoCopyWith<_LiveSessionSSHInfo> get copyWith =>
      __$LiveSessionSSHInfoCopyWithImpl<_LiveSessionSSHInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LiveSessionSSHInfoToJson(this);
  }
}

abstract class _LiveSessionSSHInfo implements LiveSessionSSHInfo {
  const factory _LiveSessionSSHInfo(
          {required String username,
          required PasswordKind passwordKind,
          required String? password,
          required List<KeyFingerprint> authorizedKeyFingerprints,
          required List<String> ips,
          required List<KeyFingerprint> hostKeyFingerprints}) =
      _$_LiveSessionSSHInfo;

  factory _LiveSessionSSHInfo.fromJson(Map<String, dynamic> json) =
      _$_LiveSessionSSHInfo.fromJson;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  PasswordKind get passwordKind => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  List<KeyFingerprint> get authorizedKeyFingerprints =>
      throw _privateConstructorUsedError;
  @override
  List<String> get ips => throw _privateConstructorUsedError;
  @override
  List<KeyFingerprint> get hostKeyFingerprints =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LiveSessionSSHInfoCopyWith<_LiveSessionSSHInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshStatus _$RefreshStatusFromJson(Map<String, dynamic> json) {
  return _RefreshStatus.fromJson(json);
}

/// @nodoc
class _$RefreshStatusTearOff {
  const _$RefreshStatusTearOff();

  _RefreshStatus call(
      {required RefreshCheckState availability,
      String currentSnapVersion = '',
      String newSnapVersion = ''}) {
    return _RefreshStatus(
      availability: availability,
      currentSnapVersion: currentSnapVersion,
      newSnapVersion: newSnapVersion,
    );
  }

  RefreshStatus fromJson(Map<String, Object> json) {
    return RefreshStatus.fromJson(json);
  }
}

/// @nodoc
const $RefreshStatus = _$RefreshStatusTearOff();

/// @nodoc
mixin _$RefreshStatus {
  RefreshCheckState get availability => throw _privateConstructorUsedError;
  String get currentSnapVersion => throw _privateConstructorUsedError;
  String get newSnapVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshStatusCopyWith<RefreshStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshStatusCopyWith<$Res> {
  factory $RefreshStatusCopyWith(
          RefreshStatus value, $Res Function(RefreshStatus) then) =
      _$RefreshStatusCopyWithImpl<$Res>;
  $Res call(
      {RefreshCheckState availability,
      String currentSnapVersion,
      String newSnapVersion});
}

/// @nodoc
class _$RefreshStatusCopyWithImpl<$Res>
    implements $RefreshStatusCopyWith<$Res> {
  _$RefreshStatusCopyWithImpl(this._value, this._then);

  final RefreshStatus _value;
  // ignore: unused_field
  final $Res Function(RefreshStatus) _then;

  @override
  $Res call({
    Object? availability = freezed,
    Object? currentSnapVersion = freezed,
    Object? newSnapVersion = freezed,
  }) {
    return _then(_value.copyWith(
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as RefreshCheckState,
      currentSnapVersion: currentSnapVersion == freezed
          ? _value.currentSnapVersion
          : currentSnapVersion // ignore: cast_nullable_to_non_nullable
              as String,
      newSnapVersion: newSnapVersion == freezed
          ? _value.newSnapVersion
          : newSnapVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RefreshStatusCopyWith<$Res>
    implements $RefreshStatusCopyWith<$Res> {
  factory _$RefreshStatusCopyWith(
          _RefreshStatus value, $Res Function(_RefreshStatus) then) =
      __$RefreshStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {RefreshCheckState availability,
      String currentSnapVersion,
      String newSnapVersion});
}

/// @nodoc
class __$RefreshStatusCopyWithImpl<$Res>
    extends _$RefreshStatusCopyWithImpl<$Res>
    implements _$RefreshStatusCopyWith<$Res> {
  __$RefreshStatusCopyWithImpl(
      _RefreshStatus _value, $Res Function(_RefreshStatus) _then)
      : super(_value, (v) => _then(v as _RefreshStatus));

  @override
  _RefreshStatus get _value => super._value as _RefreshStatus;

  @override
  $Res call({
    Object? availability = freezed,
    Object? currentSnapVersion = freezed,
    Object? newSnapVersion = freezed,
  }) {
    return _then(_RefreshStatus(
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as RefreshCheckState,
      currentSnapVersion: currentSnapVersion == freezed
          ? _value.currentSnapVersion
          : currentSnapVersion // ignore: cast_nullable_to_non_nullable
              as String,
      newSnapVersion: newSnapVersion == freezed
          ? _value.newSnapVersion
          : newSnapVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshStatus implements _RefreshStatus {
  const _$_RefreshStatus(
      {required this.availability,
      this.currentSnapVersion = '',
      this.newSnapVersion = ''});

  factory _$_RefreshStatus.fromJson(Map<String, dynamic> json) =>
      _$_$_RefreshStatusFromJson(json);

  @override
  final RefreshCheckState availability;
  @JsonKey(defaultValue: '')
  @override
  final String currentSnapVersion;
  @JsonKey(defaultValue: '')
  @override
  final String newSnapVersion;

  @override
  String toString() {
    return 'RefreshStatus(availability: $availability, currentSnapVersion: $currentSnapVersion, newSnapVersion: $newSnapVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RefreshStatus &&
            (identical(other.availability, availability) ||
                const DeepCollectionEquality()
                    .equals(other.availability, availability)) &&
            (identical(other.currentSnapVersion, currentSnapVersion) ||
                const DeepCollectionEquality()
                    .equals(other.currentSnapVersion, currentSnapVersion)) &&
            (identical(other.newSnapVersion, newSnapVersion) ||
                const DeepCollectionEquality()
                    .equals(other.newSnapVersion, newSnapVersion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(availability) ^
      const DeepCollectionEquality().hash(currentSnapVersion) ^
      const DeepCollectionEquality().hash(newSnapVersion);

  @JsonKey(ignore: true)
  @override
  _$RefreshStatusCopyWith<_RefreshStatus> get copyWith =>
      __$RefreshStatusCopyWithImpl<_RefreshStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RefreshStatusToJson(this);
  }
}

abstract class _RefreshStatus implements RefreshStatus {
  const factory _RefreshStatus(
      {required RefreshCheckState availability,
      String currentSnapVersion,
      String newSnapVersion}) = _$_RefreshStatus;

  factory _RefreshStatus.fromJson(Map<String, dynamic> json) =
      _$_RefreshStatus.fromJson;

  @override
  RefreshCheckState get availability => throw _privateConstructorUsedError;
  @override
  String get currentSnapVersion => throw _privateConstructorUsedError;
  @override
  String get newSnapVersion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RefreshStatusCopyWith<_RefreshStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

AnyStep _$AnyStepFromJson(Map<String, dynamic> json) {
  switch (json['\$type'] as String) {
    case 'StepPressKey':
      return StepPressKey.fromJson(json);
    case 'StepKeyPresent':
      return StepKeyPresent.fromJson(json);
    case 'StepResult':
      return StepResult.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$AnyStepTearOff {
  const _$AnyStepTearOff();

  StepPressKey stepPressKey(
      {required List<String> symbols, required Map<int, String> keycodes}) {
    return StepPressKey(
      symbols: symbols,
      keycodes: keycodes,
    );
  }

  StepKeyPresent stepKeyPresent(
      {required String symbol, required String yes, required String no}) {
    return StepKeyPresent(
      symbol: symbol,
      yes: yes,
      no: no,
    );
  }

  StepResult stepResult({required String layout, required String variant}) {
    return StepResult(
      layout: layout,
      variant: variant,
    );
  }

  AnyStep fromJson(Map<String, Object> json) {
    return AnyStep.fromJson(json);
  }
}

/// @nodoc
const $AnyStep = _$AnyStepTearOff();

/// @nodoc
mixin _$AnyStep {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> symbols, Map<int, String> keycodes)
        stepPressKey,
    required TResult Function(String symbol, String yes, String no)
        stepKeyPresent,
    required TResult Function(String layout, String variant) stepResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StepPressKey value) stepPressKey,
    required TResult Function(StepKeyPresent value) stepKeyPresent,
    required TResult Function(StepResult value) stepResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnyStepCopyWith<$Res> {
  factory $AnyStepCopyWith(AnyStep value, $Res Function(AnyStep) then) =
      _$AnyStepCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnyStepCopyWithImpl<$Res> implements $AnyStepCopyWith<$Res> {
  _$AnyStepCopyWithImpl(this._value, this._then);

  final AnyStep _value;
  // ignore: unused_field
  final $Res Function(AnyStep) _then;
}

/// @nodoc
abstract class $StepPressKeyCopyWith<$Res> {
  factory $StepPressKeyCopyWith(
          StepPressKey value, $Res Function(StepPressKey) then) =
      _$StepPressKeyCopyWithImpl<$Res>;
  $Res call({List<String> symbols, Map<int, String> keycodes});
}

/// @nodoc
class _$StepPressKeyCopyWithImpl<$Res> extends _$AnyStepCopyWithImpl<$Res>
    implements $StepPressKeyCopyWith<$Res> {
  _$StepPressKeyCopyWithImpl(
      StepPressKey _value, $Res Function(StepPressKey) _then)
      : super(_value, (v) => _then(v as StepPressKey));

  @override
  StepPressKey get _value => super._value as StepPressKey;

  @override
  $Res call({
    Object? symbols = freezed,
    Object? keycodes = freezed,
  }) {
    return _then(StepPressKey(
      symbols: symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keycodes: keycodes == freezed
          ? _value.keycodes
          : keycodes // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@FreezedUnionValue('StepPressKey')
@JsonMapConverter()
class _$StepPressKey implements StepPressKey {
  const _$StepPressKey({required this.symbols, required this.keycodes});

  factory _$StepPressKey.fromJson(Map<String, dynamic> json) =>
      _$_$StepPressKeyFromJson(json);

  @override
  final List<String> symbols;
  @override
  final Map<int, String> keycodes;

  @override
  String toString() {
    return 'AnyStep.stepPressKey(symbols: $symbols, keycodes: $keycodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StepPressKey &&
            (identical(other.symbols, symbols) ||
                const DeepCollectionEquality()
                    .equals(other.symbols, symbols)) &&
            (identical(other.keycodes, keycodes) ||
                const DeepCollectionEquality()
                    .equals(other.keycodes, keycodes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(symbols) ^
      const DeepCollectionEquality().hash(keycodes);

  @JsonKey(ignore: true)
  @override
  $StepPressKeyCopyWith<StepPressKey> get copyWith =>
      _$StepPressKeyCopyWithImpl<StepPressKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> symbols, Map<int, String> keycodes)
        stepPressKey,
    required TResult Function(String symbol, String yes, String no)
        stepKeyPresent,
    required TResult Function(String layout, String variant) stepResult,
  }) {
    return stepPressKey(symbols, keycodes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
    required TResult orElse(),
  }) {
    if (stepPressKey != null) {
      return stepPressKey(symbols, keycodes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StepPressKey value) stepPressKey,
    required TResult Function(StepKeyPresent value) stepKeyPresent,
    required TResult Function(StepResult value) stepResult,
  }) {
    return stepPressKey(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
    required TResult orElse(),
  }) {
    if (stepPressKey != null) {
      return stepPressKey(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$StepPressKeyToJson(this)..['\$type'] = 'StepPressKey';
  }
}

abstract class StepPressKey implements AnyStep {
  const factory StepPressKey(
      {required List<String> symbols,
      required Map<int, String> keycodes}) = _$StepPressKey;

  factory StepPressKey.fromJson(Map<String, dynamic> json) =
      _$StepPressKey.fromJson;

  List<String> get symbols => throw _privateConstructorUsedError;
  Map<int, String> get keycodes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepPressKeyCopyWith<StepPressKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepKeyPresentCopyWith<$Res> {
  factory $StepKeyPresentCopyWith(
          StepKeyPresent value, $Res Function(StepKeyPresent) then) =
      _$StepKeyPresentCopyWithImpl<$Res>;
  $Res call({String symbol, String yes, String no});
}

/// @nodoc
class _$StepKeyPresentCopyWithImpl<$Res> extends _$AnyStepCopyWithImpl<$Res>
    implements $StepKeyPresentCopyWith<$Res> {
  _$StepKeyPresentCopyWithImpl(
      StepKeyPresent _value, $Res Function(StepKeyPresent) _then)
      : super(_value, (v) => _then(v as StepKeyPresent));

  @override
  StepKeyPresent get _value => super._value as StepKeyPresent;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? yes = freezed,
    Object? no = freezed,
  }) {
    return _then(StepKeyPresent(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      yes: yes == freezed
          ? _value.yes
          : yes // ignore: cast_nullable_to_non_nullable
              as String,
      no: no == freezed
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@FreezedUnionValue('StepKeyPresent')
class _$StepKeyPresent implements StepKeyPresent {
  const _$StepKeyPresent(
      {required this.symbol, required this.yes, required this.no});

  factory _$StepKeyPresent.fromJson(Map<String, dynamic> json) =>
      _$_$StepKeyPresentFromJson(json);

  @override
  final String symbol;
  @override
  final String yes;
  @override
  final String no;

  @override
  String toString() {
    return 'AnyStep.stepKeyPresent(symbol: $symbol, yes: $yes, no: $no)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StepKeyPresent &&
            (identical(other.symbol, symbol) ||
                const DeepCollectionEquality().equals(other.symbol, symbol)) &&
            (identical(other.yes, yes) ||
                const DeepCollectionEquality().equals(other.yes, yes)) &&
            (identical(other.no, no) ||
                const DeepCollectionEquality().equals(other.no, no)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(symbol) ^
      const DeepCollectionEquality().hash(yes) ^
      const DeepCollectionEquality().hash(no);

  @JsonKey(ignore: true)
  @override
  $StepKeyPresentCopyWith<StepKeyPresent> get copyWith =>
      _$StepKeyPresentCopyWithImpl<StepKeyPresent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> symbols, Map<int, String> keycodes)
        stepPressKey,
    required TResult Function(String symbol, String yes, String no)
        stepKeyPresent,
    required TResult Function(String layout, String variant) stepResult,
  }) {
    return stepKeyPresent(symbol, yes, no);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
    required TResult orElse(),
  }) {
    if (stepKeyPresent != null) {
      return stepKeyPresent(symbol, yes, no);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StepPressKey value) stepPressKey,
    required TResult Function(StepKeyPresent value) stepKeyPresent,
    required TResult Function(StepResult value) stepResult,
  }) {
    return stepKeyPresent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
    required TResult orElse(),
  }) {
    if (stepKeyPresent != null) {
      return stepKeyPresent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$StepKeyPresentToJson(this)..['\$type'] = 'StepKeyPresent';
  }
}

abstract class StepKeyPresent implements AnyStep {
  const factory StepKeyPresent(
      {required String symbol,
      required String yes,
      required String no}) = _$StepKeyPresent;

  factory StepKeyPresent.fromJson(Map<String, dynamic> json) =
      _$StepKeyPresent.fromJson;

  String get symbol => throw _privateConstructorUsedError;
  String get yes => throw _privateConstructorUsedError;
  String get no => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepKeyPresentCopyWith<StepKeyPresent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepResultCopyWith<$Res> {
  factory $StepResultCopyWith(
          StepResult value, $Res Function(StepResult) then) =
      _$StepResultCopyWithImpl<$Res>;
  $Res call({String layout, String variant});
}

/// @nodoc
class _$StepResultCopyWithImpl<$Res> extends _$AnyStepCopyWithImpl<$Res>
    implements $StepResultCopyWith<$Res> {
  _$StepResultCopyWithImpl(StepResult _value, $Res Function(StepResult) _then)
      : super(_value, (v) => _then(v as StepResult));

  @override
  StepResult get _value => super._value as StepResult;

  @override
  $Res call({
    Object? layout = freezed,
    Object? variant = freezed,
  }) {
    return _then(StepResult(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@FreezedUnionValue('StepResult')
class _$StepResult implements StepResult {
  const _$StepResult({required this.layout, required this.variant});

  factory _$StepResult.fromJson(Map<String, dynamic> json) =>
      _$_$StepResultFromJson(json);

  @override
  final String layout;
  @override
  final String variant;

  @override
  String toString() {
    return 'AnyStep.stepResult(layout: $layout, variant: $variant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StepResult &&
            (identical(other.layout, layout) ||
                const DeepCollectionEquality().equals(other.layout, layout)) &&
            (identical(other.variant, variant) ||
                const DeepCollectionEquality().equals(other.variant, variant)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(layout) ^
      const DeepCollectionEquality().hash(variant);

  @JsonKey(ignore: true)
  @override
  $StepResultCopyWith<StepResult> get copyWith =>
      _$StepResultCopyWithImpl<StepResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> symbols, Map<int, String> keycodes)
        stepPressKey,
    required TResult Function(String symbol, String yes, String no)
        stepKeyPresent,
    required TResult Function(String layout, String variant) stepResult,
  }) {
    return stepResult(layout, variant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
    required TResult orElse(),
  }) {
    if (stepResult != null) {
      return stepResult(layout, variant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StepPressKey value) stepPressKey,
    required TResult Function(StepKeyPresent value) stepKeyPresent,
    required TResult Function(StepResult value) stepResult,
  }) {
    return stepResult(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
    required TResult orElse(),
  }) {
    if (stepResult != null) {
      return stepResult(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$StepResultToJson(this)..['\$type'] = 'StepResult';
  }
}

abstract class StepResult implements AnyStep {
  const factory StepResult({required String layout, required String variant}) =
      _$StepResult;

  factory StepResult.fromJson(Map<String, dynamic> json) =
      _$StepResult.fromJson;

  String get layout => throw _privateConstructorUsedError;
  String get variant => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepResultCopyWith<StepResult> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardSetting _$KeyboardSettingFromJson(Map<String, dynamic> json) {
  return _KeyboardSetting.fromJson(json);
}

/// @nodoc
class _$KeyboardSettingTearOff {
  const _$KeyboardSettingTearOff();

  _KeyboardSetting call(
      {required String layout, String variant = '', String? toggle}) {
    return _KeyboardSetting(
      layout: layout,
      variant: variant,
      toggle: toggle,
    );
  }

  KeyboardSetting fromJson(Map<String, Object> json) {
    return KeyboardSetting.fromJson(json);
  }
}

/// @nodoc
const $KeyboardSetting = _$KeyboardSettingTearOff();

/// @nodoc
mixin _$KeyboardSetting {
  String get layout => throw _privateConstructorUsedError;
  String get variant => throw _privateConstructorUsedError;
  String? get toggle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyboardSettingCopyWith<KeyboardSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyboardSettingCopyWith<$Res> {
  factory $KeyboardSettingCopyWith(
          KeyboardSetting value, $Res Function(KeyboardSetting) then) =
      _$KeyboardSettingCopyWithImpl<$Res>;
  $Res call({String layout, String variant, String? toggle});
}

/// @nodoc
class _$KeyboardSettingCopyWithImpl<$Res>
    implements $KeyboardSettingCopyWith<$Res> {
  _$KeyboardSettingCopyWithImpl(this._value, this._then);

  final KeyboardSetting _value;
  // ignore: unused_field
  final $Res Function(KeyboardSetting) _then;

  @override
  $Res call({
    Object? layout = freezed,
    Object? variant = freezed,
    Object? toggle = freezed,
  }) {
    return _then(_value.copyWith(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      toggle: toggle == freezed
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$KeyboardSettingCopyWith<$Res>
    implements $KeyboardSettingCopyWith<$Res> {
  factory _$KeyboardSettingCopyWith(
          _KeyboardSetting value, $Res Function(_KeyboardSetting) then) =
      __$KeyboardSettingCopyWithImpl<$Res>;
  @override
  $Res call({String layout, String variant, String? toggle});
}

/// @nodoc
class __$KeyboardSettingCopyWithImpl<$Res>
    extends _$KeyboardSettingCopyWithImpl<$Res>
    implements _$KeyboardSettingCopyWith<$Res> {
  __$KeyboardSettingCopyWithImpl(
      _KeyboardSetting _value, $Res Function(_KeyboardSetting) _then)
      : super(_value, (v) => _then(v as _KeyboardSetting));

  @override
  _KeyboardSetting get _value => super._value as _KeyboardSetting;

  @override
  $Res call({
    Object? layout = freezed,
    Object? variant = freezed,
    Object? toggle = freezed,
  }) {
    return _then(_KeyboardSetting(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      toggle: toggle == freezed
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardSetting implements _KeyboardSetting {
  const _$_KeyboardSetting(
      {required this.layout, this.variant = '', this.toggle});

  factory _$_KeyboardSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardSettingFromJson(json);

  @override
  final String layout;
  @JsonKey(defaultValue: '')
  @override
  final String variant;
  @override
  final String? toggle;

  @override
  String toString() {
    return 'KeyboardSetting(layout: $layout, variant: $variant, toggle: $toggle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyboardSetting &&
            (identical(other.layout, layout) ||
                const DeepCollectionEquality().equals(other.layout, layout)) &&
            (identical(other.variant, variant) ||
                const DeepCollectionEquality()
                    .equals(other.variant, variant)) &&
            (identical(other.toggle, toggle) ||
                const DeepCollectionEquality().equals(other.toggle, toggle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(layout) ^
      const DeepCollectionEquality().hash(variant) ^
      const DeepCollectionEquality().hash(toggle);

  @JsonKey(ignore: true)
  @override
  _$KeyboardSettingCopyWith<_KeyboardSetting> get copyWith =>
      __$KeyboardSettingCopyWithImpl<_KeyboardSetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KeyboardSettingToJson(this);
  }
}

abstract class _KeyboardSetting implements KeyboardSetting {
  const factory _KeyboardSetting(
      {required String layout,
      String variant,
      String? toggle}) = _$_KeyboardSetting;

  factory _KeyboardSetting.fromJson(Map<String, dynamic> json) =
      _$_KeyboardSetting.fromJson;

  @override
  String get layout => throw _privateConstructorUsedError;
  @override
  String get variant => throw _privateConstructorUsedError;
  @override
  String? get toggle => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyboardSettingCopyWith<_KeyboardSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardVariant _$KeyboardVariantFromJson(Map<String, dynamic> json) {
  return _KeyboardVariant.fromJson(json);
}

/// @nodoc
class _$KeyboardVariantTearOff {
  const _$KeyboardVariantTearOff();

  _KeyboardVariant call({required String code, required String name}) {
    return _KeyboardVariant(
      code: code,
      name: name,
    );
  }

  KeyboardVariant fromJson(Map<String, Object> json) {
    return KeyboardVariant.fromJson(json);
  }
}

/// @nodoc
const $KeyboardVariant = _$KeyboardVariantTearOff();

/// @nodoc
mixin _$KeyboardVariant {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyboardVariantCopyWith<KeyboardVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyboardVariantCopyWith<$Res> {
  factory $KeyboardVariantCopyWith(
          KeyboardVariant value, $Res Function(KeyboardVariant) then) =
      _$KeyboardVariantCopyWithImpl<$Res>;
  $Res call({String code, String name});
}

/// @nodoc
class _$KeyboardVariantCopyWithImpl<$Res>
    implements $KeyboardVariantCopyWith<$Res> {
  _$KeyboardVariantCopyWithImpl(this._value, this._then);

  final KeyboardVariant _value;
  // ignore: unused_field
  final $Res Function(KeyboardVariant) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$KeyboardVariantCopyWith<$Res>
    implements $KeyboardVariantCopyWith<$Res> {
  factory _$KeyboardVariantCopyWith(
          _KeyboardVariant value, $Res Function(_KeyboardVariant) then) =
      __$KeyboardVariantCopyWithImpl<$Res>;
  @override
  $Res call({String code, String name});
}

/// @nodoc
class __$KeyboardVariantCopyWithImpl<$Res>
    extends _$KeyboardVariantCopyWithImpl<$Res>
    implements _$KeyboardVariantCopyWith<$Res> {
  __$KeyboardVariantCopyWithImpl(
      _KeyboardVariant _value, $Res Function(_KeyboardVariant) _then)
      : super(_value, (v) => _then(v as _KeyboardVariant));

  @override
  _KeyboardVariant get _value => super._value as _KeyboardVariant;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_KeyboardVariant(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardVariant implements _KeyboardVariant {
  const _$_KeyboardVariant({required this.code, required this.name});

  factory _$_KeyboardVariant.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardVariantFromJson(json);

  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'KeyboardVariant(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyboardVariant &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$KeyboardVariantCopyWith<_KeyboardVariant> get copyWith =>
      __$KeyboardVariantCopyWithImpl<_KeyboardVariant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KeyboardVariantToJson(this);
  }
}

abstract class _KeyboardVariant implements KeyboardVariant {
  const factory _KeyboardVariant({required String code, required String name}) =
      _$_KeyboardVariant;

  factory _KeyboardVariant.fromJson(Map<String, dynamic> json) =
      _$_KeyboardVariant.fromJson;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyboardVariantCopyWith<_KeyboardVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardLayout _$KeyboardLayoutFromJson(Map<String, dynamic> json) {
  return _KeyboardLayout.fromJson(json);
}

/// @nodoc
class _$KeyboardLayoutTearOff {
  const _$KeyboardLayoutTearOff();

  _KeyboardLayout call(
      {required String code,
      required String name,
      required List<KeyboardVariant> variants}) {
    return _KeyboardLayout(
      code: code,
      name: name,
      variants: variants,
    );
  }

  KeyboardLayout fromJson(Map<String, Object> json) {
    return KeyboardLayout.fromJson(json);
  }
}

/// @nodoc
const $KeyboardLayout = _$KeyboardLayoutTearOff();

/// @nodoc
mixin _$KeyboardLayout {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<KeyboardVariant> get variants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyboardLayoutCopyWith<KeyboardLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyboardLayoutCopyWith<$Res> {
  factory $KeyboardLayoutCopyWith(
          KeyboardLayout value, $Res Function(KeyboardLayout) then) =
      _$KeyboardLayoutCopyWithImpl<$Res>;
  $Res call({String code, String name, List<KeyboardVariant> variants});
}

/// @nodoc
class _$KeyboardLayoutCopyWithImpl<$Res>
    implements $KeyboardLayoutCopyWith<$Res> {
  _$KeyboardLayoutCopyWithImpl(this._value, this._then);

  final KeyboardLayout _value;
  // ignore: unused_field
  final $Res Function(KeyboardLayout) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? variants = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<KeyboardVariant>,
    ));
  }
}

/// @nodoc
abstract class _$KeyboardLayoutCopyWith<$Res>
    implements $KeyboardLayoutCopyWith<$Res> {
  factory _$KeyboardLayoutCopyWith(
          _KeyboardLayout value, $Res Function(_KeyboardLayout) then) =
      __$KeyboardLayoutCopyWithImpl<$Res>;
  @override
  $Res call({String code, String name, List<KeyboardVariant> variants});
}

/// @nodoc
class __$KeyboardLayoutCopyWithImpl<$Res>
    extends _$KeyboardLayoutCopyWithImpl<$Res>
    implements _$KeyboardLayoutCopyWith<$Res> {
  __$KeyboardLayoutCopyWithImpl(
      _KeyboardLayout _value, $Res Function(_KeyboardLayout) _then)
      : super(_value, (v) => _then(v as _KeyboardLayout));

  @override
  _KeyboardLayout get _value => super._value as _KeyboardLayout;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? variants = freezed,
  }) {
    return _then(_KeyboardLayout(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<KeyboardVariant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardLayout implements _KeyboardLayout {
  const _$_KeyboardLayout(
      {required this.code, required this.name, required this.variants});

  factory _$_KeyboardLayout.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardLayoutFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final List<KeyboardVariant> variants;

  @override
  String toString() {
    return 'KeyboardLayout(code: $code, name: $name, variants: $variants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyboardLayout &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.variants, variants) ||
                const DeepCollectionEquality()
                    .equals(other.variants, variants)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(variants);

  @JsonKey(ignore: true)
  @override
  _$KeyboardLayoutCopyWith<_KeyboardLayout> get copyWith =>
      __$KeyboardLayoutCopyWithImpl<_KeyboardLayout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KeyboardLayoutToJson(this);
  }
}

abstract class _KeyboardLayout implements KeyboardLayout {
  const factory _KeyboardLayout(
      {required String code,
      required String name,
      required List<KeyboardVariant> variants}) = _$_KeyboardLayout;

  factory _KeyboardLayout.fromJson(Map<String, dynamic> json) =
      _$_KeyboardLayout.fromJson;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<KeyboardVariant> get variants => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyboardLayoutCopyWith<_KeyboardLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardSetup _$KeyboardSetupFromJson(Map<String, dynamic> json) {
  return _KeyboardSetup.fromJson(json);
}

/// @nodoc
class _$KeyboardSetupTearOff {
  const _$KeyboardSetupTearOff();

  _KeyboardSetup call(
      {required KeyboardSetting setting,
      required List<KeyboardLayout> layouts}) {
    return _KeyboardSetup(
      setting: setting,
      layouts: layouts,
    );
  }

  KeyboardSetup fromJson(Map<String, Object> json) {
    return KeyboardSetup.fromJson(json);
  }
}

/// @nodoc
const $KeyboardSetup = _$KeyboardSetupTearOff();

/// @nodoc
mixin _$KeyboardSetup {
  KeyboardSetting get setting => throw _privateConstructorUsedError;
  List<KeyboardLayout> get layouts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyboardSetupCopyWith<KeyboardSetup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyboardSetupCopyWith<$Res> {
  factory $KeyboardSetupCopyWith(
          KeyboardSetup value, $Res Function(KeyboardSetup) then) =
      _$KeyboardSetupCopyWithImpl<$Res>;
  $Res call({KeyboardSetting setting, List<KeyboardLayout> layouts});

  $KeyboardSettingCopyWith<$Res> get setting;
}

/// @nodoc
class _$KeyboardSetupCopyWithImpl<$Res>
    implements $KeyboardSetupCopyWith<$Res> {
  _$KeyboardSetupCopyWithImpl(this._value, this._then);

  final KeyboardSetup _value;
  // ignore: unused_field
  final $Res Function(KeyboardSetup) _then;

  @override
  $Res call({
    Object? setting = freezed,
    Object? layouts = freezed,
  }) {
    return _then(_value.copyWith(
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as KeyboardSetting,
      layouts: layouts == freezed
          ? _value.layouts
          : layouts // ignore: cast_nullable_to_non_nullable
              as List<KeyboardLayout>,
    ));
  }

  @override
  $KeyboardSettingCopyWith<$Res> get setting {
    return $KeyboardSettingCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value));
    });
  }
}

/// @nodoc
abstract class _$KeyboardSetupCopyWith<$Res>
    implements $KeyboardSetupCopyWith<$Res> {
  factory _$KeyboardSetupCopyWith(
          _KeyboardSetup value, $Res Function(_KeyboardSetup) then) =
      __$KeyboardSetupCopyWithImpl<$Res>;
  @override
  $Res call({KeyboardSetting setting, List<KeyboardLayout> layouts});

  @override
  $KeyboardSettingCopyWith<$Res> get setting;
}

/// @nodoc
class __$KeyboardSetupCopyWithImpl<$Res>
    extends _$KeyboardSetupCopyWithImpl<$Res>
    implements _$KeyboardSetupCopyWith<$Res> {
  __$KeyboardSetupCopyWithImpl(
      _KeyboardSetup _value, $Res Function(_KeyboardSetup) _then)
      : super(_value, (v) => _then(v as _KeyboardSetup));

  @override
  _KeyboardSetup get _value => super._value as _KeyboardSetup;

  @override
  $Res call({
    Object? setting = freezed,
    Object? layouts = freezed,
  }) {
    return _then(_KeyboardSetup(
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as KeyboardSetting,
      layouts: layouts == freezed
          ? _value.layouts
          : layouts // ignore: cast_nullable_to_non_nullable
              as List<KeyboardLayout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardSetup implements _KeyboardSetup {
  const _$_KeyboardSetup({required this.setting, required this.layouts});

  factory _$_KeyboardSetup.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardSetupFromJson(json);

  @override
  final KeyboardSetting setting;
  @override
  final List<KeyboardLayout> layouts;

  @override
  String toString() {
    return 'KeyboardSetup(setting: $setting, layouts: $layouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyboardSetup &&
            (identical(other.setting, setting) ||
                const DeepCollectionEquality()
                    .equals(other.setting, setting)) &&
            (identical(other.layouts, layouts) ||
                const DeepCollectionEquality().equals(other.layouts, layouts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(setting) ^
      const DeepCollectionEquality().hash(layouts);

  @JsonKey(ignore: true)
  @override
  _$KeyboardSetupCopyWith<_KeyboardSetup> get copyWith =>
      __$KeyboardSetupCopyWithImpl<_KeyboardSetup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KeyboardSetupToJson(this);
  }
}

abstract class _KeyboardSetup implements KeyboardSetup {
  const factory _KeyboardSetup(
      {required KeyboardSetting setting,
      required List<KeyboardLayout> layouts}) = _$_KeyboardSetup;

  factory _KeyboardSetup.fromJson(Map<String, dynamic> json) =
      _$_KeyboardSetup.fromJson;

  @override
  KeyboardSetting get setting => throw _privateConstructorUsedError;
  @override
  List<KeyboardLayout> get layouts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyboardSetupCopyWith<_KeyboardSetup> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceSelection _$SourceSelectionFromJson(Map<String, dynamic> json) {
  return _SourceSelection.fromJson(json);
}

/// @nodoc
class _$SourceSelectionTearOff {
  const _$SourceSelectionTearOff();

  _SourceSelection call(
      {required String name,
      required String description,
      required String id,
      required int size,
      required String variant,
      @JsonKey(name: 'default') required bool isDefault}) {
    return _SourceSelection(
      name: name,
      description: description,
      id: id,
      size: size,
      variant: variant,
      isDefault: isDefault,
    );
  }

  SourceSelection fromJson(Map<String, Object> json) {
    return SourceSelection.fromJson(json);
  }
}

/// @nodoc
const $SourceSelection = _$SourceSelectionTearOff();

/// @nodoc
mixin _$SourceSelection {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get variant => throw _privateConstructorUsedError;
  @JsonKey(name: 'default')
  bool get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceSelectionCopyWith<SourceSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceSelectionCopyWith<$Res> {
  factory $SourceSelectionCopyWith(
          SourceSelection value, $Res Function(SourceSelection) then) =
      _$SourceSelectionCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      String id,
      int size,
      String variant,
      @JsonKey(name: 'default') bool isDefault});
}

/// @nodoc
class _$SourceSelectionCopyWithImpl<$Res>
    implements $SourceSelectionCopyWith<$Res> {
  _$SourceSelectionCopyWithImpl(this._value, this._then);

  final SourceSelection _value;
  // ignore: unused_field
  final $Res Function(SourceSelection) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? size = freezed,
    Object? variant = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SourceSelectionCopyWith<$Res>
    implements $SourceSelectionCopyWith<$Res> {
  factory _$SourceSelectionCopyWith(
          _SourceSelection value, $Res Function(_SourceSelection) then) =
      __$SourceSelectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      String id,
      int size,
      String variant,
      @JsonKey(name: 'default') bool isDefault});
}

/// @nodoc
class __$SourceSelectionCopyWithImpl<$Res>
    extends _$SourceSelectionCopyWithImpl<$Res>
    implements _$SourceSelectionCopyWith<$Res> {
  __$SourceSelectionCopyWithImpl(
      _SourceSelection _value, $Res Function(_SourceSelection) _then)
      : super(_value, (v) => _then(v as _SourceSelection));

  @override
  _SourceSelection get _value => super._value as _SourceSelection;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? size = freezed,
    Object? variant = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_SourceSelection(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SourceSelection implements _SourceSelection {
  const _$_SourceSelection(
      {required this.name,
      required this.description,
      required this.id,
      required this.size,
      required this.variant,
      @JsonKey(name: 'default') required this.isDefault});

  factory _$_SourceSelection.fromJson(Map<String, dynamic> json) =>
      _$_$_SourceSelectionFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String id;
  @override
  final int size;
  @override
  final String variant;
  @override
  @JsonKey(name: 'default')
  final bool isDefault;

  @override
  String toString() {
    return 'SourceSelection(name: $name, description: $description, id: $id, size: $size, variant: $variant, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SourceSelection &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.variant, variant) ||
                const DeepCollectionEquality()
                    .equals(other.variant, variant)) &&
            (identical(other.isDefault, isDefault) ||
                const DeepCollectionEquality()
                    .equals(other.isDefault, isDefault)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(variant) ^
      const DeepCollectionEquality().hash(isDefault);

  @JsonKey(ignore: true)
  @override
  _$SourceSelectionCopyWith<_SourceSelection> get copyWith =>
      __$SourceSelectionCopyWithImpl<_SourceSelection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SourceSelectionToJson(this);
  }
}

abstract class _SourceSelection implements SourceSelection {
  const factory _SourceSelection(
      {required String name,
      required String description,
      required String id,
      required int size,
      required String variant,
      @JsonKey(name: 'default') required bool isDefault}) = _$_SourceSelection;

  factory _SourceSelection.fromJson(Map<String, dynamic> json) =
      _$_SourceSelection.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  int get size => throw _privateConstructorUsedError;
  @override
  String get variant => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'default')
  bool get isDefault => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SourceSelectionCopyWith<_SourceSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceSelectionAndSetting _$SourceSelectionAndSettingFromJson(
    Map<String, dynamic> json) {
  return _SourceSelectionAndSetting.fromJson(json);
}

/// @nodoc
class _$SourceSelectionAndSettingTearOff {
  const _$SourceSelectionAndSettingTearOff();

  _SourceSelectionAndSetting call(
      {required List<SourceSelection> sources,
      required String currentId,
      required bool searchDrivers}) {
    return _SourceSelectionAndSetting(
      sources: sources,
      currentId: currentId,
      searchDrivers: searchDrivers,
    );
  }

  SourceSelectionAndSetting fromJson(Map<String, Object> json) {
    return SourceSelectionAndSetting.fromJson(json);
  }
}

/// @nodoc
const $SourceSelectionAndSetting = _$SourceSelectionAndSettingTearOff();

/// @nodoc
mixin _$SourceSelectionAndSetting {
  List<SourceSelection> get sources => throw _privateConstructorUsedError;
  String get currentId => throw _privateConstructorUsedError;
  bool get searchDrivers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceSelectionAndSettingCopyWith<SourceSelectionAndSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceSelectionAndSettingCopyWith<$Res> {
  factory $SourceSelectionAndSettingCopyWith(SourceSelectionAndSetting value,
          $Res Function(SourceSelectionAndSetting) then) =
      _$SourceSelectionAndSettingCopyWithImpl<$Res>;
  $Res call(
      {List<SourceSelection> sources, String currentId, bool searchDrivers});
}

/// @nodoc
class _$SourceSelectionAndSettingCopyWithImpl<$Res>
    implements $SourceSelectionAndSettingCopyWith<$Res> {
  _$SourceSelectionAndSettingCopyWithImpl(this._value, this._then);

  final SourceSelectionAndSetting _value;
  // ignore: unused_field
  final $Res Function(SourceSelectionAndSetting) _then;

  @override
  $Res call({
    Object? sources = freezed,
    Object? currentId = freezed,
    Object? searchDrivers = freezed,
  }) {
    return _then(_value.copyWith(
      sources: sources == freezed
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceSelection>,
      currentId: currentId == freezed
          ? _value.currentId
          : currentId // ignore: cast_nullable_to_non_nullable
              as String,
      searchDrivers: searchDrivers == freezed
          ? _value.searchDrivers
          : searchDrivers // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SourceSelectionAndSettingCopyWith<$Res>
    implements $SourceSelectionAndSettingCopyWith<$Res> {
  factory _$SourceSelectionAndSettingCopyWith(_SourceSelectionAndSetting value,
          $Res Function(_SourceSelectionAndSetting) then) =
      __$SourceSelectionAndSettingCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SourceSelection> sources, String currentId, bool searchDrivers});
}

/// @nodoc
class __$SourceSelectionAndSettingCopyWithImpl<$Res>
    extends _$SourceSelectionAndSettingCopyWithImpl<$Res>
    implements _$SourceSelectionAndSettingCopyWith<$Res> {
  __$SourceSelectionAndSettingCopyWithImpl(_SourceSelectionAndSetting _value,
      $Res Function(_SourceSelectionAndSetting) _then)
      : super(_value, (v) => _then(v as _SourceSelectionAndSetting));

  @override
  _SourceSelectionAndSetting get _value =>
      super._value as _SourceSelectionAndSetting;

  @override
  $Res call({
    Object? sources = freezed,
    Object? currentId = freezed,
    Object? searchDrivers = freezed,
  }) {
    return _then(_SourceSelectionAndSetting(
      sources: sources == freezed
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceSelection>,
      currentId: currentId == freezed
          ? _value.currentId
          : currentId // ignore: cast_nullable_to_non_nullable
              as String,
      searchDrivers: searchDrivers == freezed
          ? _value.searchDrivers
          : searchDrivers // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SourceSelectionAndSetting implements _SourceSelectionAndSetting {
  const _$_SourceSelectionAndSetting(
      {required this.sources,
      required this.currentId,
      required this.searchDrivers});

  factory _$_SourceSelectionAndSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_SourceSelectionAndSettingFromJson(json);

  @override
  final List<SourceSelection> sources;
  @override
  final String currentId;
  @override
  final bool searchDrivers;

  @override
  String toString() {
    return 'SourceSelectionAndSetting(sources: $sources, currentId: $currentId, searchDrivers: $searchDrivers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SourceSelectionAndSetting &&
            (identical(other.sources, sources) ||
                const DeepCollectionEquality()
                    .equals(other.sources, sources)) &&
            (identical(other.currentId, currentId) ||
                const DeepCollectionEquality()
                    .equals(other.currentId, currentId)) &&
            (identical(other.searchDrivers, searchDrivers) ||
                const DeepCollectionEquality()
                    .equals(other.searchDrivers, searchDrivers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sources) ^
      const DeepCollectionEquality().hash(currentId) ^
      const DeepCollectionEquality().hash(searchDrivers);

  @JsonKey(ignore: true)
  @override
  _$SourceSelectionAndSettingCopyWith<_SourceSelectionAndSetting>
      get copyWith =>
          __$SourceSelectionAndSettingCopyWithImpl<_SourceSelectionAndSetting>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SourceSelectionAndSettingToJson(this);
  }
}

abstract class _SourceSelectionAndSetting implements SourceSelectionAndSetting {
  const factory _SourceSelectionAndSetting(
      {required List<SourceSelection> sources,
      required String currentId,
      required bool searchDrivers}) = _$_SourceSelectionAndSetting;

  factory _SourceSelectionAndSetting.fromJson(Map<String, dynamic> json) =
      _$_SourceSelectionAndSetting.fromJson;

  @override
  List<SourceSelection> get sources => throw _privateConstructorUsedError;
  @override
  String get currentId => throw _privateConstructorUsedError;
  @override
  bool get searchDrivers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SourceSelectionAndSettingCopyWith<_SourceSelectionAndSetting>
      get copyWith => throw _privateConstructorUsedError;
}

ZdevInfo _$ZdevInfoFromJson(Map<String, dynamic> json) {
  return _ZdevInfo.fromJson(json);
}

/// @nodoc
class _$ZdevInfoTearOff {
  const _$ZdevInfoTearOff();

  _ZdevInfo call(
      {required String id,
      required String type,
      required bool on,
      required bool exists,
      required bool pers,
      required bool auto,
      required bool failed,
      required String names}) {
    return _ZdevInfo(
      id: id,
      type: type,
      on: on,
      exists: exists,
      pers: pers,
      auto: auto,
      failed: failed,
      names: names,
    );
  }

  ZdevInfo fromJson(Map<String, Object> json) {
    return ZdevInfo.fromJson(json);
  }
}

/// @nodoc
const $ZdevInfo = _$ZdevInfoTearOff();

/// @nodoc
mixin _$ZdevInfo {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get on => throw _privateConstructorUsedError;
  bool get exists => throw _privateConstructorUsedError;
  bool get pers => throw _privateConstructorUsedError;
  bool get auto => throw _privateConstructorUsedError;
  bool get failed => throw _privateConstructorUsedError;
  String get names => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZdevInfoCopyWith<ZdevInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZdevInfoCopyWith<$Res> {
  factory $ZdevInfoCopyWith(ZdevInfo value, $Res Function(ZdevInfo) then) =
      _$ZdevInfoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String type,
      bool on,
      bool exists,
      bool pers,
      bool auto,
      bool failed,
      String names});
}

/// @nodoc
class _$ZdevInfoCopyWithImpl<$Res> implements $ZdevInfoCopyWith<$Res> {
  _$ZdevInfoCopyWithImpl(this._value, this._then);

  final ZdevInfo _value;
  // ignore: unused_field
  final $Res Function(ZdevInfo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? on = freezed,
    Object? exists = freezed,
    Object? pers = freezed,
    Object? auto = freezed,
    Object? failed = freezed,
    Object? names = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      on: on == freezed
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as bool,
      exists: exists == freezed
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      pers: pers == freezed
          ? _value.pers
          : pers // ignore: cast_nullable_to_non_nullable
              as bool,
      auto: auto == freezed
          ? _value.auto
          : auto // ignore: cast_nullable_to_non_nullable
              as bool,
      failed: failed == freezed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as bool,
      names: names == freezed
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ZdevInfoCopyWith<$Res> implements $ZdevInfoCopyWith<$Res> {
  factory _$ZdevInfoCopyWith(_ZdevInfo value, $Res Function(_ZdevInfo) then) =
      __$ZdevInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String type,
      bool on,
      bool exists,
      bool pers,
      bool auto,
      bool failed,
      String names});
}

/// @nodoc
class __$ZdevInfoCopyWithImpl<$Res> extends _$ZdevInfoCopyWithImpl<$Res>
    implements _$ZdevInfoCopyWith<$Res> {
  __$ZdevInfoCopyWithImpl(_ZdevInfo _value, $Res Function(_ZdevInfo) _then)
      : super(_value, (v) => _then(v as _ZdevInfo));

  @override
  _ZdevInfo get _value => super._value as _ZdevInfo;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? on = freezed,
    Object? exists = freezed,
    Object? pers = freezed,
    Object? auto = freezed,
    Object? failed = freezed,
    Object? names = freezed,
  }) {
    return _then(_ZdevInfo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      on: on == freezed
          ? _value.on
          : on // ignore: cast_nullable_to_non_nullable
              as bool,
      exists: exists == freezed
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      pers: pers == freezed
          ? _value.pers
          : pers // ignore: cast_nullable_to_non_nullable
              as bool,
      auto: auto == freezed
          ? _value.auto
          : auto // ignore: cast_nullable_to_non_nullable
              as bool,
      failed: failed == freezed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as bool,
      names: names == freezed
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ZdevInfo implements _ZdevInfo {
  const _$_ZdevInfo(
      {required this.id,
      required this.type,
      required this.on,
      required this.exists,
      required this.pers,
      required this.auto,
      required this.failed,
      required this.names});

  factory _$_ZdevInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_ZdevInfoFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final bool on;
  @override
  final bool exists;
  @override
  final bool pers;
  @override
  final bool auto;
  @override
  final bool failed;
  @override
  final String names;

  @override
  String toString() {
    return 'ZdevInfo(id: $id, type: $type, on: $on, exists: $exists, pers: $pers, auto: $auto, failed: $failed, names: $names)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ZdevInfo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.on, on) ||
                const DeepCollectionEquality().equals(other.on, on)) &&
            (identical(other.exists, exists) ||
                const DeepCollectionEquality().equals(other.exists, exists)) &&
            (identical(other.pers, pers) ||
                const DeepCollectionEquality().equals(other.pers, pers)) &&
            (identical(other.auto, auto) ||
                const DeepCollectionEquality().equals(other.auto, auto)) &&
            (identical(other.failed, failed) ||
                const DeepCollectionEquality().equals(other.failed, failed)) &&
            (identical(other.names, names) ||
                const DeepCollectionEquality().equals(other.names, names)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(on) ^
      const DeepCollectionEquality().hash(exists) ^
      const DeepCollectionEquality().hash(pers) ^
      const DeepCollectionEquality().hash(auto) ^
      const DeepCollectionEquality().hash(failed) ^
      const DeepCollectionEquality().hash(names);

  @JsonKey(ignore: true)
  @override
  _$ZdevInfoCopyWith<_ZdevInfo> get copyWith =>
      __$ZdevInfoCopyWithImpl<_ZdevInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ZdevInfoToJson(this);
  }
}

abstract class _ZdevInfo implements ZdevInfo {
  const factory _ZdevInfo(
      {required String id,
      required String type,
      required bool on,
      required bool exists,
      required bool pers,
      required bool auto,
      required bool failed,
      required String names}) = _$_ZdevInfo;

  factory _ZdevInfo.fromJson(Map<String, dynamic> json) = _$_ZdevInfo.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  bool get on => throw _privateConstructorUsedError;
  @override
  bool get exists => throw _privateConstructorUsedError;
  @override
  bool get pers => throw _privateConstructorUsedError;
  @override
  bool get auto => throw _privateConstructorUsedError;
  @override
  bool get failed => throw _privateConstructorUsedError;
  @override
  String get names => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ZdevInfoCopyWith<_ZdevInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

NetworkStatus _$NetworkStatusFromJson(Map<String, dynamic> json) {
  return _NetworkStatus.fromJson(json);
}

/// @nodoc
class _$NetworkStatusTearOff {
  const _$NetworkStatusTearOff();

  _NetworkStatus call(
      {required List<NetDevInfo> devices,
      required WLANSupportInstallState wlanSupportInstallState}) {
    return _NetworkStatus(
      devices: devices,
      wlanSupportInstallState: wlanSupportInstallState,
    );
  }

  NetworkStatus fromJson(Map<String, Object> json) {
    return NetworkStatus.fromJson(json);
  }
}

/// @nodoc
const $NetworkStatus = _$NetworkStatusTearOff();

/// @nodoc
mixin _$NetworkStatus {
  List<NetDevInfo> get devices => throw _privateConstructorUsedError;
  WLANSupportInstallState get wlanSupportInstallState =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkStatusCopyWith<NetworkStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkStatusCopyWith<$Res> {
  factory $NetworkStatusCopyWith(
          NetworkStatus value, $Res Function(NetworkStatus) then) =
      _$NetworkStatusCopyWithImpl<$Res>;
  $Res call(
      {List<NetDevInfo> devices,
      WLANSupportInstallState wlanSupportInstallState});
}

/// @nodoc
class _$NetworkStatusCopyWithImpl<$Res>
    implements $NetworkStatusCopyWith<$Res> {
  _$NetworkStatusCopyWithImpl(this._value, this._then);

  final NetworkStatus _value;
  // ignore: unused_field
  final $Res Function(NetworkStatus) _then;

  @override
  $Res call({
    Object? devices = freezed,
    Object? wlanSupportInstallState = freezed,
  }) {
    return _then(_value.copyWith(
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<NetDevInfo>,
      wlanSupportInstallState: wlanSupportInstallState == freezed
          ? _value.wlanSupportInstallState
          : wlanSupportInstallState // ignore: cast_nullable_to_non_nullable
              as WLANSupportInstallState,
    ));
  }
}

/// @nodoc
abstract class _$NetworkStatusCopyWith<$Res>
    implements $NetworkStatusCopyWith<$Res> {
  factory _$NetworkStatusCopyWith(
          _NetworkStatus value, $Res Function(_NetworkStatus) then) =
      __$NetworkStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<NetDevInfo> devices,
      WLANSupportInstallState wlanSupportInstallState});
}

/// @nodoc
class __$NetworkStatusCopyWithImpl<$Res>
    extends _$NetworkStatusCopyWithImpl<$Res>
    implements _$NetworkStatusCopyWith<$Res> {
  __$NetworkStatusCopyWithImpl(
      _NetworkStatus _value, $Res Function(_NetworkStatus) _then)
      : super(_value, (v) => _then(v as _NetworkStatus));

  @override
  _NetworkStatus get _value => super._value as _NetworkStatus;

  @override
  $Res call({
    Object? devices = freezed,
    Object? wlanSupportInstallState = freezed,
  }) {
    return _then(_NetworkStatus(
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<NetDevInfo>,
      wlanSupportInstallState: wlanSupportInstallState == freezed
          ? _value.wlanSupportInstallState
          : wlanSupportInstallState // ignore: cast_nullable_to_non_nullable
              as WLANSupportInstallState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkStatus implements _NetworkStatus {
  const _$_NetworkStatus(
      {required this.devices, required this.wlanSupportInstallState});

  factory _$_NetworkStatus.fromJson(Map<String, dynamic> json) =>
      _$_$_NetworkStatusFromJson(json);

  @override
  final List<NetDevInfo> devices;
  @override
  final WLANSupportInstallState wlanSupportInstallState;

  @override
  String toString() {
    return 'NetworkStatus(devices: $devices, wlanSupportInstallState: $wlanSupportInstallState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NetworkStatus &&
            (identical(other.devices, devices) ||
                const DeepCollectionEquality()
                    .equals(other.devices, devices)) &&
            (identical(
                    other.wlanSupportInstallState, wlanSupportInstallState) ||
                const DeepCollectionEquality().equals(
                    other.wlanSupportInstallState, wlanSupportInstallState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(devices) ^
      const DeepCollectionEquality().hash(wlanSupportInstallState);

  @JsonKey(ignore: true)
  @override
  _$NetworkStatusCopyWith<_NetworkStatus> get copyWith =>
      __$NetworkStatusCopyWithImpl<_NetworkStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NetworkStatusToJson(this);
  }
}

abstract class _NetworkStatus implements NetworkStatus {
  const factory _NetworkStatus(
          {required List<NetDevInfo> devices,
          required WLANSupportInstallState wlanSupportInstallState}) =
      _$_NetworkStatus;

  factory _NetworkStatus.fromJson(Map<String, dynamic> json) =
      _$_NetworkStatus.fromJson;

  @override
  List<NetDevInfo> get devices => throw _privateConstructorUsedError;
  @override
  WLANSupportInstallState get wlanSupportInstallState =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NetworkStatusCopyWith<_NetworkStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

OsProber _$OsProberFromJson(Map<String, dynamic> json) {
  return _OsProber.fromJson(json);
}

/// @nodoc
class _$OsProberTearOff {
  const _$OsProberTearOff();

  _OsProber call(
      {required String long,
      required String label,
      required String type,
      String? subpath,
      String? version}) {
    return _OsProber(
      long: long,
      label: label,
      type: type,
      subpath: subpath,
      version: version,
    );
  }

  OsProber fromJson(Map<String, Object> json) {
    return OsProber.fromJson(json);
  }
}

/// @nodoc
const $OsProber = _$OsProberTearOff();

/// @nodoc
mixin _$OsProber {
  String get long => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get subpath => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OsProberCopyWith<OsProber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OsProberCopyWith<$Res> {
  factory $OsProberCopyWith(OsProber value, $Res Function(OsProber) then) =
      _$OsProberCopyWithImpl<$Res>;
  $Res call(
      {String long,
      String label,
      String type,
      String? subpath,
      String? version});
}

/// @nodoc
class _$OsProberCopyWithImpl<$Res> implements $OsProberCopyWith<$Res> {
  _$OsProberCopyWithImpl(this._value, this._then);

  final OsProber _value;
  // ignore: unused_field
  final $Res Function(OsProber) _then;

  @override
  $Res call({
    Object? long = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? subpath = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      subpath: subpath == freezed
          ? _value.subpath
          : subpath // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OsProberCopyWith<$Res> implements $OsProberCopyWith<$Res> {
  factory _$OsProberCopyWith(_OsProber value, $Res Function(_OsProber) then) =
      __$OsProberCopyWithImpl<$Res>;
  @override
  $Res call(
      {String long,
      String label,
      String type,
      String? subpath,
      String? version});
}

/// @nodoc
class __$OsProberCopyWithImpl<$Res> extends _$OsProberCopyWithImpl<$Res>
    implements _$OsProberCopyWith<$Res> {
  __$OsProberCopyWithImpl(_OsProber _value, $Res Function(_OsProber) _then)
      : super(_value, (v) => _then(v as _OsProber));

  @override
  _OsProber get _value => super._value as _OsProber;

  @override
  $Res call({
    Object? long = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? subpath = freezed,
    Object? version = freezed,
  }) {
    return _then(_OsProber(
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      subpath: subpath == freezed
          ? _value.subpath
          : subpath // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OsProber implements _OsProber {
  const _$_OsProber(
      {required this.long,
      required this.label,
      required this.type,
      this.subpath,
      this.version});

  factory _$_OsProber.fromJson(Map<String, dynamic> json) =>
      _$_$_OsProberFromJson(json);

  @override
  final String long;
  @override
  final String label;
  @override
  final String type;
  @override
  final String? subpath;
  @override
  final String? version;

  @override
  String toString() {
    return 'OsProber(long: $long, label: $label, type: $type, subpath: $subpath, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OsProber &&
            (identical(other.long, long) ||
                const DeepCollectionEquality().equals(other.long, long)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.subpath, subpath) ||
                const DeepCollectionEquality()
                    .equals(other.subpath, subpath)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality().equals(other.version, version)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(long) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(subpath) ^
      const DeepCollectionEquality().hash(version);

  @JsonKey(ignore: true)
  @override
  _$OsProberCopyWith<_OsProber> get copyWith =>
      __$OsProberCopyWithImpl<_OsProber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OsProberToJson(this);
  }
}

abstract class _OsProber implements OsProber {
  const factory _OsProber(
      {required String long,
      required String label,
      required String type,
      String? subpath,
      String? version}) = _$_OsProber;

  factory _OsProber.fromJson(Map<String, dynamic> json) = _$_OsProber.fromJson;

  @override
  String get long => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String? get subpath => throw _privateConstructorUsedError;
  @override
  String? get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OsProberCopyWith<_OsProber> get copyWith =>
      throw _privateConstructorUsedError;
}

PartitionOrGap _$PartitionOrGapFromJson(Map<String, dynamic> json) {
  switch (json['\$type'] as String) {
    case 'Partition':
      return Partition.fromJson(json);
    case 'Gap':
      return Gap.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$PartitionOrGapTearOff {
  const _$PartitionOrGapTearOff();

  Partition partition(
      {int? size,
      int? number,
      bool? preserve,
      String? wipe,
      List<String> annotations = const [],
      String? mount,
      String? format,
      bool? grubDevice,
      bool? boot,
      OsProber? os,
      int? offset,
      bool? resize,
      String? path}) {
    return Partition(
      size: size,
      number: number,
      preserve: preserve,
      wipe: wipe,
      annotations: annotations,
      mount: mount,
      format: format,
      grubDevice: grubDevice,
      boot: boot,
      os: os,
      offset: offset,
      resize: resize,
      path: path,
    );
  }

  Gap gap({required int offset, required int size}) {
    return Gap(
      offset: offset,
      size: size,
    );
  }

  PartitionOrGap fromJson(Map<String, Object> json) {
    return PartitionOrGap.fromJson(json);
  }
}

/// @nodoc
const $PartitionOrGap = _$PartitionOrGapTearOff();

/// @nodoc
mixin _$PartitionOrGap {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? size,
            int? number,
            bool? preserve,
            String? wipe,
            List<String> annotations,
            String? mount,
            String? format,
            bool? grubDevice,
            bool? boot,
            OsProber? os,
            int? offset,
            bool? resize,
            String? path)
        partition,
    required TResult Function(int offset, int size) gap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? size,
            int? number,
            bool? preserve,
            String? wipe,
            List<String> annotations,
            String? mount,
            String? format,
            bool? grubDevice,
            bool? boot,
            OsProber? os,
            int? offset,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size)? gap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Partition value) partition,
    required TResult Function(Gap value) gap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Partition value)? partition,
    TResult Function(Gap value)? gap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartitionOrGapCopyWith<$Res> {
  factory $PartitionOrGapCopyWith(
          PartitionOrGap value, $Res Function(PartitionOrGap) then) =
      _$PartitionOrGapCopyWithImpl<$Res>;
}

/// @nodoc
class _$PartitionOrGapCopyWithImpl<$Res>
    implements $PartitionOrGapCopyWith<$Res> {
  _$PartitionOrGapCopyWithImpl(this._value, this._then);

  final PartitionOrGap _value;
  // ignore: unused_field
  final $Res Function(PartitionOrGap) _then;
}

/// @nodoc
abstract class $PartitionCopyWith<$Res> {
  factory $PartitionCopyWith(Partition value, $Res Function(Partition) then) =
      _$PartitionCopyWithImpl<$Res>;
  $Res call(
      {int? size,
      int? number,
      bool? preserve,
      String? wipe,
      List<String> annotations,
      String? mount,
      String? format,
      bool? grubDevice,
      bool? boot,
      OsProber? os,
      int? offset,
      bool? resize,
      String? path});

  $OsProberCopyWith<$Res>? get os;
}

/// @nodoc
class _$PartitionCopyWithImpl<$Res> extends _$PartitionOrGapCopyWithImpl<$Res>
    implements $PartitionCopyWith<$Res> {
  _$PartitionCopyWithImpl(Partition _value, $Res Function(Partition) _then)
      : super(_value, (v) => _then(v as Partition));

  @override
  Partition get _value => super._value as Partition;

  @override
  $Res call({
    Object? size = freezed,
    Object? number = freezed,
    Object? preserve = freezed,
    Object? wipe = freezed,
    Object? annotations = freezed,
    Object? mount = freezed,
    Object? format = freezed,
    Object? grubDevice = freezed,
    Object? boot = freezed,
    Object? os = freezed,
    Object? offset = freezed,
    Object? resize = freezed,
    Object? path = freezed,
  }) {
    return _then(Partition(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      preserve: preserve == freezed
          ? _value.preserve
          : preserve // ignore: cast_nullable_to_non_nullable
              as bool?,
      wipe: wipe == freezed
          ? _value.wipe
          : wipe // ignore: cast_nullable_to_non_nullable
              as String?,
      annotations: annotations == freezed
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mount: mount == freezed
          ? _value.mount
          : mount // ignore: cast_nullable_to_non_nullable
              as String?,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      grubDevice: grubDevice == freezed
          ? _value.grubDevice
          : grubDevice // ignore: cast_nullable_to_non_nullable
              as bool?,
      boot: boot == freezed
          ? _value.boot
          : boot // ignore: cast_nullable_to_non_nullable
              as bool?,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as OsProber?,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      resize: resize == freezed
          ? _value.resize
          : resize // ignore: cast_nullable_to_non_nullable
              as bool?,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $OsProberCopyWith<$Res>? get os {
    if (_value.os == null) {
      return null;
    }

    return $OsProberCopyWith<$Res>(_value.os!, (value) {
      return _then(_value.copyWith(os: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
@FreezedUnionValue('Partition')
class _$Partition implements Partition {
  const _$Partition(
      {this.size,
      this.number,
      this.preserve,
      this.wipe,
      this.annotations = const [],
      this.mount,
      this.format,
      this.grubDevice,
      this.boot,
      this.os,
      this.offset,
      this.resize,
      this.path});

  factory _$Partition.fromJson(Map<String, dynamic> json) =>
      _$_$PartitionFromJson(json);

  @override
  final int? size;
  @override
  final int? number;
  @override
  final bool? preserve;
  @override
  final String? wipe;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> annotations;
  @override
  final String? mount;
  @override
  final String? format;
  @override
  final bool? grubDevice;
  @override
  final bool? boot;
  @override
  final OsProber? os;
  @override
  final int? offset;
  @override
  final bool? resize;
  @override
  final String? path;

  @override
  String toString() {
    return 'PartitionOrGap.partition(size: $size, number: $number, preserve: $preserve, wipe: $wipe, annotations: $annotations, mount: $mount, format: $format, grubDevice: $grubDevice, boot: $boot, os: $os, offset: $offset, resize: $resize, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Partition &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.preserve, preserve) ||
                const DeepCollectionEquality()
                    .equals(other.preserve, preserve)) &&
            (identical(other.wipe, wipe) ||
                const DeepCollectionEquality().equals(other.wipe, wipe)) &&
            (identical(other.annotations, annotations) ||
                const DeepCollectionEquality()
                    .equals(other.annotations, annotations)) &&
            (identical(other.mount, mount) ||
                const DeepCollectionEquality().equals(other.mount, mount)) &&
            (identical(other.format, format) ||
                const DeepCollectionEquality().equals(other.format, format)) &&
            (identical(other.grubDevice, grubDevice) ||
                const DeepCollectionEquality()
                    .equals(other.grubDevice, grubDevice)) &&
            (identical(other.boot, boot) ||
                const DeepCollectionEquality().equals(other.boot, boot)) &&
            (identical(other.os, os) ||
                const DeepCollectionEquality().equals(other.os, os)) &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.resize, resize) ||
                const DeepCollectionEquality().equals(other.resize, resize)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(preserve) ^
      const DeepCollectionEquality().hash(wipe) ^
      const DeepCollectionEquality().hash(annotations) ^
      const DeepCollectionEquality().hash(mount) ^
      const DeepCollectionEquality().hash(format) ^
      const DeepCollectionEquality().hash(grubDevice) ^
      const DeepCollectionEquality().hash(boot) ^
      const DeepCollectionEquality().hash(os) ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(resize) ^
      const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  $PartitionCopyWith<Partition> get copyWith =>
      _$PartitionCopyWithImpl<Partition>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? size,
            int? number,
            bool? preserve,
            String? wipe,
            List<String> annotations,
            String? mount,
            String? format,
            bool? grubDevice,
            bool? boot,
            OsProber? os,
            int? offset,
            bool? resize,
            String? path)
        partition,
    required TResult Function(int offset, int size) gap,
  }) {
    return partition(size, number, preserve, wipe, annotations, mount, format,
        grubDevice, boot, os, offset, resize, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? size,
            int? number,
            bool? preserve,
            String? wipe,
            List<String> annotations,
            String? mount,
            String? format,
            bool? grubDevice,
            bool? boot,
            OsProber? os,
            int? offset,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size)? gap,
    required TResult orElse(),
  }) {
    if (partition != null) {
      return partition(size, number, preserve, wipe, annotations, mount, format,
          grubDevice, boot, os, offset, resize, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Partition value) partition,
    required TResult Function(Gap value) gap,
  }) {
    return partition(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Partition value)? partition,
    TResult Function(Gap value)? gap,
    required TResult orElse(),
  }) {
    if (partition != null) {
      return partition(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$PartitionToJson(this)..['\$type'] = 'Partition';
  }
}

abstract class Partition implements PartitionOrGap {
  const factory Partition(
      {int? size,
      int? number,
      bool? preserve,
      String? wipe,
      List<String> annotations,
      String? mount,
      String? format,
      bool? grubDevice,
      bool? boot,
      OsProber? os,
      int? offset,
      bool? resize,
      String? path}) = _$Partition;

  factory Partition.fromJson(Map<String, dynamic> json) = _$Partition.fromJson;

  int? get size => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  bool? get preserve => throw _privateConstructorUsedError;
  String? get wipe => throw _privateConstructorUsedError;
  List<String> get annotations => throw _privateConstructorUsedError;
  String? get mount => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  bool? get grubDevice => throw _privateConstructorUsedError;
  bool? get boot => throw _privateConstructorUsedError;
  OsProber? get os => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  bool? get resize => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartitionCopyWith<Partition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GapCopyWith<$Res> {
  factory $GapCopyWith(Gap value, $Res Function(Gap) then) =
      _$GapCopyWithImpl<$Res>;
  $Res call({int offset, int size});
}

/// @nodoc
class _$GapCopyWithImpl<$Res> extends _$PartitionOrGapCopyWithImpl<$Res>
    implements $GapCopyWith<$Res> {
  _$GapCopyWithImpl(Gap _value, $Res Function(Gap) _then)
      : super(_value, (v) => _then(v as Gap));

  @override
  Gap get _value => super._value as Gap;

  @override
  $Res call({
    Object? offset = freezed,
    Object? size = freezed,
  }) {
    return _then(Gap(
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@FreezedUnionValue('Gap')
class _$Gap implements Gap {
  const _$Gap({required this.offset, required this.size});

  factory _$Gap.fromJson(Map<String, dynamic> json) => _$_$GapFromJson(json);

  @override
  final int offset;
  @override
  final int size;

  @override
  String toString() {
    return 'PartitionOrGap.gap(offset: $offset, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Gap &&
            (identical(other.offset, offset) ||
                const DeepCollectionEquality().equals(other.offset, offset)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(offset) ^
      const DeepCollectionEquality().hash(size);

  @JsonKey(ignore: true)
  @override
  $GapCopyWith<Gap> get copyWith => _$GapCopyWithImpl<Gap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? size,
            int? number,
            bool? preserve,
            String? wipe,
            List<String> annotations,
            String? mount,
            String? format,
            bool? grubDevice,
            bool? boot,
            OsProber? os,
            int? offset,
            bool? resize,
            String? path)
        partition,
    required TResult Function(int offset, int size) gap,
  }) {
    return gap(offset, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? size,
            int? number,
            bool? preserve,
            String? wipe,
            List<String> annotations,
            String? mount,
            String? format,
            bool? grubDevice,
            bool? boot,
            OsProber? os,
            int? offset,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size)? gap,
    required TResult orElse(),
  }) {
    if (gap != null) {
      return gap(offset, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Partition value) partition,
    required TResult Function(Gap value) gap,
  }) {
    return gap(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Partition value)? partition,
    TResult Function(Gap value)? gap,
    required TResult orElse(),
  }) {
    if (gap != null) {
      return gap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$GapToJson(this)..['\$type'] = 'Gap';
  }
}

abstract class Gap implements PartitionOrGap {
  const factory Gap({required int offset, required int size}) = _$Gap;

  factory Gap.fromJson(Map<String, dynamic> json) = _$Gap.fromJson;

  int get offset => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GapCopyWith<Gap> get copyWith => throw _privateConstructorUsedError;
}

Disk _$DiskFromJson(Map<String, dynamic> json) {
  return _Disk.fromJson(json);
}

/// @nodoc
class _$DiskTearOff {
  const _$DiskTearOff();

  _Disk call(
      {required String id,
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
      String? vendor}) {
    return _Disk(
      id: id,
      label: label,
      type: type,
      size: size,
      usageLabels: usageLabels,
      partitions: partitions,
      okForGuided: okForGuided,
      ptable: ptable,
      preserve: preserve,
      path: path,
      bootDevice: bootDevice,
      model: model,
      vendor: vendor,
    );
  }

  Disk fromJson(Map<String, Object> json) {
    return Disk.fromJson(json);
  }
}

/// @nodoc
const $Disk = _$DiskTearOff();

/// @nodoc
mixin _$Disk {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  List<String> get usageLabels => throw _privateConstructorUsedError;
  List<PartitionOrGap> get partitions => throw _privateConstructorUsedError;
  bool get okForGuided => throw _privateConstructorUsedError;
  String? get ptable => throw _privateConstructorUsedError;
  bool get preserve => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  bool get bootDevice => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get vendor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiskCopyWith<Disk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiskCopyWith<$Res> {
  factory $DiskCopyWith(Disk value, $Res Function(Disk) then) =
      _$DiskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String label,
      String type,
      int size,
      List<String> usageLabels,
      List<PartitionOrGap> partitions,
      bool okForGuided,
      String? ptable,
      bool preserve,
      String? path,
      bool bootDevice,
      String? model,
      String? vendor});
}

/// @nodoc
class _$DiskCopyWithImpl<$Res> implements $DiskCopyWith<$Res> {
  _$DiskCopyWithImpl(this._value, this._then);

  final Disk _value;
  // ignore: unused_field
  final $Res Function(Disk) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? size = freezed,
    Object? usageLabels = freezed,
    Object? partitions = freezed,
    Object? okForGuided = freezed,
    Object? ptable = freezed,
    Object? preserve = freezed,
    Object? path = freezed,
    Object? bootDevice = freezed,
    Object? model = freezed,
    Object? vendor = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      usageLabels: usageLabels == freezed
          ? _value.usageLabels
          : usageLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      partitions: partitions == freezed
          ? _value.partitions
          : partitions // ignore: cast_nullable_to_non_nullable
              as List<PartitionOrGap>,
      okForGuided: okForGuided == freezed
          ? _value.okForGuided
          : okForGuided // ignore: cast_nullable_to_non_nullable
              as bool,
      ptable: ptable == freezed
          ? _value.ptable
          : ptable // ignore: cast_nullable_to_non_nullable
              as String?,
      preserve: preserve == freezed
          ? _value.preserve
          : preserve // ignore: cast_nullable_to_non_nullable
              as bool,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      bootDevice: bootDevice == freezed
          ? _value.bootDevice
          : bootDevice // ignore: cast_nullable_to_non_nullable
              as bool,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DiskCopyWith<$Res> implements $DiskCopyWith<$Res> {
  factory _$DiskCopyWith(_Disk value, $Res Function(_Disk) then) =
      __$DiskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String label,
      String type,
      int size,
      List<String> usageLabels,
      List<PartitionOrGap> partitions,
      bool okForGuided,
      String? ptable,
      bool preserve,
      String? path,
      bool bootDevice,
      String? model,
      String? vendor});
}

/// @nodoc
class __$DiskCopyWithImpl<$Res> extends _$DiskCopyWithImpl<$Res>
    implements _$DiskCopyWith<$Res> {
  __$DiskCopyWithImpl(_Disk _value, $Res Function(_Disk) _then)
      : super(_value, (v) => _then(v as _Disk));

  @override
  _Disk get _value => super._value as _Disk;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? size = freezed,
    Object? usageLabels = freezed,
    Object? partitions = freezed,
    Object? okForGuided = freezed,
    Object? ptable = freezed,
    Object? preserve = freezed,
    Object? path = freezed,
    Object? bootDevice = freezed,
    Object? model = freezed,
    Object? vendor = freezed,
  }) {
    return _then(_Disk(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      usageLabels: usageLabels == freezed
          ? _value.usageLabels
          : usageLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      partitions: partitions == freezed
          ? _value.partitions
          : partitions // ignore: cast_nullable_to_non_nullable
              as List<PartitionOrGap>,
      okForGuided: okForGuided == freezed
          ? _value.okForGuided
          : okForGuided // ignore: cast_nullable_to_non_nullable
              as bool,
      ptable: ptable == freezed
          ? _value.ptable
          : ptable // ignore: cast_nullable_to_non_nullable
              as String?,
      preserve: preserve == freezed
          ? _value.preserve
          : preserve // ignore: cast_nullable_to_non_nullable
              as bool,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      bootDevice: bootDevice == freezed
          ? _value.bootDevice
          : bootDevice // ignore: cast_nullable_to_non_nullable
              as bool,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: vendor == freezed
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Disk implements _Disk {
  const _$_Disk(
      {required this.id,
      required this.label,
      required this.type,
      required this.size,
      required this.usageLabels,
      required this.partitions,
      required this.okForGuided,
      required this.ptable,
      required this.preserve,
      required this.path,
      required this.bootDevice,
      this.model,
      this.vendor});

  factory _$_Disk.fromJson(Map<String, dynamic> json) =>
      _$_$_DiskFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String type;
  @override
  final int size;
  @override
  final List<String> usageLabels;
  @override
  final List<PartitionOrGap> partitions;
  @override
  final bool okForGuided;
  @override
  final String? ptable;
  @override
  final bool preserve;
  @override
  final String? path;
  @override
  final bool bootDevice;
  @override
  final String? model;
  @override
  final String? vendor;

  @override
  String toString() {
    return 'Disk(id: $id, label: $label, type: $type, size: $size, usageLabels: $usageLabels, partitions: $partitions, okForGuided: $okForGuided, ptable: $ptable, preserve: $preserve, path: $path, bootDevice: $bootDevice, model: $model, vendor: $vendor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Disk &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.usageLabels, usageLabels) ||
                const DeepCollectionEquality()
                    .equals(other.usageLabels, usageLabels)) &&
            (identical(other.partitions, partitions) ||
                const DeepCollectionEquality()
                    .equals(other.partitions, partitions)) &&
            (identical(other.okForGuided, okForGuided) ||
                const DeepCollectionEquality()
                    .equals(other.okForGuided, okForGuided)) &&
            (identical(other.ptable, ptable) ||
                const DeepCollectionEquality().equals(other.ptable, ptable)) &&
            (identical(other.preserve, preserve) ||
                const DeepCollectionEquality()
                    .equals(other.preserve, preserve)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.bootDevice, bootDevice) ||
                const DeepCollectionEquality()
                    .equals(other.bootDevice, bootDevice)) &&
            (identical(other.model, model) ||
                const DeepCollectionEquality().equals(other.model, model)) &&
            (identical(other.vendor, vendor) ||
                const DeepCollectionEquality().equals(other.vendor, vendor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(usageLabels) ^
      const DeepCollectionEquality().hash(partitions) ^
      const DeepCollectionEquality().hash(okForGuided) ^
      const DeepCollectionEquality().hash(ptable) ^
      const DeepCollectionEquality().hash(preserve) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(bootDevice) ^
      const DeepCollectionEquality().hash(model) ^
      const DeepCollectionEquality().hash(vendor);

  @JsonKey(ignore: true)
  @override
  _$DiskCopyWith<_Disk> get copyWith =>
      __$DiskCopyWithImpl<_Disk>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DiskToJson(this);
  }
}

abstract class _Disk implements Disk {
  const factory _Disk(
      {required String id,
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
      String? vendor}) = _$_Disk;

  factory _Disk.fromJson(Map<String, dynamic> json) = _$_Disk.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  int get size => throw _privateConstructorUsedError;
  @override
  List<String> get usageLabels => throw _privateConstructorUsedError;
  @override
  List<PartitionOrGap> get partitions => throw _privateConstructorUsedError;
  @override
  bool get okForGuided => throw _privateConstructorUsedError;
  @override
  String? get ptable => throw _privateConstructorUsedError;
  @override
  bool get preserve => throw _privateConstructorUsedError;
  @override
  String? get path => throw _privateConstructorUsedError;
  @override
  bool get bootDevice => throw _privateConstructorUsedError;
  @override
  String? get model => throw _privateConstructorUsedError;
  @override
  String? get vendor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DiskCopyWith<_Disk> get copyWith => throw _privateConstructorUsedError;
}

GuidedChoice _$GuidedChoiceFromJson(Map<String, dynamic> json) {
  return _GuidedChoice.fromJson(json);
}

/// @nodoc
class _$GuidedChoiceTearOff {
  const _$GuidedChoiceTearOff();

  _GuidedChoice call(
      {required String diskId, bool useLvm = false, String? password}) {
    return _GuidedChoice(
      diskId: diskId,
      useLvm: useLvm,
      password: password,
    );
  }

  GuidedChoice fromJson(Map<String, Object> json) {
    return GuidedChoice.fromJson(json);
  }
}

/// @nodoc
const $GuidedChoice = _$GuidedChoiceTearOff();

/// @nodoc
mixin _$GuidedChoice {
  String get diskId => throw _privateConstructorUsedError;
  bool get useLvm => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidedChoiceCopyWith<GuidedChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidedChoiceCopyWith<$Res> {
  factory $GuidedChoiceCopyWith(
          GuidedChoice value, $Res Function(GuidedChoice) then) =
      _$GuidedChoiceCopyWithImpl<$Res>;
  $Res call({String diskId, bool useLvm, String? password});
}

/// @nodoc
class _$GuidedChoiceCopyWithImpl<$Res> implements $GuidedChoiceCopyWith<$Res> {
  _$GuidedChoiceCopyWithImpl(this._value, this._then);

  final GuidedChoice _value;
  // ignore: unused_field
  final $Res Function(GuidedChoice) _then;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? useLvm = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      useLvm: useLvm == freezed
          ? _value.useLvm
          : useLvm // ignore: cast_nullable_to_non_nullable
              as bool,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GuidedChoiceCopyWith<$Res>
    implements $GuidedChoiceCopyWith<$Res> {
  factory _$GuidedChoiceCopyWith(
          _GuidedChoice value, $Res Function(_GuidedChoice) then) =
      __$GuidedChoiceCopyWithImpl<$Res>;
  @override
  $Res call({String diskId, bool useLvm, String? password});
}

/// @nodoc
class __$GuidedChoiceCopyWithImpl<$Res> extends _$GuidedChoiceCopyWithImpl<$Res>
    implements _$GuidedChoiceCopyWith<$Res> {
  __$GuidedChoiceCopyWithImpl(
      _GuidedChoice _value, $Res Function(_GuidedChoice) _then)
      : super(_value, (v) => _then(v as _GuidedChoice));

  @override
  _GuidedChoice get _value => super._value as _GuidedChoice;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? useLvm = freezed,
    Object? password = freezed,
  }) {
    return _then(_GuidedChoice(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      useLvm: useLvm == freezed
          ? _value.useLvm
          : useLvm // ignore: cast_nullable_to_non_nullable
              as bool,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuidedChoice implements _GuidedChoice {
  const _$_GuidedChoice(
      {required this.diskId, this.useLvm = false, this.password});

  factory _$_GuidedChoice.fromJson(Map<String, dynamic> json) =>
      _$_$_GuidedChoiceFromJson(json);

  @override
  final String diskId;
  @JsonKey(defaultValue: false)
  @override
  final bool useLvm;
  @override
  final String? password;

  @override
  String toString() {
    return 'GuidedChoice(diskId: $diskId, useLvm: $useLvm, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GuidedChoice &&
            (identical(other.diskId, diskId) ||
                const DeepCollectionEquality().equals(other.diskId, diskId)) &&
            (identical(other.useLvm, useLvm) ||
                const DeepCollectionEquality().equals(other.useLvm, useLvm)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(diskId) ^
      const DeepCollectionEquality().hash(useLvm) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$GuidedChoiceCopyWith<_GuidedChoice> get copyWith =>
      __$GuidedChoiceCopyWithImpl<_GuidedChoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GuidedChoiceToJson(this);
  }
}

abstract class _GuidedChoice implements GuidedChoice {
  const factory _GuidedChoice(
      {required String diskId,
      bool useLvm,
      String? password}) = _$_GuidedChoice;

  factory _GuidedChoice.fromJson(Map<String, dynamic> json) =
      _$_GuidedChoice.fromJson;

  @override
  String get diskId => throw _privateConstructorUsedError;
  @override
  bool get useLvm => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GuidedChoiceCopyWith<_GuidedChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

GuidedStorageResponse _$GuidedStorageResponseFromJson(
    Map<String, dynamic> json) {
  return _GuidedStorageResponse.fromJson(json);
}

/// @nodoc
class _$GuidedStorageResponseTearOff {
  const _$GuidedStorageResponseTearOff();

  _GuidedStorageResponse call(
      {required ProbeStatus status,
      ErrorReportRef? errorReport,
      List<Disk>? disks}) {
    return _GuidedStorageResponse(
      status: status,
      errorReport: errorReport,
      disks: disks,
    );
  }

  GuidedStorageResponse fromJson(Map<String, Object> json) {
    return GuidedStorageResponse.fromJson(json);
  }
}

/// @nodoc
const $GuidedStorageResponse = _$GuidedStorageResponseTearOff();

/// @nodoc
mixin _$GuidedStorageResponse {
  ProbeStatus get status => throw _privateConstructorUsedError;
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  List<Disk>? get disks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidedStorageResponseCopyWith<GuidedStorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidedStorageResponseCopyWith<$Res> {
  factory $GuidedStorageResponseCopyWith(GuidedStorageResponse value,
          $Res Function(GuidedStorageResponse) then) =
      _$GuidedStorageResponseCopyWithImpl<$Res>;
  $Res call(
      {ProbeStatus status, ErrorReportRef? errorReport, List<Disk>? disks});

  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class _$GuidedStorageResponseCopyWithImpl<$Res>
    implements $GuidedStorageResponseCopyWith<$Res> {
  _$GuidedStorageResponseCopyWithImpl(this._value, this._then);

  final GuidedStorageResponse _value;
  // ignore: unused_field
  final $Res Function(GuidedStorageResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? disks = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      disks: disks == freezed
          ? _value.disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<Disk>?,
    ));
  }

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport {
    if (_value.errorReport == null) {
      return null;
    }

    return $ErrorReportRefCopyWith<$Res>(_value.errorReport!, (value) {
      return _then(_value.copyWith(errorReport: value));
    });
  }
}

/// @nodoc
abstract class _$GuidedStorageResponseCopyWith<$Res>
    implements $GuidedStorageResponseCopyWith<$Res> {
  factory _$GuidedStorageResponseCopyWith(_GuidedStorageResponse value,
          $Res Function(_GuidedStorageResponse) then) =
      __$GuidedStorageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {ProbeStatus status, ErrorReportRef? errorReport, List<Disk>? disks});

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class __$GuidedStorageResponseCopyWithImpl<$Res>
    extends _$GuidedStorageResponseCopyWithImpl<$Res>
    implements _$GuidedStorageResponseCopyWith<$Res> {
  __$GuidedStorageResponseCopyWithImpl(_GuidedStorageResponse _value,
      $Res Function(_GuidedStorageResponse) _then)
      : super(_value, (v) => _then(v as _GuidedStorageResponse));

  @override
  _GuidedStorageResponse get _value => super._value as _GuidedStorageResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? disks = freezed,
  }) {
    return _then(_GuidedStorageResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      disks: disks == freezed
          ? _value.disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<Disk>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuidedStorageResponse implements _GuidedStorageResponse {
  const _$_GuidedStorageResponse(
      {required this.status, this.errorReport, this.disks});

  factory _$_GuidedStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GuidedStorageResponseFromJson(json);

  @override
  final ProbeStatus status;
  @override
  final ErrorReportRef? errorReport;
  @override
  final List<Disk>? disks;

  @override
  String toString() {
    return 'GuidedStorageResponse(status: $status, errorReport: $errorReport, disks: $disks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GuidedStorageResponse &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.errorReport, errorReport) ||
                const DeepCollectionEquality()
                    .equals(other.errorReport, errorReport)) &&
            (identical(other.disks, disks) ||
                const DeepCollectionEquality().equals(other.disks, disks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(errorReport) ^
      const DeepCollectionEquality().hash(disks);

  @JsonKey(ignore: true)
  @override
  _$GuidedStorageResponseCopyWith<_GuidedStorageResponse> get copyWith =>
      __$GuidedStorageResponseCopyWithImpl<_GuidedStorageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GuidedStorageResponseToJson(this);
  }
}

abstract class _GuidedStorageResponse implements GuidedStorageResponse {
  const factory _GuidedStorageResponse(
      {required ProbeStatus status,
      ErrorReportRef? errorReport,
      List<Disk>? disks}) = _$_GuidedStorageResponse;

  factory _GuidedStorageResponse.fromJson(Map<String, dynamic> json) =
      _$_GuidedStorageResponse.fromJson;

  @override
  ProbeStatus get status => throw _privateConstructorUsedError;
  @override
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  @override
  List<Disk>? get disks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GuidedStorageResponseCopyWith<_GuidedStorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StorageResponse _$StorageResponseFromJson(Map<String, dynamic> json) {
  return _StorageResponse.fromJson(json);
}

/// @nodoc
class _$StorageResponseTearOff {
  const _$StorageResponseTearOff();

  _StorageResponse call(
      {required ProbeStatus status,
      ErrorReportRef? errorReport,
      Bootloader? bootloader,
      List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd,
      int storageVersion = 1}) {
    return _StorageResponse(
      status: status,
      errorReport: errorReport,
      bootloader: bootloader,
      origConfig: origConfig,
      config: config,
      blockdev: blockdev,
      dasd: dasd,
      storageVersion: storageVersion,
    );
  }

  StorageResponse fromJson(Map<String, Object> json) {
    return StorageResponse.fromJson(json);
  }
}

/// @nodoc
const $StorageResponse = _$StorageResponseTearOff();

/// @nodoc
mixin _$StorageResponse {
  ProbeStatus get status => throw _privateConstructorUsedError;
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  Bootloader? get bootloader => throw _privateConstructorUsedError;
  List<dynamic>? get origConfig => throw _privateConstructorUsedError;
  List<dynamic>? get config => throw _privateConstructorUsedError;
  Map<String, dynamic>? get blockdev => throw _privateConstructorUsedError;
  Map<String, dynamic>? get dasd => throw _privateConstructorUsedError;
  int get storageVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageResponseCopyWith<StorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageResponseCopyWith<$Res> {
  factory $StorageResponseCopyWith(
          StorageResponse value, $Res Function(StorageResponse) then) =
      _$StorageResponseCopyWithImpl<$Res>;
  $Res call(
      {ProbeStatus status,
      ErrorReportRef? errorReport,
      Bootloader? bootloader,
      List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd,
      int storageVersion});

  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class _$StorageResponseCopyWithImpl<$Res>
    implements $StorageResponseCopyWith<$Res> {
  _$StorageResponseCopyWithImpl(this._value, this._then);

  final StorageResponse _value;
  // ignore: unused_field
  final $Res Function(StorageResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? bootloader = freezed,
    Object? origConfig = freezed,
    Object? config = freezed,
    Object? blockdev = freezed,
    Object? dasd = freezed,
    Object? storageVersion = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      bootloader: bootloader == freezed
          ? _value.bootloader
          : bootloader // ignore: cast_nullable_to_non_nullable
              as Bootloader?,
      origConfig: origConfig == freezed
          ? _value.origConfig
          : origConfig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      blockdev: blockdev == freezed
          ? _value.blockdev
          : blockdev // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      dasd: dasd == freezed
          ? _value.dasd
          : dasd // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      storageVersion: storageVersion == freezed
          ? _value.storageVersion
          : storageVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport {
    if (_value.errorReport == null) {
      return null;
    }

    return $ErrorReportRefCopyWith<$Res>(_value.errorReport!, (value) {
      return _then(_value.copyWith(errorReport: value));
    });
  }
}

/// @nodoc
abstract class _$StorageResponseCopyWith<$Res>
    implements $StorageResponseCopyWith<$Res> {
  factory _$StorageResponseCopyWith(
          _StorageResponse value, $Res Function(_StorageResponse) then) =
      __$StorageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {ProbeStatus status,
      ErrorReportRef? errorReport,
      Bootloader? bootloader,
      List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd,
      int storageVersion});

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class __$StorageResponseCopyWithImpl<$Res>
    extends _$StorageResponseCopyWithImpl<$Res>
    implements _$StorageResponseCopyWith<$Res> {
  __$StorageResponseCopyWithImpl(
      _StorageResponse _value, $Res Function(_StorageResponse) _then)
      : super(_value, (v) => _then(v as _StorageResponse));

  @override
  _StorageResponse get _value => super._value as _StorageResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? bootloader = freezed,
    Object? origConfig = freezed,
    Object? config = freezed,
    Object? blockdev = freezed,
    Object? dasd = freezed,
    Object? storageVersion = freezed,
  }) {
    return _then(_StorageResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      bootloader: bootloader == freezed
          ? _value.bootloader
          : bootloader // ignore: cast_nullable_to_non_nullable
              as Bootloader?,
      origConfig: origConfig == freezed
          ? _value.origConfig
          : origConfig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      blockdev: blockdev == freezed
          ? _value.blockdev
          : blockdev // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      dasd: dasd == freezed
          ? _value.dasd
          : dasd // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      storageVersion: storageVersion == freezed
          ? _value.storageVersion
          : storageVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StorageResponse implements _StorageResponse {
  const _$_StorageResponse(
      {required this.status,
      this.errorReport,
      this.bootloader,
      this.origConfig,
      this.config,
      this.blockdev,
      this.dasd,
      this.storageVersion = 1});

  factory _$_StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_StorageResponseFromJson(json);

  @override
  final ProbeStatus status;
  @override
  final ErrorReportRef? errorReport;
  @override
  final Bootloader? bootloader;
  @override
  final List<dynamic>? origConfig;
  @override
  final List<dynamic>? config;
  @override
  final Map<String, dynamic>? blockdev;
  @override
  final Map<String, dynamic>? dasd;
  @JsonKey(defaultValue: 1)
  @override
  final int storageVersion;

  @override
  String toString() {
    return 'StorageResponse(status: $status, errorReport: $errorReport, bootloader: $bootloader, origConfig: $origConfig, config: $config, blockdev: $blockdev, dasd: $dasd, storageVersion: $storageVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorageResponse &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.errorReport, errorReport) ||
                const DeepCollectionEquality()
                    .equals(other.errorReport, errorReport)) &&
            (identical(other.bootloader, bootloader) ||
                const DeepCollectionEquality()
                    .equals(other.bootloader, bootloader)) &&
            (identical(other.origConfig, origConfig) ||
                const DeepCollectionEquality()
                    .equals(other.origConfig, origConfig)) &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)) &&
            (identical(other.blockdev, blockdev) ||
                const DeepCollectionEquality()
                    .equals(other.blockdev, blockdev)) &&
            (identical(other.dasd, dasd) ||
                const DeepCollectionEquality().equals(other.dasd, dasd)) &&
            (identical(other.storageVersion, storageVersion) ||
                const DeepCollectionEquality()
                    .equals(other.storageVersion, storageVersion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(errorReport) ^
      const DeepCollectionEquality().hash(bootloader) ^
      const DeepCollectionEquality().hash(origConfig) ^
      const DeepCollectionEquality().hash(config) ^
      const DeepCollectionEquality().hash(blockdev) ^
      const DeepCollectionEquality().hash(dasd) ^
      const DeepCollectionEquality().hash(storageVersion);

  @JsonKey(ignore: true)
  @override
  _$StorageResponseCopyWith<_StorageResponse> get copyWith =>
      __$StorageResponseCopyWithImpl<_StorageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StorageResponseToJson(this);
  }
}

abstract class _StorageResponse implements StorageResponse {
  const factory _StorageResponse(
      {required ProbeStatus status,
      ErrorReportRef? errorReport,
      Bootloader? bootloader,
      List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd,
      int storageVersion}) = _$_StorageResponse;

  factory _StorageResponse.fromJson(Map<String, dynamic> json) =
      _$_StorageResponse.fromJson;

  @override
  ProbeStatus get status => throw _privateConstructorUsedError;
  @override
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  @override
  Bootloader? get bootloader => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get origConfig => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get config => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get blockdev => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get dasd => throw _privateConstructorUsedError;
  @override
  int get storageVersion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StorageResponseCopyWith<_StorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StorageResponseV2 _$StorageResponseV2FromJson(Map<String, dynamic> json) {
  return _StorageResponseV2.fromJson(json);
}

/// @nodoc
class _$StorageResponseV2TearOff {
  const _$StorageResponseV2TearOff();

  _StorageResponseV2 call(
      {required List<Disk> disks,
      required bool needRoot,
      required bool needBoot,
      ErrorReportRef? errorReport}) {
    return _StorageResponseV2(
      disks: disks,
      needRoot: needRoot,
      needBoot: needBoot,
      errorReport: errorReport,
    );
  }

  StorageResponseV2 fromJson(Map<String, Object> json) {
    return StorageResponseV2.fromJson(json);
  }
}

/// @nodoc
const $StorageResponseV2 = _$StorageResponseV2TearOff();

/// @nodoc
mixin _$StorageResponseV2 {
  List<Disk> get disks => throw _privateConstructorUsedError;
  bool get needRoot => throw _privateConstructorUsedError;
  bool get needBoot => throw _privateConstructorUsedError;
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageResponseV2CopyWith<StorageResponseV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageResponseV2CopyWith<$Res> {
  factory $StorageResponseV2CopyWith(
          StorageResponseV2 value, $Res Function(StorageResponseV2) then) =
      _$StorageResponseV2CopyWithImpl<$Res>;
  $Res call(
      {List<Disk> disks,
      bool needRoot,
      bool needBoot,
      ErrorReportRef? errorReport});

  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class _$StorageResponseV2CopyWithImpl<$Res>
    implements $StorageResponseV2CopyWith<$Res> {
  _$StorageResponseV2CopyWithImpl(this._value, this._then);

  final StorageResponseV2 _value;
  // ignore: unused_field
  final $Res Function(StorageResponseV2) _then;

  @override
  $Res call({
    Object? disks = freezed,
    Object? needRoot = freezed,
    Object? needBoot = freezed,
    Object? errorReport = freezed,
  }) {
    return _then(_value.copyWith(
      disks: disks == freezed
          ? _value.disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<Disk>,
      needRoot: needRoot == freezed
          ? _value.needRoot
          : needRoot // ignore: cast_nullable_to_non_nullable
              as bool,
      needBoot: needBoot == freezed
          ? _value.needBoot
          : needBoot // ignore: cast_nullable_to_non_nullable
              as bool,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
    ));
  }

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport {
    if (_value.errorReport == null) {
      return null;
    }

    return $ErrorReportRefCopyWith<$Res>(_value.errorReport!, (value) {
      return _then(_value.copyWith(errorReport: value));
    });
  }
}

/// @nodoc
abstract class _$StorageResponseV2CopyWith<$Res>
    implements $StorageResponseV2CopyWith<$Res> {
  factory _$StorageResponseV2CopyWith(
          _StorageResponseV2 value, $Res Function(_StorageResponseV2) then) =
      __$StorageResponseV2CopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Disk> disks,
      bool needRoot,
      bool needBoot,
      ErrorReportRef? errorReport});

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class __$StorageResponseV2CopyWithImpl<$Res>
    extends _$StorageResponseV2CopyWithImpl<$Res>
    implements _$StorageResponseV2CopyWith<$Res> {
  __$StorageResponseV2CopyWithImpl(
      _StorageResponseV2 _value, $Res Function(_StorageResponseV2) _then)
      : super(_value, (v) => _then(v as _StorageResponseV2));

  @override
  _StorageResponseV2 get _value => super._value as _StorageResponseV2;

  @override
  $Res call({
    Object? disks = freezed,
    Object? needRoot = freezed,
    Object? needBoot = freezed,
    Object? errorReport = freezed,
  }) {
    return _then(_StorageResponseV2(
      disks: disks == freezed
          ? _value.disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<Disk>,
      needRoot: needRoot == freezed
          ? _value.needRoot
          : needRoot // ignore: cast_nullable_to_non_nullable
              as bool,
      needBoot: needBoot == freezed
          ? _value.needBoot
          : needBoot // ignore: cast_nullable_to_non_nullable
              as bool,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StorageResponseV2 implements _StorageResponseV2 {
  const _$_StorageResponseV2(
      {required this.disks,
      required this.needRoot,
      required this.needBoot,
      this.errorReport});

  factory _$_StorageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$_$_StorageResponseV2FromJson(json);

  @override
  final List<Disk> disks;
  @override
  final bool needRoot;
  @override
  final bool needBoot;
  @override
  final ErrorReportRef? errorReport;

  @override
  String toString() {
    return 'StorageResponseV2(disks: $disks, needRoot: $needRoot, needBoot: $needBoot, errorReport: $errorReport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorageResponseV2 &&
            (identical(other.disks, disks) ||
                const DeepCollectionEquality().equals(other.disks, disks)) &&
            (identical(other.needRoot, needRoot) ||
                const DeepCollectionEquality()
                    .equals(other.needRoot, needRoot)) &&
            (identical(other.needBoot, needBoot) ||
                const DeepCollectionEquality()
                    .equals(other.needBoot, needBoot)) &&
            (identical(other.errorReport, errorReport) ||
                const DeepCollectionEquality()
                    .equals(other.errorReport, errorReport)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(disks) ^
      const DeepCollectionEquality().hash(needRoot) ^
      const DeepCollectionEquality().hash(needBoot) ^
      const DeepCollectionEquality().hash(errorReport);

  @JsonKey(ignore: true)
  @override
  _$StorageResponseV2CopyWith<_StorageResponseV2> get copyWith =>
      __$StorageResponseV2CopyWithImpl<_StorageResponseV2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StorageResponseV2ToJson(this);
  }
}

abstract class _StorageResponseV2 implements StorageResponseV2 {
  const factory _StorageResponseV2(
      {required List<Disk> disks,
      required bool needRoot,
      required bool needBoot,
      ErrorReportRef? errorReport}) = _$_StorageResponseV2;

  factory _StorageResponseV2.fromJson(Map<String, dynamic> json) =
      _$_StorageResponseV2.fromJson;

  @override
  List<Disk> get disks => throw _privateConstructorUsedError;
  @override
  bool get needRoot => throw _privateConstructorUsedError;
  @override
  bool get needBoot => throw _privateConstructorUsedError;
  @override
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StorageResponseV2CopyWith<_StorageResponseV2> get copyWith =>
      throw _privateConstructorUsedError;
}

AddPartitionV2 _$AddPartitionV2FromJson(Map<String, dynamic> json) {
  return _AddPartitionV2.fromJson(json);
}

/// @nodoc
class _$AddPartitionV2TearOff {
  const _$AddPartitionV2TearOff();

  _AddPartitionV2 call(
      {required String diskId,
      required Partition partition,
      required Gap gap}) {
    return _AddPartitionV2(
      diskId: diskId,
      partition: partition,
      gap: gap,
    );
  }

  AddPartitionV2 fromJson(Map<String, Object> json) {
    return AddPartitionV2.fromJson(json);
  }
}

/// @nodoc
const $AddPartitionV2 = _$AddPartitionV2TearOff();

/// @nodoc
mixin _$AddPartitionV2 {
  String get diskId => throw _privateConstructorUsedError;
  Partition get partition => throw _privateConstructorUsedError;
  Gap get gap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddPartitionV2CopyWith<AddPartitionV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPartitionV2CopyWith<$Res> {
  factory $AddPartitionV2CopyWith(
          AddPartitionV2 value, $Res Function(AddPartitionV2) then) =
      _$AddPartitionV2CopyWithImpl<$Res>;
  $Res call({String diskId, Partition partition, Gap gap});
}

/// @nodoc
class _$AddPartitionV2CopyWithImpl<$Res>
    implements $AddPartitionV2CopyWith<$Res> {
  _$AddPartitionV2CopyWithImpl(this._value, this._then);

  final AddPartitionV2 _value;
  // ignore: unused_field
  final $Res Function(AddPartitionV2) _then;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partition = freezed,
    Object? gap = freezed,
  }) {
    return _then(_value.copyWith(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      partition: partition == freezed
          ? _value.partition
          : partition // ignore: cast_nullable_to_non_nullable
              as Partition,
      gap: gap == freezed
          ? _value.gap
          : gap // ignore: cast_nullable_to_non_nullable
              as Gap,
    ));
  }
}

/// @nodoc
abstract class _$AddPartitionV2CopyWith<$Res>
    implements $AddPartitionV2CopyWith<$Res> {
  factory _$AddPartitionV2CopyWith(
          _AddPartitionV2 value, $Res Function(_AddPartitionV2) then) =
      __$AddPartitionV2CopyWithImpl<$Res>;
  @override
  $Res call({String diskId, Partition partition, Gap gap});
}

/// @nodoc
class __$AddPartitionV2CopyWithImpl<$Res>
    extends _$AddPartitionV2CopyWithImpl<$Res>
    implements _$AddPartitionV2CopyWith<$Res> {
  __$AddPartitionV2CopyWithImpl(
      _AddPartitionV2 _value, $Res Function(_AddPartitionV2) _then)
      : super(_value, (v) => _then(v as _AddPartitionV2));

  @override
  _AddPartitionV2 get _value => super._value as _AddPartitionV2;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partition = freezed,
    Object? gap = freezed,
  }) {
    return _then(_AddPartitionV2(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      partition: partition == freezed
          ? _value.partition
          : partition // ignore: cast_nullable_to_non_nullable
              as Partition,
      gap: gap == freezed
          ? _value.gap
          : gap // ignore: cast_nullable_to_non_nullable
              as Gap,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddPartitionV2 implements _AddPartitionV2 {
  const _$_AddPartitionV2(
      {required this.diskId, required this.partition, required this.gap});

  factory _$_AddPartitionV2.fromJson(Map<String, dynamic> json) =>
      _$_$_AddPartitionV2FromJson(json);

  @override
  final String diskId;
  @override
  final Partition partition;
  @override
  final Gap gap;

  @override
  String toString() {
    return 'AddPartitionV2(diskId: $diskId, partition: $partition, gap: $gap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddPartitionV2 &&
            (identical(other.diskId, diskId) ||
                const DeepCollectionEquality().equals(other.diskId, diskId)) &&
            (identical(other.partition, partition) ||
                const DeepCollectionEquality()
                    .equals(other.partition, partition)) &&
            (identical(other.gap, gap) ||
                const DeepCollectionEquality().equals(other.gap, gap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(diskId) ^
      const DeepCollectionEquality().hash(partition) ^
      const DeepCollectionEquality().hash(gap);

  @JsonKey(ignore: true)
  @override
  _$AddPartitionV2CopyWith<_AddPartitionV2> get copyWith =>
      __$AddPartitionV2CopyWithImpl<_AddPartitionV2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddPartitionV2ToJson(this);
  }
}

abstract class _AddPartitionV2 implements AddPartitionV2 {
  const factory _AddPartitionV2(
      {required String diskId,
      required Partition partition,
      required Gap gap}) = _$_AddPartitionV2;

  factory _AddPartitionV2.fromJson(Map<String, dynamic> json) =
      _$_AddPartitionV2.fromJson;

  @override
  String get diskId => throw _privateConstructorUsedError;
  @override
  Partition get partition => throw _privateConstructorUsedError;
  @override
  Gap get gap => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddPartitionV2CopyWith<_AddPartitionV2> get copyWith =>
      throw _privateConstructorUsedError;
}

ModifyPartitionV2 _$ModifyPartitionV2FromJson(Map<String, dynamic> json) {
  return _ModifyPartitionV2.fromJson(json);
}

/// @nodoc
class _$ModifyPartitionV2TearOff {
  const _$ModifyPartitionV2TearOff();

  _ModifyPartitionV2 call(
      {required String diskId, required Partition partition}) {
    return _ModifyPartitionV2(
      diskId: diskId,
      partition: partition,
    );
  }

  ModifyPartitionV2 fromJson(Map<String, Object> json) {
    return ModifyPartitionV2.fromJson(json);
  }
}

/// @nodoc
const $ModifyPartitionV2 = _$ModifyPartitionV2TearOff();

/// @nodoc
mixin _$ModifyPartitionV2 {
  String get diskId => throw _privateConstructorUsedError;
  Partition get partition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModifyPartitionV2CopyWith<ModifyPartitionV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyPartitionV2CopyWith<$Res> {
  factory $ModifyPartitionV2CopyWith(
          ModifyPartitionV2 value, $Res Function(ModifyPartitionV2) then) =
      _$ModifyPartitionV2CopyWithImpl<$Res>;
  $Res call({String diskId, Partition partition});
}

/// @nodoc
class _$ModifyPartitionV2CopyWithImpl<$Res>
    implements $ModifyPartitionV2CopyWith<$Res> {
  _$ModifyPartitionV2CopyWithImpl(this._value, this._then);

  final ModifyPartitionV2 _value;
  // ignore: unused_field
  final $Res Function(ModifyPartitionV2) _then;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partition = freezed,
  }) {
    return _then(_value.copyWith(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      partition: partition == freezed
          ? _value.partition
          : partition // ignore: cast_nullable_to_non_nullable
              as Partition,
    ));
  }
}

/// @nodoc
abstract class _$ModifyPartitionV2CopyWith<$Res>
    implements $ModifyPartitionV2CopyWith<$Res> {
  factory _$ModifyPartitionV2CopyWith(
          _ModifyPartitionV2 value, $Res Function(_ModifyPartitionV2) then) =
      __$ModifyPartitionV2CopyWithImpl<$Res>;
  @override
  $Res call({String diskId, Partition partition});
}

/// @nodoc
class __$ModifyPartitionV2CopyWithImpl<$Res>
    extends _$ModifyPartitionV2CopyWithImpl<$Res>
    implements _$ModifyPartitionV2CopyWith<$Res> {
  __$ModifyPartitionV2CopyWithImpl(
      _ModifyPartitionV2 _value, $Res Function(_ModifyPartitionV2) _then)
      : super(_value, (v) => _then(v as _ModifyPartitionV2));

  @override
  _ModifyPartitionV2 get _value => super._value as _ModifyPartitionV2;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partition = freezed,
  }) {
    return _then(_ModifyPartitionV2(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      partition: partition == freezed
          ? _value.partition
          : partition // ignore: cast_nullable_to_non_nullable
              as Partition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModifyPartitionV2 implements _ModifyPartitionV2 {
  const _$_ModifyPartitionV2({required this.diskId, required this.partition});

  factory _$_ModifyPartitionV2.fromJson(Map<String, dynamic> json) =>
      _$_$_ModifyPartitionV2FromJson(json);

  @override
  final String diskId;
  @override
  final Partition partition;

  @override
  String toString() {
    return 'ModifyPartitionV2(diskId: $diskId, partition: $partition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ModifyPartitionV2 &&
            (identical(other.diskId, diskId) ||
                const DeepCollectionEquality().equals(other.diskId, diskId)) &&
            (identical(other.partition, partition) ||
                const DeepCollectionEquality()
                    .equals(other.partition, partition)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(diskId) ^
      const DeepCollectionEquality().hash(partition);

  @JsonKey(ignore: true)
  @override
  _$ModifyPartitionV2CopyWith<_ModifyPartitionV2> get copyWith =>
      __$ModifyPartitionV2CopyWithImpl<_ModifyPartitionV2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ModifyPartitionV2ToJson(this);
  }
}

abstract class _ModifyPartitionV2 implements ModifyPartitionV2 {
  const factory _ModifyPartitionV2(
      {required String diskId,
      required Partition partition}) = _$_ModifyPartitionV2;

  factory _ModifyPartitionV2.fromJson(Map<String, dynamic> json) =
      _$_ModifyPartitionV2.fromJson;

  @override
  String get diskId => throw _privateConstructorUsedError;
  @override
  Partition get partition => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModifyPartitionV2CopyWith<_ModifyPartitionV2> get copyWith =>
      throw _privateConstructorUsedError;
}

ReformatDisk _$ReformatDiskFromJson(Map<String, dynamic> json) {
  return _ReformatDisk.fromJson(json);
}

/// @nodoc
class _$ReformatDiskTearOff {
  const _$ReformatDiskTearOff();

  _ReformatDisk call({required String diskId, String? ptable}) {
    return _ReformatDisk(
      diskId: diskId,
      ptable: ptable,
    );
  }

  ReformatDisk fromJson(Map<String, Object> json) {
    return ReformatDisk.fromJson(json);
  }
}

/// @nodoc
const $ReformatDisk = _$ReformatDiskTearOff();

/// @nodoc
mixin _$ReformatDisk {
  String get diskId => throw _privateConstructorUsedError;
  String? get ptable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReformatDiskCopyWith<ReformatDisk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReformatDiskCopyWith<$Res> {
  factory $ReformatDiskCopyWith(
          ReformatDisk value, $Res Function(ReformatDisk) then) =
      _$ReformatDiskCopyWithImpl<$Res>;
  $Res call({String diskId, String? ptable});
}

/// @nodoc
class _$ReformatDiskCopyWithImpl<$Res> implements $ReformatDiskCopyWith<$Res> {
  _$ReformatDiskCopyWithImpl(this._value, this._then);

  final ReformatDisk _value;
  // ignore: unused_field
  final $Res Function(ReformatDisk) _then;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? ptable = freezed,
  }) {
    return _then(_value.copyWith(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      ptable: ptable == freezed
          ? _value.ptable
          : ptable // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReformatDiskCopyWith<$Res>
    implements $ReformatDiskCopyWith<$Res> {
  factory _$ReformatDiskCopyWith(
          _ReformatDisk value, $Res Function(_ReformatDisk) then) =
      __$ReformatDiskCopyWithImpl<$Res>;
  @override
  $Res call({String diskId, String? ptable});
}

/// @nodoc
class __$ReformatDiskCopyWithImpl<$Res> extends _$ReformatDiskCopyWithImpl<$Res>
    implements _$ReformatDiskCopyWith<$Res> {
  __$ReformatDiskCopyWithImpl(
      _ReformatDisk _value, $Res Function(_ReformatDisk) _then)
      : super(_value, (v) => _then(v as _ReformatDisk));

  @override
  _ReformatDisk get _value => super._value as _ReformatDisk;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? ptable = freezed,
  }) {
    return _then(_ReformatDisk(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      ptable: ptable == freezed
          ? _value.ptable
          : ptable // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReformatDisk implements _ReformatDisk {
  const _$_ReformatDisk({required this.diskId, this.ptable});

  factory _$_ReformatDisk.fromJson(Map<String, dynamic> json) =>
      _$_$_ReformatDiskFromJson(json);

  @override
  final String diskId;
  @override
  final String? ptable;

  @override
  String toString() {
    return 'ReformatDisk(diskId: $diskId, ptable: $ptable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReformatDisk &&
            (identical(other.diskId, diskId) ||
                const DeepCollectionEquality().equals(other.diskId, diskId)) &&
            (identical(other.ptable, ptable) ||
                const DeepCollectionEquality().equals(other.ptable, ptable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(diskId) ^
      const DeepCollectionEquality().hash(ptable);

  @JsonKey(ignore: true)
  @override
  _$ReformatDiskCopyWith<_ReformatDisk> get copyWith =>
      __$ReformatDiskCopyWithImpl<_ReformatDisk>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReformatDiskToJson(this);
  }
}

abstract class _ReformatDisk implements ReformatDisk {
  const factory _ReformatDisk({required String diskId, String? ptable}) =
      _$_ReformatDisk;

  factory _ReformatDisk.fromJson(Map<String, dynamic> json) =
      _$_ReformatDisk.fromJson;

  @override
  String get diskId => throw _privateConstructorUsedError;
  @override
  String? get ptable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReformatDiskCopyWith<_ReformatDisk> get copyWith =>
      throw _privateConstructorUsedError;
}

IdentityData _$IdentityDataFromJson(Map<String, dynamic> json) {
  return _IdentityData.fromJson(json);
}

/// @nodoc
class _$IdentityDataTearOff {
  const _$IdentityDataTearOff();

  _IdentityData call(
      {String realname = '',
      String username = '',
      String cryptedPassword = '',
      String hostname = ''}) {
    return _IdentityData(
      realname: realname,
      username: username,
      cryptedPassword: cryptedPassword,
      hostname: hostname,
    );
  }

  IdentityData fromJson(Map<String, Object> json) {
    return IdentityData.fromJson(json);
  }
}

/// @nodoc
const $IdentityData = _$IdentityDataTearOff();

/// @nodoc
mixin _$IdentityData {
  String get realname => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get cryptedPassword => throw _privateConstructorUsedError;
  String get hostname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentityDataCopyWith<IdentityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityDataCopyWith<$Res> {
  factory $IdentityDataCopyWith(
          IdentityData value, $Res Function(IdentityData) then) =
      _$IdentityDataCopyWithImpl<$Res>;
  $Res call(
      {String realname,
      String username,
      String cryptedPassword,
      String hostname});
}

/// @nodoc
class _$IdentityDataCopyWithImpl<$Res> implements $IdentityDataCopyWith<$Res> {
  _$IdentityDataCopyWithImpl(this._value, this._then);

  final IdentityData _value;
  // ignore: unused_field
  final $Res Function(IdentityData) _then;

  @override
  $Res call({
    Object? realname = freezed,
    Object? username = freezed,
    Object? cryptedPassword = freezed,
    Object? hostname = freezed,
  }) {
    return _then(_value.copyWith(
      realname: realname == freezed
          ? _value.realname
          : realname // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      cryptedPassword: cryptedPassword == freezed
          ? _value.cryptedPassword
          : cryptedPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$IdentityDataCopyWith<$Res>
    implements $IdentityDataCopyWith<$Res> {
  factory _$IdentityDataCopyWith(
          _IdentityData value, $Res Function(_IdentityData) then) =
      __$IdentityDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String realname,
      String username,
      String cryptedPassword,
      String hostname});
}

/// @nodoc
class __$IdentityDataCopyWithImpl<$Res> extends _$IdentityDataCopyWithImpl<$Res>
    implements _$IdentityDataCopyWith<$Res> {
  __$IdentityDataCopyWithImpl(
      _IdentityData _value, $Res Function(_IdentityData) _then)
      : super(_value, (v) => _then(v as _IdentityData));

  @override
  _IdentityData get _value => super._value as _IdentityData;

  @override
  $Res call({
    Object? realname = freezed,
    Object? username = freezed,
    Object? cryptedPassword = freezed,
    Object? hostname = freezed,
  }) {
    return _then(_IdentityData(
      realname: realname == freezed
          ? _value.realname
          : realname // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      cryptedPassword: cryptedPassword == freezed
          ? _value.cryptedPassword
          : cryptedPassword // ignore: cast_nullable_to_non_nullable
              as String,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdentityData implements _IdentityData {
  const _$_IdentityData(
      {this.realname = '',
      this.username = '',
      this.cryptedPassword = '',
      this.hostname = ''});

  factory _$_IdentityData.fromJson(Map<String, dynamic> json) =>
      _$_$_IdentityDataFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String realname;
  @JsonKey(defaultValue: '')
  @override
  final String username;
  @JsonKey(defaultValue: '')
  @override
  final String cryptedPassword;
  @JsonKey(defaultValue: '')
  @override
  final String hostname;

  @override
  String toString() {
    return 'IdentityData(realname: $realname, username: $username, cryptedPassword: $cryptedPassword, hostname: $hostname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IdentityData &&
            (identical(other.realname, realname) ||
                const DeepCollectionEquality()
                    .equals(other.realname, realname)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.cryptedPassword, cryptedPassword) ||
                const DeepCollectionEquality()
                    .equals(other.cryptedPassword, cryptedPassword)) &&
            (identical(other.hostname, hostname) ||
                const DeepCollectionEquality()
                    .equals(other.hostname, hostname)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(realname) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(cryptedPassword) ^
      const DeepCollectionEquality().hash(hostname);

  @JsonKey(ignore: true)
  @override
  _$IdentityDataCopyWith<_IdentityData> get copyWith =>
      __$IdentityDataCopyWithImpl<_IdentityData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IdentityDataToJson(this);
  }
}

abstract class _IdentityData implements IdentityData {
  const factory _IdentityData(
      {String realname,
      String username,
      String cryptedPassword,
      String hostname}) = _$_IdentityData;

  factory _IdentityData.fromJson(Map<String, dynamic> json) =
      _$_IdentityData.fromJson;

  @override
  String get realname => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get cryptedPassword => throw _privateConstructorUsedError;
  @override
  String get hostname => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IdentityDataCopyWith<_IdentityData> get copyWith =>
      throw _privateConstructorUsedError;
}

SSHData _$SSHDataFromJson(Map<String, dynamic> json) {
  return _SSHData.fromJson(json);
}

/// @nodoc
class _$SSHDataTearOff {
  const _$SSHDataTearOff();

  _SSHData call(
      {required bool installServer,
      required bool allowPw,
      List<String> authorizedKeys = const []}) {
    return _SSHData(
      installServer: installServer,
      allowPw: allowPw,
      authorizedKeys: authorizedKeys,
    );
  }

  SSHData fromJson(Map<String, Object> json) {
    return SSHData.fromJson(json);
  }
}

/// @nodoc
const $SSHData = _$SSHDataTearOff();

/// @nodoc
mixin _$SSHData {
  bool get installServer => throw _privateConstructorUsedError;
  bool get allowPw => throw _privateConstructorUsedError;
  List<String> get authorizedKeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SSHDataCopyWith<SSHData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SSHDataCopyWith<$Res> {
  factory $SSHDataCopyWith(SSHData value, $Res Function(SSHData) then) =
      _$SSHDataCopyWithImpl<$Res>;
  $Res call({bool installServer, bool allowPw, List<String> authorizedKeys});
}

/// @nodoc
class _$SSHDataCopyWithImpl<$Res> implements $SSHDataCopyWith<$Res> {
  _$SSHDataCopyWithImpl(this._value, this._then);

  final SSHData _value;
  // ignore: unused_field
  final $Res Function(SSHData) _then;

  @override
  $Res call({
    Object? installServer = freezed,
    Object? allowPw = freezed,
    Object? authorizedKeys = freezed,
  }) {
    return _then(_value.copyWith(
      installServer: installServer == freezed
          ? _value.installServer
          : installServer // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPw: allowPw == freezed
          ? _value.allowPw
          : allowPw // ignore: cast_nullable_to_non_nullable
              as bool,
      authorizedKeys: authorizedKeys == freezed
          ? _value.authorizedKeys
          : authorizedKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SSHDataCopyWith<$Res> implements $SSHDataCopyWith<$Res> {
  factory _$SSHDataCopyWith(_SSHData value, $Res Function(_SSHData) then) =
      __$SSHDataCopyWithImpl<$Res>;
  @override
  $Res call({bool installServer, bool allowPw, List<String> authorizedKeys});
}

/// @nodoc
class __$SSHDataCopyWithImpl<$Res> extends _$SSHDataCopyWithImpl<$Res>
    implements _$SSHDataCopyWith<$Res> {
  __$SSHDataCopyWithImpl(_SSHData _value, $Res Function(_SSHData) _then)
      : super(_value, (v) => _then(v as _SSHData));

  @override
  _SSHData get _value => super._value as _SSHData;

  @override
  $Res call({
    Object? installServer = freezed,
    Object? allowPw = freezed,
    Object? authorizedKeys = freezed,
  }) {
    return _then(_SSHData(
      installServer: installServer == freezed
          ? _value.installServer
          : installServer // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPw: allowPw == freezed
          ? _value.allowPw
          : allowPw // ignore: cast_nullable_to_non_nullable
              as bool,
      authorizedKeys: authorizedKeys == freezed
          ? _value.authorizedKeys
          : authorizedKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SSHData implements _SSHData {
  const _$_SSHData(
      {required this.installServer,
      required this.allowPw,
      this.authorizedKeys = const []});

  factory _$_SSHData.fromJson(Map<String, dynamic> json) =>
      _$_$_SSHDataFromJson(json);

  @override
  final bool installServer;
  @override
  final bool allowPw;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> authorizedKeys;

  @override
  String toString() {
    return 'SSHData(installServer: $installServer, allowPw: $allowPw, authorizedKeys: $authorizedKeys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SSHData &&
            (identical(other.installServer, installServer) ||
                const DeepCollectionEquality()
                    .equals(other.installServer, installServer)) &&
            (identical(other.allowPw, allowPw) ||
                const DeepCollectionEquality()
                    .equals(other.allowPw, allowPw)) &&
            (identical(other.authorizedKeys, authorizedKeys) ||
                const DeepCollectionEquality()
                    .equals(other.authorizedKeys, authorizedKeys)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(installServer) ^
      const DeepCollectionEquality().hash(allowPw) ^
      const DeepCollectionEquality().hash(authorizedKeys);

  @JsonKey(ignore: true)
  @override
  _$SSHDataCopyWith<_SSHData> get copyWith =>
      __$SSHDataCopyWithImpl<_SSHData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SSHDataToJson(this);
  }
}

abstract class _SSHData implements SSHData {
  const factory _SSHData(
      {required bool installServer,
      required bool allowPw,
      List<String> authorizedKeys}) = _$_SSHData;

  factory _SSHData.fromJson(Map<String, dynamic> json) = _$_SSHData.fromJson;

  @override
  bool get installServer => throw _privateConstructorUsedError;
  @override
  bool get allowPw => throw _privateConstructorUsedError;
  @override
  List<String> get authorizedKeys => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SSHDataCopyWith<_SSHData> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelSnapInfo _$ChannelSnapInfoFromJson(Map<String, dynamic> json) {
  return _ChannelSnapInfo.fromJson(json);
}

/// @nodoc
class _$ChannelSnapInfoTearOff {
  const _$ChannelSnapInfoTearOff();

  _ChannelSnapInfo call(
      {required String channelName,
      required String revision,
      required String confinement,
      required String version,
      required int size,
      required DateTime releasedAt}) {
    return _ChannelSnapInfo(
      channelName: channelName,
      revision: revision,
      confinement: confinement,
      version: version,
      size: size,
      releasedAt: releasedAt,
    );
  }

  ChannelSnapInfo fromJson(Map<String, Object> json) {
    return ChannelSnapInfo.fromJson(json);
  }
}

/// @nodoc
const $ChannelSnapInfo = _$ChannelSnapInfoTearOff();

/// @nodoc
mixin _$ChannelSnapInfo {
  String get channelName => throw _privateConstructorUsedError;
  String get revision => throw _privateConstructorUsedError;
  String get confinement => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  DateTime get releasedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelSnapInfoCopyWith<ChannelSnapInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelSnapInfoCopyWith<$Res> {
  factory $ChannelSnapInfoCopyWith(
          ChannelSnapInfo value, $Res Function(ChannelSnapInfo) then) =
      _$ChannelSnapInfoCopyWithImpl<$Res>;
  $Res call(
      {String channelName,
      String revision,
      String confinement,
      String version,
      int size,
      DateTime releasedAt});
}

/// @nodoc
class _$ChannelSnapInfoCopyWithImpl<$Res>
    implements $ChannelSnapInfoCopyWith<$Res> {
  _$ChannelSnapInfoCopyWithImpl(this._value, this._then);

  final ChannelSnapInfo _value;
  // ignore: unused_field
  final $Res Function(ChannelSnapInfo) _then;

  @override
  $Res call({
    Object? channelName = freezed,
    Object? revision = freezed,
    Object? confinement = freezed,
    Object? version = freezed,
    Object? size = freezed,
    Object? releasedAt = freezed,
  }) {
    return _then(_value.copyWith(
      channelName: channelName == freezed
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String,
      confinement: confinement == freezed
          ? _value.confinement
          : confinement // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      releasedAt: releasedAt == freezed
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ChannelSnapInfoCopyWith<$Res>
    implements $ChannelSnapInfoCopyWith<$Res> {
  factory _$ChannelSnapInfoCopyWith(
          _ChannelSnapInfo value, $Res Function(_ChannelSnapInfo) then) =
      __$ChannelSnapInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String channelName,
      String revision,
      String confinement,
      String version,
      int size,
      DateTime releasedAt});
}

/// @nodoc
class __$ChannelSnapInfoCopyWithImpl<$Res>
    extends _$ChannelSnapInfoCopyWithImpl<$Res>
    implements _$ChannelSnapInfoCopyWith<$Res> {
  __$ChannelSnapInfoCopyWithImpl(
      _ChannelSnapInfo _value, $Res Function(_ChannelSnapInfo) _then)
      : super(_value, (v) => _then(v as _ChannelSnapInfo));

  @override
  _ChannelSnapInfo get _value => super._value as _ChannelSnapInfo;

  @override
  $Res call({
    Object? channelName = freezed,
    Object? revision = freezed,
    Object? confinement = freezed,
    Object? version = freezed,
    Object? size = freezed,
    Object? releasedAt = freezed,
  }) {
    return _then(_ChannelSnapInfo(
      channelName: channelName == freezed
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String,
      confinement: confinement == freezed
          ? _value.confinement
          : confinement // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      releasedAt: releasedAt == freezed
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelSnapInfo implements _ChannelSnapInfo {
  const _$_ChannelSnapInfo(
      {required this.channelName,
      required this.revision,
      required this.confinement,
      required this.version,
      required this.size,
      required this.releasedAt});

  factory _$_ChannelSnapInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_ChannelSnapInfoFromJson(json);

  @override
  final String channelName;
  @override
  final String revision;
  @override
  final String confinement;
  @override
  final String version;
  @override
  final int size;
  @override
  final DateTime releasedAt;

  @override
  String toString() {
    return 'ChannelSnapInfo(channelName: $channelName, revision: $revision, confinement: $confinement, version: $version, size: $size, releasedAt: $releasedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChannelSnapInfo &&
            (identical(other.channelName, channelName) ||
                const DeepCollectionEquality()
                    .equals(other.channelName, channelName)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.confinement, confinement) ||
                const DeepCollectionEquality()
                    .equals(other.confinement, confinement)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.releasedAt, releasedAt) ||
                const DeepCollectionEquality()
                    .equals(other.releasedAt, releasedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(channelName) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(confinement) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(releasedAt);

  @JsonKey(ignore: true)
  @override
  _$ChannelSnapInfoCopyWith<_ChannelSnapInfo> get copyWith =>
      __$ChannelSnapInfoCopyWithImpl<_ChannelSnapInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChannelSnapInfoToJson(this);
  }
}

abstract class _ChannelSnapInfo implements ChannelSnapInfo {
  const factory _ChannelSnapInfo(
      {required String channelName,
      required String revision,
      required String confinement,
      required String version,
      required int size,
      required DateTime releasedAt}) = _$_ChannelSnapInfo;

  factory _ChannelSnapInfo.fromJson(Map<String, dynamic> json) =
      _$_ChannelSnapInfo.fromJson;

  @override
  String get channelName => throw _privateConstructorUsedError;
  @override
  String get revision => throw _privateConstructorUsedError;
  @override
  String get confinement => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  int get size => throw _privateConstructorUsedError;
  @override
  DateTime get releasedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelSnapInfoCopyWith<_ChannelSnapInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

SnapInfo _$SnapInfoFromJson(Map<String, dynamic> json) {
  return _SnapInfo.fromJson(json);
}

/// @nodoc
class _$SnapInfoTearOff {
  const _$SnapInfoTearOff();

  _SnapInfo call(
      {required String name,
      String summary = '',
      String publisher = '',
      bool verified = false,
      bool starred = false,
      String description = '',
      String confinement = '',
      String license = '',
      List<ChannelSnapInfo> channels = const []}) {
    return _SnapInfo(
      name: name,
      summary: summary,
      publisher: publisher,
      verified: verified,
      starred: starred,
      description: description,
      confinement: confinement,
      license: license,
      channels: channels,
    );
  }

  SnapInfo fromJson(Map<String, Object> json) {
    return SnapInfo.fromJson(json);
  }
}

/// @nodoc
const $SnapInfo = _$SnapInfoTearOff();

/// @nodoc
mixin _$SnapInfo {
  String get name => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get confinement => throw _privateConstructorUsedError;
  String get license => throw _privateConstructorUsedError;
  List<ChannelSnapInfo> get channels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapInfoCopyWith<SnapInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapInfoCopyWith<$Res> {
  factory $SnapInfoCopyWith(SnapInfo value, $Res Function(SnapInfo) then) =
      _$SnapInfoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String summary,
      String publisher,
      bool verified,
      bool starred,
      String description,
      String confinement,
      String license,
      List<ChannelSnapInfo> channels});
}

/// @nodoc
class _$SnapInfoCopyWithImpl<$Res> implements $SnapInfoCopyWith<$Res> {
  _$SnapInfoCopyWithImpl(this._value, this._then);

  final SnapInfo _value;
  // ignore: unused_field
  final $Res Function(SnapInfo) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? summary = freezed,
    Object? publisher = freezed,
    Object? verified = freezed,
    Object? starred = freezed,
    Object? description = freezed,
    Object? confinement = freezed,
    Object? license = freezed,
    Object? channels = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confinement: confinement == freezed
          ? _value.confinement
          : confinement // ignore: cast_nullable_to_non_nullable
              as String,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
      channels: channels == freezed
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<ChannelSnapInfo>,
    ));
  }
}

/// @nodoc
abstract class _$SnapInfoCopyWith<$Res> implements $SnapInfoCopyWith<$Res> {
  factory _$SnapInfoCopyWith(_SnapInfo value, $Res Function(_SnapInfo) then) =
      __$SnapInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String summary,
      String publisher,
      bool verified,
      bool starred,
      String description,
      String confinement,
      String license,
      List<ChannelSnapInfo> channels});
}

/// @nodoc
class __$SnapInfoCopyWithImpl<$Res> extends _$SnapInfoCopyWithImpl<$Res>
    implements _$SnapInfoCopyWith<$Res> {
  __$SnapInfoCopyWithImpl(_SnapInfo _value, $Res Function(_SnapInfo) _then)
      : super(_value, (v) => _then(v as _SnapInfo));

  @override
  _SnapInfo get _value => super._value as _SnapInfo;

  @override
  $Res call({
    Object? name = freezed,
    Object? summary = freezed,
    Object? publisher = freezed,
    Object? verified = freezed,
    Object? starred = freezed,
    Object? description = freezed,
    Object? confinement = freezed,
    Object? license = freezed,
    Object? channels = freezed,
  }) {
    return _then(_SnapInfo(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confinement: confinement == freezed
          ? _value.confinement
          : confinement // ignore: cast_nullable_to_non_nullable
              as String,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
      channels: channels == freezed
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<ChannelSnapInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SnapInfo implements _SnapInfo {
  const _$_SnapInfo(
      {required this.name,
      this.summary = '',
      this.publisher = '',
      this.verified = false,
      this.starred = false,
      this.description = '',
      this.confinement = '',
      this.license = '',
      this.channels = const []});

  factory _$_SnapInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_SnapInfoFromJson(json);

  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String summary;
  @JsonKey(defaultValue: '')
  @override
  final String publisher;
  @JsonKey(defaultValue: false)
  @override
  final bool verified;
  @JsonKey(defaultValue: false)
  @override
  final bool starred;
  @JsonKey(defaultValue: '')
  @override
  final String description;
  @JsonKey(defaultValue: '')
  @override
  final String confinement;
  @JsonKey(defaultValue: '')
  @override
  final String license;
  @JsonKey(defaultValue: const [])
  @override
  final List<ChannelSnapInfo> channels;

  @override
  String toString() {
    return 'SnapInfo(name: $name, summary: $summary, publisher: $publisher, verified: $verified, starred: $starred, description: $description, confinement: $confinement, license: $license, channels: $channels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SnapInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.publisher, publisher) ||
                const DeepCollectionEquality()
                    .equals(other.publisher, publisher)) &&
            (identical(other.verified, verified) ||
                const DeepCollectionEquality()
                    .equals(other.verified, verified)) &&
            (identical(other.starred, starred) ||
                const DeepCollectionEquality()
                    .equals(other.starred, starred)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.confinement, confinement) ||
                const DeepCollectionEquality()
                    .equals(other.confinement, confinement)) &&
            (identical(other.license, license) ||
                const DeepCollectionEquality()
                    .equals(other.license, license)) &&
            (identical(other.channels, channels) ||
                const DeepCollectionEquality()
                    .equals(other.channels, channels)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(publisher) ^
      const DeepCollectionEquality().hash(verified) ^
      const DeepCollectionEquality().hash(starred) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(confinement) ^
      const DeepCollectionEquality().hash(license) ^
      const DeepCollectionEquality().hash(channels);

  @JsonKey(ignore: true)
  @override
  _$SnapInfoCopyWith<_SnapInfo> get copyWith =>
      __$SnapInfoCopyWithImpl<_SnapInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SnapInfoToJson(this);
  }
}

abstract class _SnapInfo implements SnapInfo {
  const factory _SnapInfo(
      {required String name,
      String summary,
      String publisher,
      bool verified,
      bool starred,
      String description,
      String confinement,
      String license,
      List<ChannelSnapInfo> channels}) = _$_SnapInfo;

  factory _SnapInfo.fromJson(Map<String, dynamic> json) = _$_SnapInfo.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get summary => throw _privateConstructorUsedError;
  @override
  String get publisher => throw _privateConstructorUsedError;
  @override
  bool get verified => throw _privateConstructorUsedError;
  @override
  bool get starred => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get confinement => throw _privateConstructorUsedError;
  @override
  String get license => throw _privateConstructorUsedError;
  @override
  List<ChannelSnapInfo> get channels => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SnapInfoCopyWith<_SnapInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

DriversResponse _$DriversResponseFromJson(Map<String, dynamic> json) {
  return _DriversResponse.fromJson(json);
}

/// @nodoc
class _$DriversResponseTearOff {
  const _$DriversResponseTearOff();

  _DriversResponse call(
      {required bool install,
      required List<String>? drivers,
      required bool localOnly,
      required bool searchDrivers}) {
    return _DriversResponse(
      install: install,
      drivers: drivers,
      localOnly: localOnly,
      searchDrivers: searchDrivers,
    );
  }

  DriversResponse fromJson(Map<String, Object> json) {
    return DriversResponse.fromJson(json);
  }
}

/// @nodoc
const $DriversResponse = _$DriversResponseTearOff();

/// @nodoc
mixin _$DriversResponse {
  bool get install => throw _privateConstructorUsedError;
  List<String>? get drivers => throw _privateConstructorUsedError;
  bool get localOnly => throw _privateConstructorUsedError;
  bool get searchDrivers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriversResponseCopyWith<DriversResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriversResponseCopyWith<$Res> {
  factory $DriversResponseCopyWith(
          DriversResponse value, $Res Function(DriversResponse) then) =
      _$DriversResponseCopyWithImpl<$Res>;
  $Res call(
      {bool install,
      List<String>? drivers,
      bool localOnly,
      bool searchDrivers});
}

/// @nodoc
class _$DriversResponseCopyWithImpl<$Res>
    implements $DriversResponseCopyWith<$Res> {
  _$DriversResponseCopyWithImpl(this._value, this._then);

  final DriversResponse _value;
  // ignore: unused_field
  final $Res Function(DriversResponse) _then;

  @override
  $Res call({
    Object? install = freezed,
    Object? drivers = freezed,
    Object? localOnly = freezed,
    Object? searchDrivers = freezed,
  }) {
    return _then(_value.copyWith(
      install: install == freezed
          ? _value.install
          : install // ignore: cast_nullable_to_non_nullable
              as bool,
      drivers: drivers == freezed
          ? _value.drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      localOnly: localOnly == freezed
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      searchDrivers: searchDrivers == freezed
          ? _value.searchDrivers
          : searchDrivers // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DriversResponseCopyWith<$Res>
    implements $DriversResponseCopyWith<$Res> {
  factory _$DriversResponseCopyWith(
          _DriversResponse value, $Res Function(_DriversResponse) then) =
      __$DriversResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool install,
      List<String>? drivers,
      bool localOnly,
      bool searchDrivers});
}

/// @nodoc
class __$DriversResponseCopyWithImpl<$Res>
    extends _$DriversResponseCopyWithImpl<$Res>
    implements _$DriversResponseCopyWith<$Res> {
  __$DriversResponseCopyWithImpl(
      _DriversResponse _value, $Res Function(_DriversResponse) _then)
      : super(_value, (v) => _then(v as _DriversResponse));

  @override
  _DriversResponse get _value => super._value as _DriversResponse;

  @override
  $Res call({
    Object? install = freezed,
    Object? drivers = freezed,
    Object? localOnly = freezed,
    Object? searchDrivers = freezed,
  }) {
    return _then(_DriversResponse(
      install: install == freezed
          ? _value.install
          : install // ignore: cast_nullable_to_non_nullable
              as bool,
      drivers: drivers == freezed
          ? _value.drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      localOnly: localOnly == freezed
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      searchDrivers: searchDrivers == freezed
          ? _value.searchDrivers
          : searchDrivers // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DriversResponse implements _DriversResponse {
  const _$_DriversResponse(
      {required this.install,
      required this.drivers,
      required this.localOnly,
      required this.searchDrivers});

  factory _$_DriversResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_DriversResponseFromJson(json);

  @override
  final bool install;
  @override
  final List<String>? drivers;
  @override
  final bool localOnly;
  @override
  final bool searchDrivers;

  @override
  String toString() {
    return 'DriversResponse(install: $install, drivers: $drivers, localOnly: $localOnly, searchDrivers: $searchDrivers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DriversResponse &&
            (identical(other.install, install) ||
                const DeepCollectionEquality()
                    .equals(other.install, install)) &&
            (identical(other.drivers, drivers) ||
                const DeepCollectionEquality()
                    .equals(other.drivers, drivers)) &&
            (identical(other.localOnly, localOnly) ||
                const DeepCollectionEquality()
                    .equals(other.localOnly, localOnly)) &&
            (identical(other.searchDrivers, searchDrivers) ||
                const DeepCollectionEquality()
                    .equals(other.searchDrivers, searchDrivers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(install) ^
      const DeepCollectionEquality().hash(drivers) ^
      const DeepCollectionEquality().hash(localOnly) ^
      const DeepCollectionEquality().hash(searchDrivers);

  @JsonKey(ignore: true)
  @override
  _$DriversResponseCopyWith<_DriversResponse> get copyWith =>
      __$DriversResponseCopyWithImpl<_DriversResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DriversResponseToJson(this);
  }
}

abstract class _DriversResponse implements DriversResponse {
  const factory _DriversResponse(
      {required bool install,
      required List<String>? drivers,
      required bool localOnly,
      required bool searchDrivers}) = _$_DriversResponse;

  factory _DriversResponse.fromJson(Map<String, dynamic> json) =
      _$_DriversResponse.fromJson;

  @override
  bool get install => throw _privateConstructorUsedError;
  @override
  List<String>? get drivers => throw _privateConstructorUsedError;
  @override
  bool get localOnly => throw _privateConstructorUsedError;
  @override
  bool get searchDrivers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DriversResponseCopyWith<_DriversResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DriversPayload _$DriversPayloadFromJson(Map<String, dynamic> json) {
  return _DriversPayload.fromJson(json);
}

/// @nodoc
class _$DriversPayloadTearOff {
  const _$DriversPayloadTearOff();

  _DriversPayload call({required bool install}) {
    return _DriversPayload(
      install: install,
    );
  }

  DriversPayload fromJson(Map<String, Object> json) {
    return DriversPayload.fromJson(json);
  }
}

/// @nodoc
const $DriversPayload = _$DriversPayloadTearOff();

/// @nodoc
mixin _$DriversPayload {
  bool get install => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriversPayloadCopyWith<DriversPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriversPayloadCopyWith<$Res> {
  factory $DriversPayloadCopyWith(
          DriversPayload value, $Res Function(DriversPayload) then) =
      _$DriversPayloadCopyWithImpl<$Res>;
  $Res call({bool install});
}

/// @nodoc
class _$DriversPayloadCopyWithImpl<$Res>
    implements $DriversPayloadCopyWith<$Res> {
  _$DriversPayloadCopyWithImpl(this._value, this._then);

  final DriversPayload _value;
  // ignore: unused_field
  final $Res Function(DriversPayload) _then;

  @override
  $Res call({
    Object? install = freezed,
  }) {
    return _then(_value.copyWith(
      install: install == freezed
          ? _value.install
          : install // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DriversPayloadCopyWith<$Res>
    implements $DriversPayloadCopyWith<$Res> {
  factory _$DriversPayloadCopyWith(
          _DriversPayload value, $Res Function(_DriversPayload) then) =
      __$DriversPayloadCopyWithImpl<$Res>;
  @override
  $Res call({bool install});
}

/// @nodoc
class __$DriversPayloadCopyWithImpl<$Res>
    extends _$DriversPayloadCopyWithImpl<$Res>
    implements _$DriversPayloadCopyWith<$Res> {
  __$DriversPayloadCopyWithImpl(
      _DriversPayload _value, $Res Function(_DriversPayload) _then)
      : super(_value, (v) => _then(v as _DriversPayload));

  @override
  _DriversPayload get _value => super._value as _DriversPayload;

  @override
  $Res call({
    Object? install = freezed,
  }) {
    return _then(_DriversPayload(
      install: install == freezed
          ? _value.install
          : install // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DriversPayload implements _DriversPayload {
  const _$_DriversPayload({required this.install});

  factory _$_DriversPayload.fromJson(Map<String, dynamic> json) =>
      _$_$_DriversPayloadFromJson(json);

  @override
  final bool install;

  @override
  String toString() {
    return 'DriversPayload(install: $install)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DriversPayload &&
            (identical(other.install, install) ||
                const DeepCollectionEquality().equals(other.install, install)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(install);

  @JsonKey(ignore: true)
  @override
  _$DriversPayloadCopyWith<_DriversPayload> get copyWith =>
      __$DriversPayloadCopyWithImpl<_DriversPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DriversPayloadToJson(this);
  }
}

abstract class _DriversPayload implements DriversPayload {
  const factory _DriversPayload({required bool install}) = _$_DriversPayload;

  factory _DriversPayload.fromJson(Map<String, dynamic> json) =
      _$_DriversPayload.fromJson;

  @override
  bool get install => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DriversPayloadCopyWith<_DriversPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

SnapSelection _$SnapSelectionFromJson(Map<String, dynamic> json) {
  return _SnapSelection.fromJson(json);
}

/// @nodoc
class _$SnapSelectionTearOff {
  const _$SnapSelectionTearOff();

  _SnapSelection call(
      {required String name, required String channel, bool classic = false}) {
    return _SnapSelection(
      name: name,
      channel: channel,
      classic: classic,
    );
  }

  SnapSelection fromJson(Map<String, Object> json) {
    return SnapSelection.fromJson(json);
  }
}

/// @nodoc
const $SnapSelection = _$SnapSelectionTearOff();

/// @nodoc
mixin _$SnapSelection {
  String get name => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  bool get classic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapSelectionCopyWith<SnapSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapSelectionCopyWith<$Res> {
  factory $SnapSelectionCopyWith(
          SnapSelection value, $Res Function(SnapSelection) then) =
      _$SnapSelectionCopyWithImpl<$Res>;
  $Res call({String name, String channel, bool classic});
}

/// @nodoc
class _$SnapSelectionCopyWithImpl<$Res>
    implements $SnapSelectionCopyWith<$Res> {
  _$SnapSelectionCopyWithImpl(this._value, this._then);

  final SnapSelection _value;
  // ignore: unused_field
  final $Res Function(SnapSelection) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? channel = freezed,
    Object? classic = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      classic: classic == freezed
          ? _value.classic
          : classic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SnapSelectionCopyWith<$Res>
    implements $SnapSelectionCopyWith<$Res> {
  factory _$SnapSelectionCopyWith(
          _SnapSelection value, $Res Function(_SnapSelection) then) =
      __$SnapSelectionCopyWithImpl<$Res>;
  @override
  $Res call({String name, String channel, bool classic});
}

/// @nodoc
class __$SnapSelectionCopyWithImpl<$Res>
    extends _$SnapSelectionCopyWithImpl<$Res>
    implements _$SnapSelectionCopyWith<$Res> {
  __$SnapSelectionCopyWithImpl(
      _SnapSelection _value, $Res Function(_SnapSelection) _then)
      : super(_value, (v) => _then(v as _SnapSelection));

  @override
  _SnapSelection get _value => super._value as _SnapSelection;

  @override
  $Res call({
    Object? name = freezed,
    Object? channel = freezed,
    Object? classic = freezed,
  }) {
    return _then(_SnapSelection(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      classic: classic == freezed
          ? _value.classic
          : classic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SnapSelection implements _SnapSelection {
  const _$_SnapSelection(
      {required this.name, required this.channel, this.classic = false});

  factory _$_SnapSelection.fromJson(Map<String, dynamic> json) =>
      _$_$_SnapSelectionFromJson(json);

  @override
  final String name;
  @override
  final String channel;
  @JsonKey(defaultValue: false)
  @override
  final bool classic;

  @override
  String toString() {
    return 'SnapSelection(name: $name, channel: $channel, classic: $classic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SnapSelection &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality()
                    .equals(other.channel, channel)) &&
            (identical(other.classic, classic) ||
                const DeepCollectionEquality().equals(other.classic, classic)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(channel) ^
      const DeepCollectionEquality().hash(classic);

  @JsonKey(ignore: true)
  @override
  _$SnapSelectionCopyWith<_SnapSelection> get copyWith =>
      __$SnapSelectionCopyWithImpl<_SnapSelection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SnapSelectionToJson(this);
  }
}

abstract class _SnapSelection implements SnapSelection {
  const factory _SnapSelection(
      {required String name,
      required String channel,
      bool classic}) = _$_SnapSelection;

  factory _SnapSelection.fromJson(Map<String, dynamic> json) =
      _$_SnapSelection.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get channel => throw _privateConstructorUsedError;
  @override
  bool get classic => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SnapSelectionCopyWith<_SnapSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

SnapListResponse _$SnapListResponseFromJson(Map<String, dynamic> json) {
  return _SnapListResponse.fromJson(json);
}

/// @nodoc
class _$SnapListResponseTearOff {
  const _$SnapListResponseTearOff();

  _SnapListResponse call(
      {required SnapCheckState status,
      List<SnapInfo> snaps = const [],
      List<SnapSelection> selections = const []}) {
    return _SnapListResponse(
      status: status,
      snaps: snaps,
      selections: selections,
    );
  }

  SnapListResponse fromJson(Map<String, Object> json) {
    return SnapListResponse.fromJson(json);
  }
}

/// @nodoc
const $SnapListResponse = _$SnapListResponseTearOff();

/// @nodoc
mixin _$SnapListResponse {
  SnapCheckState get status => throw _privateConstructorUsedError;
  List<SnapInfo> get snaps => throw _privateConstructorUsedError;
  List<SnapSelection> get selections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapListResponseCopyWith<SnapListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapListResponseCopyWith<$Res> {
  factory $SnapListResponseCopyWith(
          SnapListResponse value, $Res Function(SnapListResponse) then) =
      _$SnapListResponseCopyWithImpl<$Res>;
  $Res call(
      {SnapCheckState status,
      List<SnapInfo> snaps,
      List<SnapSelection> selections});
}

/// @nodoc
class _$SnapListResponseCopyWithImpl<$Res>
    implements $SnapListResponseCopyWith<$Res> {
  _$SnapListResponseCopyWithImpl(this._value, this._then);

  final SnapListResponse _value;
  // ignore: unused_field
  final $Res Function(SnapListResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? snaps = freezed,
    Object? selections = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SnapCheckState,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<SnapInfo>,
      selections: selections == freezed
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<SnapSelection>,
    ));
  }
}

/// @nodoc
abstract class _$SnapListResponseCopyWith<$Res>
    implements $SnapListResponseCopyWith<$Res> {
  factory _$SnapListResponseCopyWith(
          _SnapListResponse value, $Res Function(_SnapListResponse) then) =
      __$SnapListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {SnapCheckState status,
      List<SnapInfo> snaps,
      List<SnapSelection> selections});
}

/// @nodoc
class __$SnapListResponseCopyWithImpl<$Res>
    extends _$SnapListResponseCopyWithImpl<$Res>
    implements _$SnapListResponseCopyWith<$Res> {
  __$SnapListResponseCopyWithImpl(
      _SnapListResponse _value, $Res Function(_SnapListResponse) _then)
      : super(_value, (v) => _then(v as _SnapListResponse));

  @override
  _SnapListResponse get _value => super._value as _SnapListResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? snaps = freezed,
    Object? selections = freezed,
  }) {
    return _then(_SnapListResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SnapCheckState,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<SnapInfo>,
      selections: selections == freezed
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<SnapSelection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SnapListResponse implements _SnapListResponse {
  const _$_SnapListResponse(
      {required this.status,
      this.snaps = const [],
      this.selections = const []});

  factory _$_SnapListResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SnapListResponseFromJson(json);

  @override
  final SnapCheckState status;
  @JsonKey(defaultValue: const [])
  @override
  final List<SnapInfo> snaps;
  @JsonKey(defaultValue: const [])
  @override
  final List<SnapSelection> selections;

  @override
  String toString() {
    return 'SnapListResponse(status: $status, snaps: $snaps, selections: $selections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SnapListResponse &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.snaps, snaps) ||
                const DeepCollectionEquality().equals(other.snaps, snaps)) &&
            (identical(other.selections, selections) ||
                const DeepCollectionEquality()
                    .equals(other.selections, selections)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(snaps) ^
      const DeepCollectionEquality().hash(selections);

  @JsonKey(ignore: true)
  @override
  _$SnapListResponseCopyWith<_SnapListResponse> get copyWith =>
      __$SnapListResponseCopyWithImpl<_SnapListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SnapListResponseToJson(this);
  }
}

abstract class _SnapListResponse implements SnapListResponse {
  const factory _SnapListResponse(
      {required SnapCheckState status,
      List<SnapInfo> snaps,
      List<SnapSelection> selections}) = _$_SnapListResponse;

  factory _SnapListResponse.fromJson(Map<String, dynamic> json) =
      _$_SnapListResponse.fromJson;

  @override
  SnapCheckState get status => throw _privateConstructorUsedError;
  @override
  List<SnapInfo> get snaps => throw _privateConstructorUsedError;
  @override
  List<SnapSelection> get selections => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SnapListResponseCopyWith<_SnapListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeZoneInfo _$TimeZoneInfoFromJson(Map<String, dynamic> json) {
  return _TimeZoneInfo.fromJson(json);
}

/// @nodoc
class _$TimeZoneInfoTearOff {
  const _$TimeZoneInfoTearOff();

  _TimeZoneInfo call({required String timezone, required bool fromGeoip}) {
    return _TimeZoneInfo(
      timezone: timezone,
      fromGeoip: fromGeoip,
    );
  }

  TimeZoneInfo fromJson(Map<String, Object> json) {
    return TimeZoneInfo.fromJson(json);
  }
}

/// @nodoc
const $TimeZoneInfo = _$TimeZoneInfoTearOff();

/// @nodoc
mixin _$TimeZoneInfo {
  String get timezone => throw _privateConstructorUsedError;
  bool get fromGeoip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeZoneInfoCopyWith<TimeZoneInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeZoneInfoCopyWith<$Res> {
  factory $TimeZoneInfoCopyWith(
          TimeZoneInfo value, $Res Function(TimeZoneInfo) then) =
      _$TimeZoneInfoCopyWithImpl<$Res>;
  $Res call({String timezone, bool fromGeoip});
}

/// @nodoc
class _$TimeZoneInfoCopyWithImpl<$Res> implements $TimeZoneInfoCopyWith<$Res> {
  _$TimeZoneInfoCopyWithImpl(this._value, this._then);

  final TimeZoneInfo _value;
  // ignore: unused_field
  final $Res Function(TimeZoneInfo) _then;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? fromGeoip = freezed,
  }) {
    return _then(_value.copyWith(
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      fromGeoip: fromGeoip == freezed
          ? _value.fromGeoip
          : fromGeoip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TimeZoneInfoCopyWith<$Res>
    implements $TimeZoneInfoCopyWith<$Res> {
  factory _$TimeZoneInfoCopyWith(
          _TimeZoneInfo value, $Res Function(_TimeZoneInfo) then) =
      __$TimeZoneInfoCopyWithImpl<$Res>;
  @override
  $Res call({String timezone, bool fromGeoip});
}

/// @nodoc
class __$TimeZoneInfoCopyWithImpl<$Res> extends _$TimeZoneInfoCopyWithImpl<$Res>
    implements _$TimeZoneInfoCopyWith<$Res> {
  __$TimeZoneInfoCopyWithImpl(
      _TimeZoneInfo _value, $Res Function(_TimeZoneInfo) _then)
      : super(_value, (v) => _then(v as _TimeZoneInfo));

  @override
  _TimeZoneInfo get _value => super._value as _TimeZoneInfo;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? fromGeoip = freezed,
  }) {
    return _then(_TimeZoneInfo(
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      fromGeoip: fromGeoip == freezed
          ? _value.fromGeoip
          : fromGeoip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeZoneInfo implements _TimeZoneInfo {
  const _$_TimeZoneInfo({required this.timezone, required this.fromGeoip});

  factory _$_TimeZoneInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_TimeZoneInfoFromJson(json);

  @override
  final String timezone;
  @override
  final bool fromGeoip;

  @override
  String toString() {
    return 'TimeZoneInfo(timezone: $timezone, fromGeoip: $fromGeoip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimeZoneInfo &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.fromGeoip, fromGeoip) ||
                const DeepCollectionEquality()
                    .equals(other.fromGeoip, fromGeoip)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(fromGeoip);

  @JsonKey(ignore: true)
  @override
  _$TimeZoneInfoCopyWith<_TimeZoneInfo> get copyWith =>
      __$TimeZoneInfoCopyWithImpl<_TimeZoneInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimeZoneInfoToJson(this);
  }
}

abstract class _TimeZoneInfo implements TimeZoneInfo {
  const factory _TimeZoneInfo(
      {required String timezone, required bool fromGeoip}) = _$_TimeZoneInfo;

  factory _TimeZoneInfo.fromJson(Map<String, dynamic> json) =
      _$_TimeZoneInfo.fromJson;

  @override
  String get timezone => throw _privateConstructorUsedError;
  @override
  bool get fromGeoip => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimeZoneInfoCopyWith<_TimeZoneInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProInfo _$UbuntuProInfoFromJson(Map<String, dynamic> json) {
  return _UbuntuProInfo.fromJson(json);
}

/// @nodoc
class _$UbuntuProInfoTearOff {
  const _$UbuntuProInfoTearOff();

  _UbuntuProInfo call({required String token}) {
    return _UbuntuProInfo(
      token: token,
    );
  }

  UbuntuProInfo fromJson(Map<String, Object> json) {
    return UbuntuProInfo.fromJson(json);
  }
}

/// @nodoc
const $UbuntuProInfo = _$UbuntuProInfoTearOff();

/// @nodoc
mixin _$UbuntuProInfo {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UbuntuProInfoCopyWith<UbuntuProInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbuntuProInfoCopyWith<$Res> {
  factory $UbuntuProInfoCopyWith(
          UbuntuProInfo value, $Res Function(UbuntuProInfo) then) =
      _$UbuntuProInfoCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class _$UbuntuProInfoCopyWithImpl<$Res>
    implements $UbuntuProInfoCopyWith<$Res> {
  _$UbuntuProInfoCopyWithImpl(this._value, this._then);

  final UbuntuProInfo _value;
  // ignore: unused_field
  final $Res Function(UbuntuProInfo) _then;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UbuntuProInfoCopyWith<$Res>
    implements $UbuntuProInfoCopyWith<$Res> {
  factory _$UbuntuProInfoCopyWith(
          _UbuntuProInfo value, $Res Function(_UbuntuProInfo) then) =
      __$UbuntuProInfoCopyWithImpl<$Res>;
  @override
  $Res call({String token});
}

/// @nodoc
class __$UbuntuProInfoCopyWithImpl<$Res>
    extends _$UbuntuProInfoCopyWithImpl<$Res>
    implements _$UbuntuProInfoCopyWith<$Res> {
  __$UbuntuProInfoCopyWithImpl(
      _UbuntuProInfo _value, $Res Function(_UbuntuProInfo) _then)
      : super(_value, (v) => _then(v as _UbuntuProInfo));

  @override
  _UbuntuProInfo get _value => super._value as _UbuntuProInfo;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_UbuntuProInfo(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProInfo implements _UbuntuProInfo {
  const _$_UbuntuProInfo({required this.token});

  factory _$_UbuntuProInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_UbuntuProInfoFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'UbuntuProInfo(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UbuntuProInfo &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$UbuntuProInfoCopyWith<_UbuntuProInfo> get copyWith =>
      __$UbuntuProInfoCopyWithImpl<_UbuntuProInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UbuntuProInfoToJson(this);
  }
}

abstract class _UbuntuProInfo implements UbuntuProInfo {
  const factory _UbuntuProInfo({required String token}) = _$_UbuntuProInfo;

  factory _UbuntuProInfo.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProInfo.fromJson;

  @override
  String get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UbuntuProInfoCopyWith<_UbuntuProInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProService _$UbuntuProServiceFromJson(Map<String, dynamic> json) {
  return _UbuntuProService.fromJson(json);
}

/// @nodoc
class _$UbuntuProServiceTearOff {
  const _$UbuntuProServiceTearOff();

  _UbuntuProService call({required String name, required String description}) {
    return _UbuntuProService(
      name: name,
      description: description,
    );
  }

  UbuntuProService fromJson(Map<String, Object> json) {
    return UbuntuProService.fromJson(json);
  }
}

/// @nodoc
const $UbuntuProService = _$UbuntuProServiceTearOff();

/// @nodoc
mixin _$UbuntuProService {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UbuntuProServiceCopyWith<UbuntuProService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbuntuProServiceCopyWith<$Res> {
  factory $UbuntuProServiceCopyWith(
          UbuntuProService value, $Res Function(UbuntuProService) then) =
      _$UbuntuProServiceCopyWithImpl<$Res>;
  $Res call({String name, String description});
}

/// @nodoc
class _$UbuntuProServiceCopyWithImpl<$Res>
    implements $UbuntuProServiceCopyWith<$Res> {
  _$UbuntuProServiceCopyWithImpl(this._value, this._then);

  final UbuntuProService _value;
  // ignore: unused_field
  final $Res Function(UbuntuProService) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UbuntuProServiceCopyWith<$Res>
    implements $UbuntuProServiceCopyWith<$Res> {
  factory _$UbuntuProServiceCopyWith(
          _UbuntuProService value, $Res Function(_UbuntuProService) then) =
      __$UbuntuProServiceCopyWithImpl<$Res>;
  @override
  $Res call({String name, String description});
}

/// @nodoc
class __$UbuntuProServiceCopyWithImpl<$Res>
    extends _$UbuntuProServiceCopyWithImpl<$Res>
    implements _$UbuntuProServiceCopyWith<$Res> {
  __$UbuntuProServiceCopyWithImpl(
      _UbuntuProService _value, $Res Function(_UbuntuProService) _then)
      : super(_value, (v) => _then(v as _UbuntuProService));

  @override
  _UbuntuProService get _value => super._value as _UbuntuProService;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_UbuntuProService(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProService implements _UbuntuProService {
  const _$_UbuntuProService({required this.name, required this.description});

  factory _$_UbuntuProService.fromJson(Map<String, dynamic> json) =>
      _$_$_UbuntuProServiceFromJson(json);

  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'UbuntuProService(name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UbuntuProService &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$UbuntuProServiceCopyWith<_UbuntuProService> get copyWith =>
      __$UbuntuProServiceCopyWithImpl<_UbuntuProService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UbuntuProServiceToJson(this);
  }
}

abstract class _UbuntuProService implements UbuntuProService {
  const factory _UbuntuProService(
      {required String name,
      required String description}) = _$_UbuntuProService;

  factory _UbuntuProService.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProService.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UbuntuProServiceCopyWith<_UbuntuProService> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProCheckTokenAnswer _$UbuntuProCheckTokenAnswerFromJson(
    Map<String, dynamic> json) {
  return _UbuntuProCheckTokenAnswer.fromJson(json);
}

/// @nodoc
class _$UbuntuProCheckTokenAnswerTearOff {
  const _$UbuntuProCheckTokenAnswerTearOff();

  _UbuntuProCheckTokenAnswer call(
      {required UbuntuProCheckTokenStatus status,
      required List<UbuntuProService>? services}) {
    return _UbuntuProCheckTokenAnswer(
      status: status,
      services: services,
    );
  }

  UbuntuProCheckTokenAnswer fromJson(Map<String, Object> json) {
    return UbuntuProCheckTokenAnswer.fromJson(json);
  }
}

/// @nodoc
const $UbuntuProCheckTokenAnswer = _$UbuntuProCheckTokenAnswerTearOff();

/// @nodoc
mixin _$UbuntuProCheckTokenAnswer {
  UbuntuProCheckTokenStatus get status => throw _privateConstructorUsedError;
  List<UbuntuProService>? get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UbuntuProCheckTokenAnswerCopyWith<UbuntuProCheckTokenAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbuntuProCheckTokenAnswerCopyWith<$Res> {
  factory $UbuntuProCheckTokenAnswerCopyWith(UbuntuProCheckTokenAnswer value,
          $Res Function(UbuntuProCheckTokenAnswer) then) =
      _$UbuntuProCheckTokenAnswerCopyWithImpl<$Res>;
  $Res call(
      {UbuntuProCheckTokenStatus status, List<UbuntuProService>? services});
}

/// @nodoc
class _$UbuntuProCheckTokenAnswerCopyWithImpl<$Res>
    implements $UbuntuProCheckTokenAnswerCopyWith<$Res> {
  _$UbuntuProCheckTokenAnswerCopyWithImpl(this._value, this._then);

  final UbuntuProCheckTokenAnswer _value;
  // ignore: unused_field
  final $Res Function(UbuntuProCheckTokenAnswer) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UbuntuProCheckTokenStatus,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<UbuntuProService>?,
    ));
  }
}

/// @nodoc
abstract class _$UbuntuProCheckTokenAnswerCopyWith<$Res>
    implements $UbuntuProCheckTokenAnswerCopyWith<$Res> {
  factory _$UbuntuProCheckTokenAnswerCopyWith(_UbuntuProCheckTokenAnswer value,
          $Res Function(_UbuntuProCheckTokenAnswer) then) =
      __$UbuntuProCheckTokenAnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {UbuntuProCheckTokenStatus status, List<UbuntuProService>? services});
}

/// @nodoc
class __$UbuntuProCheckTokenAnswerCopyWithImpl<$Res>
    extends _$UbuntuProCheckTokenAnswerCopyWithImpl<$Res>
    implements _$UbuntuProCheckTokenAnswerCopyWith<$Res> {
  __$UbuntuProCheckTokenAnswerCopyWithImpl(_UbuntuProCheckTokenAnswer _value,
      $Res Function(_UbuntuProCheckTokenAnswer) _then)
      : super(_value, (v) => _then(v as _UbuntuProCheckTokenAnswer));

  @override
  _UbuntuProCheckTokenAnswer get _value =>
      super._value as _UbuntuProCheckTokenAnswer;

  @override
  $Res call({
    Object? status = freezed,
    Object? services = freezed,
  }) {
    return _then(_UbuntuProCheckTokenAnswer(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UbuntuProCheckTokenStatus,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<UbuntuProService>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProCheckTokenAnswer implements _UbuntuProCheckTokenAnswer {
  const _$_UbuntuProCheckTokenAnswer(
      {required this.status, required this.services});

  factory _$_UbuntuProCheckTokenAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_UbuntuProCheckTokenAnswerFromJson(json);

  @override
  final UbuntuProCheckTokenStatus status;
  @override
  final List<UbuntuProService>? services;

  @override
  String toString() {
    return 'UbuntuProCheckTokenAnswer(status: $status, services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UbuntuProCheckTokenAnswer &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.services, services) ||
                const DeepCollectionEquality()
                    .equals(other.services, services)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(services);

  @JsonKey(ignore: true)
  @override
  _$UbuntuProCheckTokenAnswerCopyWith<_UbuntuProCheckTokenAnswer>
      get copyWith =>
          __$UbuntuProCheckTokenAnswerCopyWithImpl<_UbuntuProCheckTokenAnswer>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UbuntuProCheckTokenAnswerToJson(this);
  }
}

abstract class _UbuntuProCheckTokenAnswer implements UbuntuProCheckTokenAnswer {
  const factory _UbuntuProCheckTokenAnswer(
          {required UbuntuProCheckTokenStatus status,
          required List<UbuntuProService>? services}) =
      _$_UbuntuProCheckTokenAnswer;

  factory _UbuntuProCheckTokenAnswer.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProCheckTokenAnswer.fromJson;

  @override
  UbuntuProCheckTokenStatus get status => throw _privateConstructorUsedError;
  @override
  List<UbuntuProService>? get services => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UbuntuProCheckTokenAnswerCopyWith<_UbuntuProCheckTokenAnswer>
      get copyWith => throw _privateConstructorUsedError;
}

WSLConfigurationBase _$WSLConfigurationBaseFromJson(Map<String, dynamic> json) {
  return _WSLConfigurationBase.fromJson(json);
}

/// @nodoc
class _$WSLConfigurationBaseTearOff {
  const _$WSLConfigurationBaseTearOff();

  _WSLConfigurationBase call(
      {String automountRoot = '/mnt/',
      String automountOptions = '',
      bool networkGeneratehosts = true,
      bool networkGenerateresolvconf = true}) {
    return _WSLConfigurationBase(
      automountRoot: automountRoot,
      automountOptions: automountOptions,
      networkGeneratehosts: networkGeneratehosts,
      networkGenerateresolvconf: networkGenerateresolvconf,
    );
  }

  WSLConfigurationBase fromJson(Map<String, Object> json) {
    return WSLConfigurationBase.fromJson(json);
  }
}

/// @nodoc
const $WSLConfigurationBase = _$WSLConfigurationBaseTearOff();

/// @nodoc
mixin _$WSLConfigurationBase {
  String get automountRoot => throw _privateConstructorUsedError;
  String get automountOptions => throw _privateConstructorUsedError;
  bool get networkGeneratehosts => throw _privateConstructorUsedError;
  bool get networkGenerateresolvconf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WSLConfigurationBaseCopyWith<WSLConfigurationBase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WSLConfigurationBaseCopyWith<$Res> {
  factory $WSLConfigurationBaseCopyWith(WSLConfigurationBase value,
          $Res Function(WSLConfigurationBase) then) =
      _$WSLConfigurationBaseCopyWithImpl<$Res>;
  $Res call(
      {String automountRoot,
      String automountOptions,
      bool networkGeneratehosts,
      bool networkGenerateresolvconf});
}

/// @nodoc
class _$WSLConfigurationBaseCopyWithImpl<$Res>
    implements $WSLConfigurationBaseCopyWith<$Res> {
  _$WSLConfigurationBaseCopyWithImpl(this._value, this._then);

  final WSLConfigurationBase _value;
  // ignore: unused_field
  final $Res Function(WSLConfigurationBase) _then;

  @override
  $Res call({
    Object? automountRoot = freezed,
    Object? automountOptions = freezed,
    Object? networkGeneratehosts = freezed,
    Object? networkGenerateresolvconf = freezed,
  }) {
    return _then(_value.copyWith(
      automountRoot: automountRoot == freezed
          ? _value.automountRoot
          : automountRoot // ignore: cast_nullable_to_non_nullable
              as String,
      automountOptions: automountOptions == freezed
          ? _value.automountOptions
          : automountOptions // ignore: cast_nullable_to_non_nullable
              as String,
      networkGeneratehosts: networkGeneratehosts == freezed
          ? _value.networkGeneratehosts
          : networkGeneratehosts // ignore: cast_nullable_to_non_nullable
              as bool,
      networkGenerateresolvconf: networkGenerateresolvconf == freezed
          ? _value.networkGenerateresolvconf
          : networkGenerateresolvconf // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$WSLConfigurationBaseCopyWith<$Res>
    implements $WSLConfigurationBaseCopyWith<$Res> {
  factory _$WSLConfigurationBaseCopyWith(_WSLConfigurationBase value,
          $Res Function(_WSLConfigurationBase) then) =
      __$WSLConfigurationBaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String automountRoot,
      String automountOptions,
      bool networkGeneratehosts,
      bool networkGenerateresolvconf});
}

/// @nodoc
class __$WSLConfigurationBaseCopyWithImpl<$Res>
    extends _$WSLConfigurationBaseCopyWithImpl<$Res>
    implements _$WSLConfigurationBaseCopyWith<$Res> {
  __$WSLConfigurationBaseCopyWithImpl(
      _WSLConfigurationBase _value, $Res Function(_WSLConfigurationBase) _then)
      : super(_value, (v) => _then(v as _WSLConfigurationBase));

  @override
  _WSLConfigurationBase get _value => super._value as _WSLConfigurationBase;

  @override
  $Res call({
    Object? automountRoot = freezed,
    Object? automountOptions = freezed,
    Object? networkGeneratehosts = freezed,
    Object? networkGenerateresolvconf = freezed,
  }) {
    return _then(_WSLConfigurationBase(
      automountRoot: automountRoot == freezed
          ? _value.automountRoot
          : automountRoot // ignore: cast_nullable_to_non_nullable
              as String,
      automountOptions: automountOptions == freezed
          ? _value.automountOptions
          : automountOptions // ignore: cast_nullable_to_non_nullable
              as String,
      networkGeneratehosts: networkGeneratehosts == freezed
          ? _value.networkGeneratehosts
          : networkGeneratehosts // ignore: cast_nullable_to_non_nullable
              as bool,
      networkGenerateresolvconf: networkGenerateresolvconf == freezed
          ? _value.networkGenerateresolvconf
          : networkGenerateresolvconf // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WSLConfigurationBase implements _WSLConfigurationBase {
  const _$_WSLConfigurationBase(
      {this.automountRoot = '/mnt/',
      this.automountOptions = '',
      this.networkGeneratehosts = true,
      this.networkGenerateresolvconf = true});

  factory _$_WSLConfigurationBase.fromJson(Map<String, dynamic> json) =>
      _$_$_WSLConfigurationBaseFromJson(json);

  @JsonKey(defaultValue: '/mnt/')
  @override
  final String automountRoot;
  @JsonKey(defaultValue: '')
  @override
  final String automountOptions;
  @JsonKey(defaultValue: true)
  @override
  final bool networkGeneratehosts;
  @JsonKey(defaultValue: true)
  @override
  final bool networkGenerateresolvconf;

  @override
  String toString() {
    return 'WSLConfigurationBase(automountRoot: $automountRoot, automountOptions: $automountOptions, networkGeneratehosts: $networkGeneratehosts, networkGenerateresolvconf: $networkGenerateresolvconf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WSLConfigurationBase &&
            (identical(other.automountRoot, automountRoot) ||
                const DeepCollectionEquality()
                    .equals(other.automountRoot, automountRoot)) &&
            (identical(other.automountOptions, automountOptions) ||
                const DeepCollectionEquality()
                    .equals(other.automountOptions, automountOptions)) &&
            (identical(other.networkGeneratehosts, networkGeneratehosts) ||
                const DeepCollectionEquality().equals(
                    other.networkGeneratehosts, networkGeneratehosts)) &&
            (identical(other.networkGenerateresolvconf,
                    networkGenerateresolvconf) ||
                const DeepCollectionEquality().equals(
                    other.networkGenerateresolvconf,
                    networkGenerateresolvconf)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(automountRoot) ^
      const DeepCollectionEquality().hash(automountOptions) ^
      const DeepCollectionEquality().hash(networkGeneratehosts) ^
      const DeepCollectionEquality().hash(networkGenerateresolvconf);

  @JsonKey(ignore: true)
  @override
  _$WSLConfigurationBaseCopyWith<_WSLConfigurationBase> get copyWith =>
      __$WSLConfigurationBaseCopyWithImpl<_WSLConfigurationBase>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WSLConfigurationBaseToJson(this);
  }
}

abstract class _WSLConfigurationBase implements WSLConfigurationBase {
  const factory _WSLConfigurationBase(
      {String automountRoot,
      String automountOptions,
      bool networkGeneratehosts,
      bool networkGenerateresolvconf}) = _$_WSLConfigurationBase;

  factory _WSLConfigurationBase.fromJson(Map<String, dynamic> json) =
      _$_WSLConfigurationBase.fromJson;

  @override
  String get automountRoot => throw _privateConstructorUsedError;
  @override
  String get automountOptions => throw _privateConstructorUsedError;
  @override
  bool get networkGeneratehosts => throw _privateConstructorUsedError;
  @override
  bool get networkGenerateresolvconf => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WSLConfigurationBaseCopyWith<_WSLConfigurationBase> get copyWith =>
      throw _privateConstructorUsedError;
}

WSLConfigurationAdvanced _$WSLConfigurationAdvancedFromJson(
    Map<String, dynamic> json) {
  return _WSLConfigurationAdvanced.fromJson(json);
}

/// @nodoc
class _$WSLConfigurationAdvancedTearOff {
  const _$WSLConfigurationAdvancedTearOff();

  _WSLConfigurationAdvanced call(
      {bool automountEnabled = true,
      bool automountMountfstab = true,
      bool interopEnabled = true,
      bool interopAppendwindowspath = true,
      bool systemdEnabled = false}) {
    return _WSLConfigurationAdvanced(
      automountEnabled: automountEnabled,
      automountMountfstab: automountMountfstab,
      interopEnabled: interopEnabled,
      interopAppendwindowspath: interopAppendwindowspath,
      systemdEnabled: systemdEnabled,
    );
  }

  WSLConfigurationAdvanced fromJson(Map<String, Object> json) {
    return WSLConfigurationAdvanced.fromJson(json);
  }
}

/// @nodoc
const $WSLConfigurationAdvanced = _$WSLConfigurationAdvancedTearOff();

/// @nodoc
mixin _$WSLConfigurationAdvanced {
  bool get automountEnabled => throw _privateConstructorUsedError;
  bool get automountMountfstab => throw _privateConstructorUsedError;
  bool get interopEnabled => throw _privateConstructorUsedError;
  bool get interopAppendwindowspath => throw _privateConstructorUsedError;
  bool get systemdEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WSLConfigurationAdvancedCopyWith<WSLConfigurationAdvanced> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WSLConfigurationAdvancedCopyWith<$Res> {
  factory $WSLConfigurationAdvancedCopyWith(WSLConfigurationAdvanced value,
          $Res Function(WSLConfigurationAdvanced) then) =
      _$WSLConfigurationAdvancedCopyWithImpl<$Res>;
  $Res call(
      {bool automountEnabled,
      bool automountMountfstab,
      bool interopEnabled,
      bool interopAppendwindowspath,
      bool systemdEnabled});
}

/// @nodoc
class _$WSLConfigurationAdvancedCopyWithImpl<$Res>
    implements $WSLConfigurationAdvancedCopyWith<$Res> {
  _$WSLConfigurationAdvancedCopyWithImpl(this._value, this._then);

  final WSLConfigurationAdvanced _value;
  // ignore: unused_field
  final $Res Function(WSLConfigurationAdvanced) _then;

  @override
  $Res call({
    Object? automountEnabled = freezed,
    Object? automountMountfstab = freezed,
    Object? interopEnabled = freezed,
    Object? interopAppendwindowspath = freezed,
    Object? systemdEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      automountEnabled: automountEnabled == freezed
          ? _value.automountEnabled
          : automountEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      automountMountfstab: automountMountfstab == freezed
          ? _value.automountMountfstab
          : automountMountfstab // ignore: cast_nullable_to_non_nullable
              as bool,
      interopEnabled: interopEnabled == freezed
          ? _value.interopEnabled
          : interopEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      interopAppendwindowspath: interopAppendwindowspath == freezed
          ? _value.interopAppendwindowspath
          : interopAppendwindowspath // ignore: cast_nullable_to_non_nullable
              as bool,
      systemdEnabled: systemdEnabled == freezed
          ? _value.systemdEnabled
          : systemdEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$WSLConfigurationAdvancedCopyWith<$Res>
    implements $WSLConfigurationAdvancedCopyWith<$Res> {
  factory _$WSLConfigurationAdvancedCopyWith(_WSLConfigurationAdvanced value,
          $Res Function(_WSLConfigurationAdvanced) then) =
      __$WSLConfigurationAdvancedCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool automountEnabled,
      bool automountMountfstab,
      bool interopEnabled,
      bool interopAppendwindowspath,
      bool systemdEnabled});
}

/// @nodoc
class __$WSLConfigurationAdvancedCopyWithImpl<$Res>
    extends _$WSLConfigurationAdvancedCopyWithImpl<$Res>
    implements _$WSLConfigurationAdvancedCopyWith<$Res> {
  __$WSLConfigurationAdvancedCopyWithImpl(_WSLConfigurationAdvanced _value,
      $Res Function(_WSLConfigurationAdvanced) _then)
      : super(_value, (v) => _then(v as _WSLConfigurationAdvanced));

  @override
  _WSLConfigurationAdvanced get _value =>
      super._value as _WSLConfigurationAdvanced;

  @override
  $Res call({
    Object? automountEnabled = freezed,
    Object? automountMountfstab = freezed,
    Object? interopEnabled = freezed,
    Object? interopAppendwindowspath = freezed,
    Object? systemdEnabled = freezed,
  }) {
    return _then(_WSLConfigurationAdvanced(
      automountEnabled: automountEnabled == freezed
          ? _value.automountEnabled
          : automountEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      automountMountfstab: automountMountfstab == freezed
          ? _value.automountMountfstab
          : automountMountfstab // ignore: cast_nullable_to_non_nullable
              as bool,
      interopEnabled: interopEnabled == freezed
          ? _value.interopEnabled
          : interopEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      interopAppendwindowspath: interopAppendwindowspath == freezed
          ? _value.interopAppendwindowspath
          : interopAppendwindowspath // ignore: cast_nullable_to_non_nullable
              as bool,
      systemdEnabled: systemdEnabled == freezed
          ? _value.systemdEnabled
          : systemdEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WSLConfigurationAdvanced implements _WSLConfigurationAdvanced {
  const _$_WSLConfigurationAdvanced(
      {this.automountEnabled = true,
      this.automountMountfstab = true,
      this.interopEnabled = true,
      this.interopAppendwindowspath = true,
      this.systemdEnabled = false});

  factory _$_WSLConfigurationAdvanced.fromJson(Map<String, dynamic> json) =>
      _$_$_WSLConfigurationAdvancedFromJson(json);

  @JsonKey(defaultValue: true)
  @override
  final bool automountEnabled;
  @JsonKey(defaultValue: true)
  @override
  final bool automountMountfstab;
  @JsonKey(defaultValue: true)
  @override
  final bool interopEnabled;
  @JsonKey(defaultValue: true)
  @override
  final bool interopAppendwindowspath;
  @JsonKey(defaultValue: false)
  @override
  final bool systemdEnabled;

  @override
  String toString() {
    return 'WSLConfigurationAdvanced(automountEnabled: $automountEnabled, automountMountfstab: $automountMountfstab, interopEnabled: $interopEnabled, interopAppendwindowspath: $interopAppendwindowspath, systemdEnabled: $systemdEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WSLConfigurationAdvanced &&
            (identical(other.automountEnabled, automountEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.automountEnabled, automountEnabled)) &&
            (identical(other.automountMountfstab, automountMountfstab) ||
                const DeepCollectionEquality()
                    .equals(other.automountMountfstab, automountMountfstab)) &&
            (identical(other.interopEnabled, interopEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.interopEnabled, interopEnabled)) &&
            (identical(
                    other.interopAppendwindowspath, interopAppendwindowspath) ||
                const DeepCollectionEquality().equals(
                    other.interopAppendwindowspath,
                    interopAppendwindowspath)) &&
            (identical(other.systemdEnabled, systemdEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.systemdEnabled, systemdEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(automountEnabled) ^
      const DeepCollectionEquality().hash(automountMountfstab) ^
      const DeepCollectionEquality().hash(interopEnabled) ^
      const DeepCollectionEquality().hash(interopAppendwindowspath) ^
      const DeepCollectionEquality().hash(systemdEnabled);

  @JsonKey(ignore: true)
  @override
  _$WSLConfigurationAdvancedCopyWith<_WSLConfigurationAdvanced> get copyWith =>
      __$WSLConfigurationAdvancedCopyWithImpl<_WSLConfigurationAdvanced>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WSLConfigurationAdvancedToJson(this);
  }
}

abstract class _WSLConfigurationAdvanced implements WSLConfigurationAdvanced {
  const factory _WSLConfigurationAdvanced(
      {bool automountEnabled,
      bool automountMountfstab,
      bool interopEnabled,
      bool interopAppendwindowspath,
      bool systemdEnabled}) = _$_WSLConfigurationAdvanced;

  factory _WSLConfigurationAdvanced.fromJson(Map<String, dynamic> json) =
      _$_WSLConfigurationAdvanced.fromJson;

  @override
  bool get automountEnabled => throw _privateConstructorUsedError;
  @override
  bool get automountMountfstab => throw _privateConstructorUsedError;
  @override
  bool get interopEnabled => throw _privateConstructorUsedError;
  @override
  bool get interopAppendwindowspath => throw _privateConstructorUsedError;
  @override
  bool get systemdEnabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WSLConfigurationAdvancedCopyWith<_WSLConfigurationAdvanced> get copyWith =>
      throw _privateConstructorUsedError;
}
