// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorReportRef _$ErrorReportRefFromJson(Map<String, dynamic> json) {
  return _ErrorReportRef.fromJson(json);
}

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
abstract class _$$_ErrorReportRefCopyWith<$Res>
    implements $ErrorReportRefCopyWith<$Res> {
  factory _$$_ErrorReportRefCopyWith(
          _$_ErrorReportRef value, $Res Function(_$_ErrorReportRef) then) =
      __$$_ErrorReportRefCopyWithImpl<$Res>;
  @override
  $Res call(
      {ErrorReportState state,
      String base,
      ErrorReportKind kind,
      bool seen,
      String? oopsId});
}

/// @nodoc
class __$$_ErrorReportRefCopyWithImpl<$Res>
    extends _$ErrorReportRefCopyWithImpl<$Res>
    implements _$$_ErrorReportRefCopyWith<$Res> {
  __$$_ErrorReportRefCopyWithImpl(
      _$_ErrorReportRef _value, $Res Function(_$_ErrorReportRef) _then)
      : super(_value, (v) => _then(v as _$_ErrorReportRef));

  @override
  _$_ErrorReportRef get _value => super._value as _$_ErrorReportRef;

  @override
  $Res call({
    Object? state = freezed,
    Object? base = freezed,
    Object? kind = freezed,
    Object? seen = freezed,
    Object? oopsId = freezed,
  }) {
    return _then(_$_ErrorReportRef(
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
      _$$_ErrorReportRefFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ErrorReportRef &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.base, base) &&
            const DeepCollectionEquality().equals(other.kind, kind) &&
            const DeepCollectionEquality().equals(other.seen, seen) &&
            const DeepCollectionEquality().equals(other.oopsId, oopsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(base),
      const DeepCollectionEquality().hash(kind),
      const DeepCollectionEquality().hash(seen),
      const DeepCollectionEquality().hash(oopsId));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorReportRefCopyWith<_$_ErrorReportRef> get copyWith =>
      __$$_ErrorReportRefCopyWithImpl<_$_ErrorReportRef>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorReportRefToJson(
      this,
    );
  }
}

abstract class _ErrorReportRef implements ErrorReportRef {
  const factory _ErrorReportRef(
      {required final ErrorReportState state,
      required final String base,
      required final ErrorReportKind kind,
      required final bool seen,
      required final String? oopsId}) = _$_ErrorReportRef;

  factory _ErrorReportRef.fromJson(Map<String, dynamic> json) =
      _$_ErrorReportRef.fromJson;

  @override
  ErrorReportState get state;
  @override
  String get base;
  @override
  ErrorReportKind get kind;
  @override
  bool get seen;
  @override
  String? get oopsId;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorReportRefCopyWith<_$_ErrorReportRef> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationStatus _$ApplicationStatusFromJson(Map<String, dynamic> json) {
  return _ApplicationStatus.fromJson(json);
}

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
abstract class _$$_ApplicationStatusCopyWith<$Res>
    implements $ApplicationStatusCopyWith<$Res> {
  factory _$$_ApplicationStatusCopyWith(_$_ApplicationStatus value,
          $Res Function(_$_ApplicationStatus) then) =
      __$$_ApplicationStatusCopyWithImpl<$Res>;
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
class __$$_ApplicationStatusCopyWithImpl<$Res>
    extends _$ApplicationStatusCopyWithImpl<$Res>
    implements _$$_ApplicationStatusCopyWith<$Res> {
  __$$_ApplicationStatusCopyWithImpl(
      _$_ApplicationStatus _value, $Res Function(_$_ApplicationStatus) _then)
      : super(_value, (v) => _then(v as _$_ApplicationStatus));

  @override
  _$_ApplicationStatus get _value => super._value as _$_ApplicationStatus;

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
    return _then(_$_ApplicationStatus(
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
      _$$_ApplicationStatusFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationStatus &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality()
                .equals(other.confirmingTty, confirmingTty) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.cloudInitOk, cloudInitOk) &&
            const DeepCollectionEquality()
                .equals(other.interactive, interactive) &&
            const DeepCollectionEquality()
                .equals(other.echoSyslogId, echoSyslogId) &&
            const DeepCollectionEquality()
                .equals(other.logSyslogId, logSyslogId) &&
            const DeepCollectionEquality()
                .equals(other.eventSyslogId, eventSyslogId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(confirmingTty),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(cloudInitOk),
      const DeepCollectionEquality().hash(interactive),
      const DeepCollectionEquality().hash(echoSyslogId),
      const DeepCollectionEquality().hash(logSyslogId),
      const DeepCollectionEquality().hash(eventSyslogId));

  @JsonKey(ignore: true)
  @override
  _$$_ApplicationStatusCopyWith<_$_ApplicationStatus> get copyWith =>
      __$$_ApplicationStatusCopyWithImpl<_$_ApplicationStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationStatusToJson(
      this,
    );
  }
}

abstract class _ApplicationStatus implements ApplicationStatus {
  const factory _ApplicationStatus(
      {required final ApplicationState state,
      required final String confirmingTty,
      required final ErrorReportRef? error,
      required final bool? cloudInitOk,
      required final bool? interactive,
      required final String echoSyslogId,
      required final String logSyslogId,
      required final String eventSyslogId}) = _$_ApplicationStatus;

  factory _ApplicationStatus.fromJson(Map<String, dynamic> json) =
      _$_ApplicationStatus.fromJson;

  @override
  ApplicationState get state;
  @override
  String get confirmingTty;
  @override
  ErrorReportRef? get error;
  @override
  bool? get cloudInitOk;
  @override
  bool? get interactive;
  @override
  String get echoSyslogId;
  @override
  String get logSyslogId;
  @override
  String get eventSyslogId;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationStatusCopyWith<_$_ApplicationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyFingerprint _$KeyFingerprintFromJson(Map<String, dynamic> json) {
  return _KeyFingerprint.fromJson(json);
}

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
abstract class _$$_KeyFingerprintCopyWith<$Res>
    implements $KeyFingerprintCopyWith<$Res> {
  factory _$$_KeyFingerprintCopyWith(
          _$_KeyFingerprint value, $Res Function(_$_KeyFingerprint) then) =
      __$$_KeyFingerprintCopyWithImpl<$Res>;
  @override
  $Res call({String keytype, String fingerprint});
}

/// @nodoc
class __$$_KeyFingerprintCopyWithImpl<$Res>
    extends _$KeyFingerprintCopyWithImpl<$Res>
    implements _$$_KeyFingerprintCopyWith<$Res> {
  __$$_KeyFingerprintCopyWithImpl(
      _$_KeyFingerprint _value, $Res Function(_$_KeyFingerprint) _then)
      : super(_value, (v) => _then(v as _$_KeyFingerprint));

  @override
  _$_KeyFingerprint get _value => super._value as _$_KeyFingerprint;

  @override
  $Res call({
    Object? keytype = freezed,
    Object? fingerprint = freezed,
  }) {
    return _then(_$_KeyFingerprint(
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
      _$$_KeyFingerprintFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_KeyFingerprint &&
            const DeepCollectionEquality().equals(other.keytype, keytype) &&
            const DeepCollectionEquality()
                .equals(other.fingerprint, fingerprint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(keytype),
      const DeepCollectionEquality().hash(fingerprint));

  @JsonKey(ignore: true)
  @override
  _$$_KeyFingerprintCopyWith<_$_KeyFingerprint> get copyWith =>
      __$$_KeyFingerprintCopyWithImpl<_$_KeyFingerprint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyFingerprintToJson(
      this,
    );
  }
}

abstract class _KeyFingerprint implements KeyFingerprint {
  const factory _KeyFingerprint(
      {required final String keytype,
      required final String fingerprint}) = _$_KeyFingerprint;

  factory _KeyFingerprint.fromJson(Map<String, dynamic> json) =
      _$_KeyFingerprint.fromJson;

  @override
  String get keytype;
  @override
  String get fingerprint;
  @override
  @JsonKey(ignore: true)
  _$$_KeyFingerprintCopyWith<_$_KeyFingerprint> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveSessionSSHInfo _$LiveSessionSSHInfoFromJson(Map<String, dynamic> json) {
  return _LiveSessionSSHInfo.fromJson(json);
}

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
abstract class _$$_LiveSessionSSHInfoCopyWith<$Res>
    implements $LiveSessionSSHInfoCopyWith<$Res> {
  factory _$$_LiveSessionSSHInfoCopyWith(_$_LiveSessionSSHInfo value,
          $Res Function(_$_LiveSessionSSHInfo) then) =
      __$$_LiveSessionSSHInfoCopyWithImpl<$Res>;
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
class __$$_LiveSessionSSHInfoCopyWithImpl<$Res>
    extends _$LiveSessionSSHInfoCopyWithImpl<$Res>
    implements _$$_LiveSessionSSHInfoCopyWith<$Res> {
  __$$_LiveSessionSSHInfoCopyWithImpl(
      _$_LiveSessionSSHInfo _value, $Res Function(_$_LiveSessionSSHInfo) _then)
      : super(_value, (v) => _then(v as _$_LiveSessionSSHInfo));

  @override
  _$_LiveSessionSSHInfo get _value => super._value as _$_LiveSessionSSHInfo;

  @override
  $Res call({
    Object? username = freezed,
    Object? passwordKind = freezed,
    Object? password = freezed,
    Object? authorizedKeyFingerprints = freezed,
    Object? ips = freezed,
    Object? hostKeyFingerprints = freezed,
  }) {
    return _then(_$_LiveSessionSSHInfo(
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
          ? _value._authorizedKeyFingerprints
          : authorizedKeyFingerprints // ignore: cast_nullable_to_non_nullable
              as List<KeyFingerprint>,
      ips: ips == freezed
          ? _value._ips
          : ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hostKeyFingerprints: hostKeyFingerprints == freezed
          ? _value._hostKeyFingerprints
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
      required final List<KeyFingerprint> authorizedKeyFingerprints,
      required final List<String> ips,
      required final List<KeyFingerprint> hostKeyFingerprints})
      : _authorizedKeyFingerprints = authorizedKeyFingerprints,
        _ips = ips,
        _hostKeyFingerprints = hostKeyFingerprints;

  factory _$_LiveSessionSSHInfo.fromJson(Map<String, dynamic> json) =>
      _$$_LiveSessionSSHInfoFromJson(json);

  @override
  final String username;
  @override
  final PasswordKind passwordKind;
  @override
  final String? password;
  final List<KeyFingerprint> _authorizedKeyFingerprints;
  @override
  List<KeyFingerprint> get authorizedKeyFingerprints {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorizedKeyFingerprints);
  }

  final List<String> _ips;
  @override
  List<String> get ips {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ips);
  }

  final List<KeyFingerprint> _hostKeyFingerprints;
  @override
  List<KeyFingerprint> get hostKeyFingerprints {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hostKeyFingerprints);
  }

  @override
  String toString() {
    return 'LiveSessionSSHInfo(username: $username, passwordKind: $passwordKind, password: $password, authorizedKeyFingerprints: $authorizedKeyFingerprints, ips: $ips, hostKeyFingerprints: $hostKeyFingerprints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveSessionSSHInfo &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.passwordKind, passwordKind) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(
                other._authorizedKeyFingerprints, _authorizedKeyFingerprints) &&
            const DeepCollectionEquality().equals(other._ips, _ips) &&
            const DeepCollectionEquality()
                .equals(other._hostKeyFingerprints, _hostKeyFingerprints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(passwordKind),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(_authorizedKeyFingerprints),
      const DeepCollectionEquality().hash(_ips),
      const DeepCollectionEquality().hash(_hostKeyFingerprints));

  @JsonKey(ignore: true)
  @override
  _$$_LiveSessionSSHInfoCopyWith<_$_LiveSessionSSHInfo> get copyWith =>
      __$$_LiveSessionSSHInfoCopyWithImpl<_$_LiveSessionSSHInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiveSessionSSHInfoToJson(
      this,
    );
  }
}

abstract class _LiveSessionSSHInfo implements LiveSessionSSHInfo {
  const factory _LiveSessionSSHInfo(
          {required final String username,
          required final PasswordKind passwordKind,
          required final String? password,
          required final List<KeyFingerprint> authorizedKeyFingerprints,
          required final List<String> ips,
          required final List<KeyFingerprint> hostKeyFingerprints}) =
      _$_LiveSessionSSHInfo;

  factory _LiveSessionSSHInfo.fromJson(Map<String, dynamic> json) =
      _$_LiveSessionSSHInfo.fromJson;

  @override
  String get username;
  @override
  PasswordKind get passwordKind;
  @override
  String? get password;
  @override
  List<KeyFingerprint> get authorizedKeyFingerprints;
  @override
  List<String> get ips;
  @override
  List<KeyFingerprint> get hostKeyFingerprints;
  @override
  @JsonKey(ignore: true)
  _$$_LiveSessionSSHInfoCopyWith<_$_LiveSessionSSHInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshStatus _$RefreshStatusFromJson(Map<String, dynamic> json) {
  return _RefreshStatus.fromJson(json);
}

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
abstract class _$$_RefreshStatusCopyWith<$Res>
    implements $RefreshStatusCopyWith<$Res> {
  factory _$$_RefreshStatusCopyWith(
          _$_RefreshStatus value, $Res Function(_$_RefreshStatus) then) =
      __$$_RefreshStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {RefreshCheckState availability,
      String currentSnapVersion,
      String newSnapVersion});
}

/// @nodoc
class __$$_RefreshStatusCopyWithImpl<$Res>
    extends _$RefreshStatusCopyWithImpl<$Res>
    implements _$$_RefreshStatusCopyWith<$Res> {
  __$$_RefreshStatusCopyWithImpl(
      _$_RefreshStatus _value, $Res Function(_$_RefreshStatus) _then)
      : super(_value, (v) => _then(v as _$_RefreshStatus));

  @override
  _$_RefreshStatus get _value => super._value as _$_RefreshStatus;

  @override
  $Res call({
    Object? availability = freezed,
    Object? currentSnapVersion = freezed,
    Object? newSnapVersion = freezed,
  }) {
    return _then(_$_RefreshStatus(
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
      _$$_RefreshStatusFromJson(json);

  @override
  final RefreshCheckState availability;
  @override
  @JsonKey()
  final String currentSnapVersion;
  @override
  @JsonKey()
  final String newSnapVersion;

  @override
  String toString() {
    return 'RefreshStatus(availability: $availability, currentSnapVersion: $currentSnapVersion, newSnapVersion: $newSnapVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshStatus &&
            const DeepCollectionEquality()
                .equals(other.availability, availability) &&
            const DeepCollectionEquality()
                .equals(other.currentSnapVersion, currentSnapVersion) &&
            const DeepCollectionEquality()
                .equals(other.newSnapVersion, newSnapVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availability),
      const DeepCollectionEquality().hash(currentSnapVersion),
      const DeepCollectionEquality().hash(newSnapVersion));

  @JsonKey(ignore: true)
  @override
  _$$_RefreshStatusCopyWith<_$_RefreshStatus> get copyWith =>
      __$$_RefreshStatusCopyWithImpl<_$_RefreshStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshStatusToJson(
      this,
    );
  }
}

abstract class _RefreshStatus implements RefreshStatus {
  const factory _RefreshStatus(
      {required final RefreshCheckState availability,
      final String currentSnapVersion,
      final String newSnapVersion}) = _$_RefreshStatus;

  factory _RefreshStatus.fromJson(Map<String, dynamic> json) =
      _$_RefreshStatus.fromJson;

  @override
  RefreshCheckState get availability;
  @override
  String get currentSnapVersion;
  @override
  String get newSnapVersion;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshStatusCopyWith<_$_RefreshStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

AnyStep _$AnyStepFromJson(Map<String, dynamic> json) {
  switch (json['\$type']) {
    case 'StepPressKey':
      return StepPressKey.fromJson(json);
    case 'StepKeyPresent':
      return StepKeyPresent.fromJson(json);
    case 'StepResult':
      return StepResult.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, '\$type', 'AnyStep', 'Invalid union type "${json['\$type']}"!');
  }
}

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
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
abstract class _$$StepPressKeyCopyWith<$Res> {
  factory _$$StepPressKeyCopyWith(
          _$StepPressKey value, $Res Function(_$StepPressKey) then) =
      __$$StepPressKeyCopyWithImpl<$Res>;
  $Res call({List<String> symbols, Map<int, String> keycodes});
}

/// @nodoc
class __$$StepPressKeyCopyWithImpl<$Res> extends _$AnyStepCopyWithImpl<$Res>
    implements _$$StepPressKeyCopyWith<$Res> {
  __$$StepPressKeyCopyWithImpl(
      _$StepPressKey _value, $Res Function(_$StepPressKey) _then)
      : super(_value, (v) => _then(v as _$StepPressKey));

  @override
  _$StepPressKey get _value => super._value as _$StepPressKey;

  @override
  $Res call({
    Object? symbols = freezed,
    Object? keycodes = freezed,
  }) {
    return _then(_$StepPressKey(
      symbols: symbols == freezed
          ? _value._symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keycodes: keycodes == freezed
          ? _value._keycodes
          : keycodes // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@JsonMapConverter()
class _$StepPressKey implements StepPressKey {
  const _$StepPressKey(
      {required final List<String> symbols,
      required final Map<int, String> keycodes,
      final String? $type})
      : _symbols = symbols,
        _keycodes = keycodes,
        $type = $type ?? 'StepPressKey';

  factory _$StepPressKey.fromJson(Map<String, dynamic> json) =>
      _$$StepPressKeyFromJson(json);

  final List<String> _symbols;
  @override
  List<String> get symbols {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symbols);
  }

  final Map<int, String> _keycodes;
  @override
  Map<int, String> get keycodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_keycodes);
  }

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'AnyStep.stepPressKey(symbols: $symbols, keycodes: $keycodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepPressKey &&
            const DeepCollectionEquality().equals(other._symbols, _symbols) &&
            const DeepCollectionEquality().equals(other._keycodes, _keycodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_symbols),
      const DeepCollectionEquality().hash(_keycodes));

  @JsonKey(ignore: true)
  @override
  _$$StepPressKeyCopyWith<_$StepPressKey> get copyWith =>
      __$$StepPressKeyCopyWithImpl<_$StepPressKey>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
  }) {
    return stepPressKey?.call(symbols, keycodes);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
  }) {
    return stepPressKey?.call(this);
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
    return _$$StepPressKeyToJson(
      this,
    );
  }
}

abstract class StepPressKey implements AnyStep {
  const factory StepPressKey(
      {required final List<String> symbols,
      required final Map<int, String> keycodes}) = _$StepPressKey;

  factory StepPressKey.fromJson(Map<String, dynamic> json) =
      _$StepPressKey.fromJson;

  List<String> get symbols;
  Map<int, String> get keycodes;
  @JsonKey(ignore: true)
  _$$StepPressKeyCopyWith<_$StepPressKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepKeyPresentCopyWith<$Res> {
  factory _$$StepKeyPresentCopyWith(
          _$StepKeyPresent value, $Res Function(_$StepKeyPresent) then) =
      __$$StepKeyPresentCopyWithImpl<$Res>;
  $Res call({String symbol, String yes, String no});
}

/// @nodoc
class __$$StepKeyPresentCopyWithImpl<$Res> extends _$AnyStepCopyWithImpl<$Res>
    implements _$$StepKeyPresentCopyWith<$Res> {
  __$$StepKeyPresentCopyWithImpl(
      _$StepKeyPresent _value, $Res Function(_$StepKeyPresent) _then)
      : super(_value, (v) => _then(v as _$StepKeyPresent));

  @override
  _$StepKeyPresent get _value => super._value as _$StepKeyPresent;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? yes = freezed,
    Object? no = freezed,
  }) {
    return _then(_$StepKeyPresent(
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
class _$StepKeyPresent implements StepKeyPresent {
  const _$StepKeyPresent(
      {required this.symbol,
      required this.yes,
      required this.no,
      final String? $type})
      : $type = $type ?? 'StepKeyPresent';

  factory _$StepKeyPresent.fromJson(Map<String, dynamic> json) =>
      _$$StepKeyPresentFromJson(json);

  @override
  final String symbol;
  @override
  final String yes;
  @override
  final String no;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'AnyStep.stepKeyPresent(symbol: $symbol, yes: $yes, no: $no)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepKeyPresent &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.yes, yes) &&
            const DeepCollectionEquality().equals(other.no, no));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(yes),
      const DeepCollectionEquality().hash(no));

  @JsonKey(ignore: true)
  @override
  _$$StepKeyPresentCopyWith<_$StepKeyPresent> get copyWith =>
      __$$StepKeyPresentCopyWithImpl<_$StepKeyPresent>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
  }) {
    return stepKeyPresent?.call(symbol, yes, no);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
  }) {
    return stepKeyPresent?.call(this);
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
    return _$$StepKeyPresentToJson(
      this,
    );
  }
}

abstract class StepKeyPresent implements AnyStep {
  const factory StepKeyPresent(
      {required final String symbol,
      required final String yes,
      required final String no}) = _$StepKeyPresent;

  factory StepKeyPresent.fromJson(Map<String, dynamic> json) =
      _$StepKeyPresent.fromJson;

  String get symbol;
  String get yes;
  String get no;
  @JsonKey(ignore: true)
  _$$StepKeyPresentCopyWith<_$StepKeyPresent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepResultCopyWith<$Res> {
  factory _$$StepResultCopyWith(
          _$StepResult value, $Res Function(_$StepResult) then) =
      __$$StepResultCopyWithImpl<$Res>;
  $Res call({String layout, String variant});
}

/// @nodoc
class __$$StepResultCopyWithImpl<$Res> extends _$AnyStepCopyWithImpl<$Res>
    implements _$$StepResultCopyWith<$Res> {
  __$$StepResultCopyWithImpl(
      _$StepResult _value, $Res Function(_$StepResult) _then)
      : super(_value, (v) => _then(v as _$StepResult));

  @override
  _$StepResult get _value => super._value as _$StepResult;

  @override
  $Res call({
    Object? layout = freezed,
    Object? variant = freezed,
  }) {
    return _then(_$StepResult(
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
class _$StepResult implements StepResult {
  const _$StepResult(
      {required this.layout, required this.variant, final String? $type})
      : $type = $type ?? 'StepResult';

  factory _$StepResult.fromJson(Map<String, dynamic> json) =>
      _$$StepResultFromJson(json);

  @override
  final String layout;
  @override
  final String variant;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'AnyStep.stepResult(layout: $layout, variant: $variant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepResult &&
            const DeepCollectionEquality().equals(other.layout, layout) &&
            const DeepCollectionEquality().equals(other.variant, variant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(layout),
      const DeepCollectionEquality().hash(variant));

  @JsonKey(ignore: true)
  @override
  _$$StepResultCopyWith<_$StepResult> get copyWith =>
      __$$StepResultCopyWithImpl<_$StepResult>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> symbols, Map<int, String> keycodes)?
        stepPressKey,
    TResult Function(String symbol, String yes, String no)? stepKeyPresent,
    TResult Function(String layout, String variant)? stepResult,
  }) {
    return stepResult?.call(layout, variant);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StepPressKey value)? stepPressKey,
    TResult Function(StepKeyPresent value)? stepKeyPresent,
    TResult Function(StepResult value)? stepResult,
  }) {
    return stepResult?.call(this);
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
    return _$$StepResultToJson(
      this,
    );
  }
}

abstract class StepResult implements AnyStep {
  const factory StepResult(
      {required final String layout,
      required final String variant}) = _$StepResult;

  factory StepResult.fromJson(Map<String, dynamic> json) =
      _$StepResult.fromJson;

  String get layout;
  String get variant;
  @JsonKey(ignore: true)
  _$$StepResultCopyWith<_$StepResult> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardSetting _$KeyboardSettingFromJson(Map<String, dynamic> json) {
  return _KeyboardSetting.fromJson(json);
}

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
abstract class _$$_KeyboardSettingCopyWith<$Res>
    implements $KeyboardSettingCopyWith<$Res> {
  factory _$$_KeyboardSettingCopyWith(
          _$_KeyboardSetting value, $Res Function(_$_KeyboardSetting) then) =
      __$$_KeyboardSettingCopyWithImpl<$Res>;
  @override
  $Res call({String layout, String variant, String? toggle});
}

/// @nodoc
class __$$_KeyboardSettingCopyWithImpl<$Res>
    extends _$KeyboardSettingCopyWithImpl<$Res>
    implements _$$_KeyboardSettingCopyWith<$Res> {
  __$$_KeyboardSettingCopyWithImpl(
      _$_KeyboardSetting _value, $Res Function(_$_KeyboardSetting) _then)
      : super(_value, (v) => _then(v as _$_KeyboardSetting));

  @override
  _$_KeyboardSetting get _value => super._value as _$_KeyboardSetting;

  @override
  $Res call({
    Object? layout = freezed,
    Object? variant = freezed,
    Object? toggle = freezed,
  }) {
    return _then(_$_KeyboardSetting(
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
      _$$_KeyboardSettingFromJson(json);

  @override
  final String layout;
  @override
  @JsonKey()
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
        (other.runtimeType == runtimeType &&
            other is _$_KeyboardSetting &&
            const DeepCollectionEquality().equals(other.layout, layout) &&
            const DeepCollectionEquality().equals(other.variant, variant) &&
            const DeepCollectionEquality().equals(other.toggle, toggle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(layout),
      const DeepCollectionEquality().hash(variant),
      const DeepCollectionEquality().hash(toggle));

  @JsonKey(ignore: true)
  @override
  _$$_KeyboardSettingCopyWith<_$_KeyboardSetting> get copyWith =>
      __$$_KeyboardSettingCopyWithImpl<_$_KeyboardSetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyboardSettingToJson(
      this,
    );
  }
}

abstract class _KeyboardSetting implements KeyboardSetting {
  const factory _KeyboardSetting(
      {required final String layout,
      final String variant,
      final String? toggle}) = _$_KeyboardSetting;

  factory _KeyboardSetting.fromJson(Map<String, dynamic> json) =
      _$_KeyboardSetting.fromJson;

  @override
  String get layout;
  @override
  String get variant;
  @override
  String? get toggle;
  @override
  @JsonKey(ignore: true)
  _$$_KeyboardSettingCopyWith<_$_KeyboardSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardVariant _$KeyboardVariantFromJson(Map<String, dynamic> json) {
  return _KeyboardVariant.fromJson(json);
}

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
abstract class _$$_KeyboardVariantCopyWith<$Res>
    implements $KeyboardVariantCopyWith<$Res> {
  factory _$$_KeyboardVariantCopyWith(
          _$_KeyboardVariant value, $Res Function(_$_KeyboardVariant) then) =
      __$$_KeyboardVariantCopyWithImpl<$Res>;
  @override
  $Res call({String code, String name});
}

/// @nodoc
class __$$_KeyboardVariantCopyWithImpl<$Res>
    extends _$KeyboardVariantCopyWithImpl<$Res>
    implements _$$_KeyboardVariantCopyWith<$Res> {
  __$$_KeyboardVariantCopyWithImpl(
      _$_KeyboardVariant _value, $Res Function(_$_KeyboardVariant) _then)
      : super(_value, (v) => _then(v as _$_KeyboardVariant));

  @override
  _$_KeyboardVariant get _value => super._value as _$_KeyboardVariant;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_KeyboardVariant(
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
      _$$_KeyboardVariantFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_KeyboardVariant &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_KeyboardVariantCopyWith<_$_KeyboardVariant> get copyWith =>
      __$$_KeyboardVariantCopyWithImpl<_$_KeyboardVariant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyboardVariantToJson(
      this,
    );
  }
}

abstract class _KeyboardVariant implements KeyboardVariant {
  const factory _KeyboardVariant(
      {required final String code,
      required final String name}) = _$_KeyboardVariant;

  factory _KeyboardVariant.fromJson(Map<String, dynamic> json) =
      _$_KeyboardVariant.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_KeyboardVariantCopyWith<_$_KeyboardVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardLayout _$KeyboardLayoutFromJson(Map<String, dynamic> json) {
  return _KeyboardLayout.fromJson(json);
}

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
abstract class _$$_KeyboardLayoutCopyWith<$Res>
    implements $KeyboardLayoutCopyWith<$Res> {
  factory _$$_KeyboardLayoutCopyWith(
          _$_KeyboardLayout value, $Res Function(_$_KeyboardLayout) then) =
      __$$_KeyboardLayoutCopyWithImpl<$Res>;
  @override
  $Res call({String code, String name, List<KeyboardVariant> variants});
}

/// @nodoc
class __$$_KeyboardLayoutCopyWithImpl<$Res>
    extends _$KeyboardLayoutCopyWithImpl<$Res>
    implements _$$_KeyboardLayoutCopyWith<$Res> {
  __$$_KeyboardLayoutCopyWithImpl(
      _$_KeyboardLayout _value, $Res Function(_$_KeyboardLayout) _then)
      : super(_value, (v) => _then(v as _$_KeyboardLayout));

  @override
  _$_KeyboardLayout get _value => super._value as _$_KeyboardLayout;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? variants = freezed,
  }) {
    return _then(_$_KeyboardLayout(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variants: variants == freezed
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<KeyboardVariant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardLayout implements _KeyboardLayout {
  const _$_KeyboardLayout(
      {required this.code,
      required this.name,
      required final List<KeyboardVariant> variants})
      : _variants = variants;

  factory _$_KeyboardLayout.fromJson(Map<String, dynamic> json) =>
      _$$_KeyboardLayoutFromJson(json);

  @override
  final String code;
  @override
  final String name;
  final List<KeyboardVariant> _variants;
  @override
  List<KeyboardVariant> get variants {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  String toString() {
    return 'KeyboardLayout(code: $code, name: $name, variants: $variants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeyboardLayout &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._variants, _variants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_variants));

  @JsonKey(ignore: true)
  @override
  _$$_KeyboardLayoutCopyWith<_$_KeyboardLayout> get copyWith =>
      __$$_KeyboardLayoutCopyWithImpl<_$_KeyboardLayout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyboardLayoutToJson(
      this,
    );
  }
}

abstract class _KeyboardLayout implements KeyboardLayout {
  const factory _KeyboardLayout(
      {required final String code,
      required final String name,
      required final List<KeyboardVariant> variants}) = _$_KeyboardLayout;

  factory _KeyboardLayout.fromJson(Map<String, dynamic> json) =
      _$_KeyboardLayout.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  List<KeyboardVariant> get variants;
  @override
  @JsonKey(ignore: true)
  _$$_KeyboardLayoutCopyWith<_$_KeyboardLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyboardSetup _$KeyboardSetupFromJson(Map<String, dynamic> json) {
  return _KeyboardSetup.fromJson(json);
}

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
abstract class _$$_KeyboardSetupCopyWith<$Res>
    implements $KeyboardSetupCopyWith<$Res> {
  factory _$$_KeyboardSetupCopyWith(
          _$_KeyboardSetup value, $Res Function(_$_KeyboardSetup) then) =
      __$$_KeyboardSetupCopyWithImpl<$Res>;
  @override
  $Res call({KeyboardSetting setting, List<KeyboardLayout> layouts});

  @override
  $KeyboardSettingCopyWith<$Res> get setting;
}

/// @nodoc
class __$$_KeyboardSetupCopyWithImpl<$Res>
    extends _$KeyboardSetupCopyWithImpl<$Res>
    implements _$$_KeyboardSetupCopyWith<$Res> {
  __$$_KeyboardSetupCopyWithImpl(
      _$_KeyboardSetup _value, $Res Function(_$_KeyboardSetup) _then)
      : super(_value, (v) => _then(v as _$_KeyboardSetup));

  @override
  _$_KeyboardSetup get _value => super._value as _$_KeyboardSetup;

  @override
  $Res call({
    Object? setting = freezed,
    Object? layouts = freezed,
  }) {
    return _then(_$_KeyboardSetup(
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as KeyboardSetting,
      layouts: layouts == freezed
          ? _value._layouts
          : layouts // ignore: cast_nullable_to_non_nullable
              as List<KeyboardLayout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardSetup implements _KeyboardSetup {
  const _$_KeyboardSetup(
      {required this.setting, required final List<KeyboardLayout> layouts})
      : _layouts = layouts;

  factory _$_KeyboardSetup.fromJson(Map<String, dynamic> json) =>
      _$$_KeyboardSetupFromJson(json);

  @override
  final KeyboardSetting setting;
  final List<KeyboardLayout> _layouts;
  @override
  List<KeyboardLayout> get layouts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_layouts);
  }

  @override
  String toString() {
    return 'KeyboardSetup(setting: $setting, layouts: $layouts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeyboardSetup &&
            const DeepCollectionEquality().equals(other.setting, setting) &&
            const DeepCollectionEquality().equals(other._layouts, _layouts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(setting),
      const DeepCollectionEquality().hash(_layouts));

  @JsonKey(ignore: true)
  @override
  _$$_KeyboardSetupCopyWith<_$_KeyboardSetup> get copyWith =>
      __$$_KeyboardSetupCopyWithImpl<_$_KeyboardSetup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeyboardSetupToJson(
      this,
    );
  }
}

abstract class _KeyboardSetup implements KeyboardSetup {
  const factory _KeyboardSetup(
      {required final KeyboardSetting setting,
      required final List<KeyboardLayout> layouts}) = _$_KeyboardSetup;

  factory _KeyboardSetup.fromJson(Map<String, dynamic> json) =
      _$_KeyboardSetup.fromJson;

  @override
  KeyboardSetting get setting;
  @override
  List<KeyboardLayout> get layouts;
  @override
  @JsonKey(ignore: true)
  _$$_KeyboardSetupCopyWith<_$_KeyboardSetup> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceSelection _$SourceSelectionFromJson(Map<String, dynamic> json) {
  return _SourceSelection.fromJson(json);
}

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
abstract class _$$_SourceSelectionCopyWith<$Res>
    implements $SourceSelectionCopyWith<$Res> {
  factory _$$_SourceSelectionCopyWith(
          _$_SourceSelection value, $Res Function(_$_SourceSelection) then) =
      __$$_SourceSelectionCopyWithImpl<$Res>;
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
class __$$_SourceSelectionCopyWithImpl<$Res>
    extends _$SourceSelectionCopyWithImpl<$Res>
    implements _$$_SourceSelectionCopyWith<$Res> {
  __$$_SourceSelectionCopyWithImpl(
      _$_SourceSelection _value, $Res Function(_$_SourceSelection) _then)
      : super(_value, (v) => _then(v as _$_SourceSelection));

  @override
  _$_SourceSelection get _value => super._value as _$_SourceSelection;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? size = freezed,
    Object? variant = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_$_SourceSelection(
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
      _$$_SourceSelectionFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_SourceSelection &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.variant, variant) &&
            const DeepCollectionEquality().equals(other.isDefault, isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(variant),
      const DeepCollectionEquality().hash(isDefault));

  @JsonKey(ignore: true)
  @override
  _$$_SourceSelectionCopyWith<_$_SourceSelection> get copyWith =>
      __$$_SourceSelectionCopyWithImpl<_$_SourceSelection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SourceSelectionToJson(
      this,
    );
  }
}

abstract class _SourceSelection implements SourceSelection {
  const factory _SourceSelection(
          {required final String name,
          required final String description,
          required final String id,
          required final int size,
          required final String variant,
          @JsonKey(name: 'default') required final bool isDefault}) =
      _$_SourceSelection;

  factory _SourceSelection.fromJson(Map<String, dynamic> json) =
      _$_SourceSelection.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get id;
  @override
  int get size;
  @override
  String get variant;
  @override
  @JsonKey(name: 'default')
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$_SourceSelectionCopyWith<_$_SourceSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceSelectionAndSetting _$SourceSelectionAndSettingFromJson(
    Map<String, dynamic> json) {
  return _SourceSelectionAndSetting.fromJson(json);
}

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
abstract class _$$_SourceSelectionAndSettingCopyWith<$Res>
    implements $SourceSelectionAndSettingCopyWith<$Res> {
  factory _$$_SourceSelectionAndSettingCopyWith(
          _$_SourceSelectionAndSetting value,
          $Res Function(_$_SourceSelectionAndSetting) then) =
      __$$_SourceSelectionAndSettingCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SourceSelection> sources, String currentId, bool searchDrivers});
}

/// @nodoc
class __$$_SourceSelectionAndSettingCopyWithImpl<$Res>
    extends _$SourceSelectionAndSettingCopyWithImpl<$Res>
    implements _$$_SourceSelectionAndSettingCopyWith<$Res> {
  __$$_SourceSelectionAndSettingCopyWithImpl(
      _$_SourceSelectionAndSetting _value,
      $Res Function(_$_SourceSelectionAndSetting) _then)
      : super(_value, (v) => _then(v as _$_SourceSelectionAndSetting));

  @override
  _$_SourceSelectionAndSetting get _value =>
      super._value as _$_SourceSelectionAndSetting;

  @override
  $Res call({
    Object? sources = freezed,
    Object? currentId = freezed,
    Object? searchDrivers = freezed,
  }) {
    return _then(_$_SourceSelectionAndSetting(
      sources: sources == freezed
          ? _value._sources
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
      {required final List<SourceSelection> sources,
      required this.currentId,
      required this.searchDrivers})
      : _sources = sources;

  factory _$_SourceSelectionAndSetting.fromJson(Map<String, dynamic> json) =>
      _$$_SourceSelectionAndSettingFromJson(json);

  final List<SourceSelection> _sources;
  @override
  List<SourceSelection> get sources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_SourceSelectionAndSetting &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality().equals(other.currentId, currentId) &&
            const DeepCollectionEquality()
                .equals(other.searchDrivers, searchDrivers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(currentId),
      const DeepCollectionEquality().hash(searchDrivers));

  @JsonKey(ignore: true)
  @override
  _$$_SourceSelectionAndSettingCopyWith<_$_SourceSelectionAndSetting>
      get copyWith => __$$_SourceSelectionAndSettingCopyWithImpl<
          _$_SourceSelectionAndSetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SourceSelectionAndSettingToJson(
      this,
    );
  }
}

abstract class _SourceSelectionAndSetting implements SourceSelectionAndSetting {
  const factory _SourceSelectionAndSetting(
      {required final List<SourceSelection> sources,
      required final String currentId,
      required final bool searchDrivers}) = _$_SourceSelectionAndSetting;

  factory _SourceSelectionAndSetting.fromJson(Map<String, dynamic> json) =
      _$_SourceSelectionAndSetting.fromJson;

  @override
  List<SourceSelection> get sources;
  @override
  String get currentId;
  @override
  bool get searchDrivers;
  @override
  @JsonKey(ignore: true)
  _$$_SourceSelectionAndSettingCopyWith<_$_SourceSelectionAndSetting>
      get copyWith => throw _privateConstructorUsedError;
}

ZdevInfo _$ZdevInfoFromJson(Map<String, dynamic> json) {
  return _ZdevInfo.fromJson(json);
}

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
abstract class _$$_ZdevInfoCopyWith<$Res> implements $ZdevInfoCopyWith<$Res> {
  factory _$$_ZdevInfoCopyWith(
          _$_ZdevInfo value, $Res Function(_$_ZdevInfo) then) =
      __$$_ZdevInfoCopyWithImpl<$Res>;
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
class __$$_ZdevInfoCopyWithImpl<$Res> extends _$ZdevInfoCopyWithImpl<$Res>
    implements _$$_ZdevInfoCopyWith<$Res> {
  __$$_ZdevInfoCopyWithImpl(
      _$_ZdevInfo _value, $Res Function(_$_ZdevInfo) _then)
      : super(_value, (v) => _then(v as _$_ZdevInfo));

  @override
  _$_ZdevInfo get _value => super._value as _$_ZdevInfo;

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
    return _then(_$_ZdevInfo(
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
      _$$_ZdevInfoFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ZdevInfo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.on, on) &&
            const DeepCollectionEquality().equals(other.exists, exists) &&
            const DeepCollectionEquality().equals(other.pers, pers) &&
            const DeepCollectionEquality().equals(other.auto, auto) &&
            const DeepCollectionEquality().equals(other.failed, failed) &&
            const DeepCollectionEquality().equals(other.names, names));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(on),
      const DeepCollectionEquality().hash(exists),
      const DeepCollectionEquality().hash(pers),
      const DeepCollectionEquality().hash(auto),
      const DeepCollectionEquality().hash(failed),
      const DeepCollectionEquality().hash(names));

  @JsonKey(ignore: true)
  @override
  _$$_ZdevInfoCopyWith<_$_ZdevInfo> get copyWith =>
      __$$_ZdevInfoCopyWithImpl<_$_ZdevInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ZdevInfoToJson(
      this,
    );
  }
}

abstract class _ZdevInfo implements ZdevInfo {
  const factory _ZdevInfo(
      {required final String id,
      required final String type,
      required final bool on,
      required final bool exists,
      required final bool pers,
      required final bool auto,
      required final bool failed,
      required final String names}) = _$_ZdevInfo;

  factory _ZdevInfo.fromJson(Map<String, dynamic> json) = _$_ZdevInfo.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  bool get on;
  @override
  bool get exists;
  @override
  bool get pers;
  @override
  bool get auto;
  @override
  bool get failed;
  @override
  String get names;
  @override
  @JsonKey(ignore: true)
  _$$_ZdevInfoCopyWith<_$_ZdevInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

NetworkStatus _$NetworkStatusFromJson(Map<String, dynamic> json) {
  return _NetworkStatus.fromJson(json);
}

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
abstract class _$$_NetworkStatusCopyWith<$Res>
    implements $NetworkStatusCopyWith<$Res> {
  factory _$$_NetworkStatusCopyWith(
          _$_NetworkStatus value, $Res Function(_$_NetworkStatus) then) =
      __$$_NetworkStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<NetDevInfo> devices,
      WLANSupportInstallState wlanSupportInstallState});
}

/// @nodoc
class __$$_NetworkStatusCopyWithImpl<$Res>
    extends _$NetworkStatusCopyWithImpl<$Res>
    implements _$$_NetworkStatusCopyWith<$Res> {
  __$$_NetworkStatusCopyWithImpl(
      _$_NetworkStatus _value, $Res Function(_$_NetworkStatus) _then)
      : super(_value, (v) => _then(v as _$_NetworkStatus));

  @override
  _$_NetworkStatus get _value => super._value as _$_NetworkStatus;

  @override
  $Res call({
    Object? devices = freezed,
    Object? wlanSupportInstallState = freezed,
  }) {
    return _then(_$_NetworkStatus(
      devices: devices == freezed
          ? _value._devices
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
      {required final List<NetDevInfo> devices,
      required this.wlanSupportInstallState})
      : _devices = devices;

  factory _$_NetworkStatus.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkStatusFromJson(json);

  final List<NetDevInfo> _devices;
  @override
  List<NetDevInfo> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final WLANSupportInstallState wlanSupportInstallState;

  @override
  String toString() {
    return 'NetworkStatus(devices: $devices, wlanSupportInstallState: $wlanSupportInstallState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkStatus &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality().equals(
                other.wlanSupportInstallState, wlanSupportInstallState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(wlanSupportInstallState));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkStatusCopyWith<_$_NetworkStatus> get copyWith =>
      __$$_NetworkStatusCopyWithImpl<_$_NetworkStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkStatusToJson(
      this,
    );
  }
}

abstract class _NetworkStatus implements NetworkStatus {
  const factory _NetworkStatus(
          {required final List<NetDevInfo> devices,
          required final WLANSupportInstallState wlanSupportInstallState}) =
      _$_NetworkStatus;

  factory _NetworkStatus.fromJson(Map<String, dynamic> json) =
      _$_NetworkStatus.fromJson;

  @override
  List<NetDevInfo> get devices;
  @override
  WLANSupportInstallState get wlanSupportInstallState;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkStatusCopyWith<_$_NetworkStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

OsProber _$OsProberFromJson(Map<String, dynamic> json) {
  return _OsProber.fromJson(json);
}

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
abstract class _$$_OsProberCopyWith<$Res> implements $OsProberCopyWith<$Res> {
  factory _$$_OsProberCopyWith(
          _$_OsProber value, $Res Function(_$_OsProber) then) =
      __$$_OsProberCopyWithImpl<$Res>;
  @override
  $Res call(
      {String long,
      String label,
      String type,
      String? subpath,
      String? version});
}

/// @nodoc
class __$$_OsProberCopyWithImpl<$Res> extends _$OsProberCopyWithImpl<$Res>
    implements _$$_OsProberCopyWith<$Res> {
  __$$_OsProberCopyWithImpl(
      _$_OsProber _value, $Res Function(_$_OsProber) _then)
      : super(_value, (v) => _then(v as _$_OsProber));

  @override
  _$_OsProber get _value => super._value as _$_OsProber;

  @override
  $Res call({
    Object? long = freezed,
    Object? label = freezed,
    Object? type = freezed,
    Object? subpath = freezed,
    Object? version = freezed,
  }) {
    return _then(_$_OsProber(
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
      _$$_OsProberFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_OsProber &&
            const DeepCollectionEquality().equals(other.long, long) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.subpath, subpath) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(long),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(subpath),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$$_OsProberCopyWith<_$_OsProber> get copyWith =>
      __$$_OsProberCopyWithImpl<_$_OsProber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OsProberToJson(
      this,
    );
  }
}

abstract class _OsProber implements OsProber {
  const factory _OsProber(
      {required final String long,
      required final String label,
      required final String type,
      final String? subpath,
      final String? version}) = _$_OsProber;

  factory _OsProber.fromJson(Map<String, dynamic> json) = _$_OsProber.fromJson;

  @override
  String get long;
  @override
  String get label;
  @override
  String get type;
  @override
  String? get subpath;
  @override
  String? get version;
  @override
  @JsonKey(ignore: true)
  _$$_OsProberCopyWith<_$_OsProber> get copyWith =>
      throw _privateConstructorUsedError;
}

PartitionOrGap _$PartitionOrGapFromJson(Map<String, dynamic> json) {
  switch (json['\$type']) {
    case 'Partition':
      return Partition.fromJson(json);
    case 'Gap':
      return Gap.fromJson(json);

    default:
      throw CheckedFromJsonException(json, '\$type', 'PartitionOrGap',
          'Invalid union type "${json['\$type']}"!');
  }
}

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
            int? estimatedMinSize,
            bool? resize,
            String? path)
        partition,
    required TResult Function(int offset, int size, GapUsable usable) gap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
            int? estimatedMinSize,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size, GapUsable usable)? gap,
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
            int? estimatedMinSize,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size, GapUsable usable)? gap,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Partition value)? partition,
    TResult Function(Gap value)? gap,
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
abstract class _$$PartitionCopyWith<$Res> {
  factory _$$PartitionCopyWith(
          _$Partition value, $Res Function(_$Partition) then) =
      __$$PartitionCopyWithImpl<$Res>;
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
      int? estimatedMinSize,
      bool? resize,
      String? path});

  $OsProberCopyWith<$Res>? get os;
}

/// @nodoc
class __$$PartitionCopyWithImpl<$Res> extends _$PartitionOrGapCopyWithImpl<$Res>
    implements _$$PartitionCopyWith<$Res> {
  __$$PartitionCopyWithImpl(
      _$Partition _value, $Res Function(_$Partition) _then)
      : super(_value, (v) => _then(v as _$Partition));

  @override
  _$Partition get _value => super._value as _$Partition;

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
    Object? estimatedMinSize = freezed,
    Object? resize = freezed,
    Object? path = freezed,
  }) {
    return _then(_$Partition(
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
          ? _value._annotations
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
      estimatedMinSize: estimatedMinSize == freezed
          ? _value.estimatedMinSize
          : estimatedMinSize // ignore: cast_nullable_to_non_nullable
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
class _$Partition implements Partition {
  const _$Partition(
      {this.size,
      this.number,
      this.preserve,
      this.wipe,
      final List<String> annotations = const [],
      this.mount,
      this.format,
      this.grubDevice,
      this.boot,
      this.os,
      this.offset,
      this.estimatedMinSize = -1,
      this.resize,
      this.path,
      final String? $type})
      : _annotations = annotations,
        $type = $type ?? 'Partition';

  factory _$Partition.fromJson(Map<String, dynamic> json) =>
      _$$PartitionFromJson(json);

  @override
  final int? size;
  @override
  final int? number;
  @override
  final bool? preserve;
  @override
  final String? wipe;
  final List<String> _annotations;
  @override
  @JsonKey()
  List<String> get annotations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_annotations);
  }

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
  @JsonKey()
  final int? estimatedMinSize;
  @override
  final bool? resize;
  @override
  final String? path;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'PartitionOrGap.partition(size: $size, number: $number, preserve: $preserve, wipe: $wipe, annotations: $annotations, mount: $mount, format: $format, grubDevice: $grubDevice, boot: $boot, os: $os, offset: $offset, estimatedMinSize: $estimatedMinSize, resize: $resize, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Partition &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.preserve, preserve) &&
            const DeepCollectionEquality().equals(other.wipe, wipe) &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations) &&
            const DeepCollectionEquality().equals(other.mount, mount) &&
            const DeepCollectionEquality().equals(other.format, format) &&
            const DeepCollectionEquality()
                .equals(other.grubDevice, grubDevice) &&
            const DeepCollectionEquality().equals(other.boot, boot) &&
            const DeepCollectionEquality().equals(other.os, os) &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality()
                .equals(other.estimatedMinSize, estimatedMinSize) &&
            const DeepCollectionEquality().equals(other.resize, resize) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(preserve),
      const DeepCollectionEquality().hash(wipe),
      const DeepCollectionEquality().hash(_annotations),
      const DeepCollectionEquality().hash(mount),
      const DeepCollectionEquality().hash(format),
      const DeepCollectionEquality().hash(grubDevice),
      const DeepCollectionEquality().hash(boot),
      const DeepCollectionEquality().hash(os),
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(estimatedMinSize),
      const DeepCollectionEquality().hash(resize),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$PartitionCopyWith<_$Partition> get copyWith =>
      __$$PartitionCopyWithImpl<_$Partition>(this, _$identity);

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
            int? estimatedMinSize,
            bool? resize,
            String? path)
        partition,
    required TResult Function(int offset, int size, GapUsable usable) gap,
  }) {
    return partition(size, number, preserve, wipe, annotations, mount, format,
        grubDevice, boot, os, offset, estimatedMinSize, resize, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
            int? estimatedMinSize,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size, GapUsable usable)? gap,
  }) {
    return partition?.call(size, number, preserve, wipe, annotations, mount,
        format, grubDevice, boot, os, offset, estimatedMinSize, resize, path);
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
            int? estimatedMinSize,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size, GapUsable usable)? gap,
    required TResult orElse(),
  }) {
    if (partition != null) {
      return partition(size, number, preserve, wipe, annotations, mount, format,
          grubDevice, boot, os, offset, estimatedMinSize, resize, path);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Partition value)? partition,
    TResult Function(Gap value)? gap,
  }) {
    return partition?.call(this);
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
    return _$$PartitionToJson(
      this,
    );
  }
}

abstract class Partition implements PartitionOrGap {
  const factory Partition(
      {final int? size,
      final int? number,
      final bool? preserve,
      final String? wipe,
      final List<String> annotations,
      final String? mount,
      final String? format,
      final bool? grubDevice,
      final bool? boot,
      final OsProber? os,
      final int? offset,
      final int? estimatedMinSize,
      final bool? resize,
      final String? path}) = _$Partition;

  factory Partition.fromJson(Map<String, dynamic> json) = _$Partition.fromJson;

  int? get size;
  int? get number;
  bool? get preserve;
  String? get wipe;
  List<String> get annotations;
  String? get mount;
  String? get format;
  bool? get grubDevice;
  bool? get boot;
  OsProber? get os;
  int? get offset;
  int? get estimatedMinSize;
  bool? get resize;
  String? get path;
  @JsonKey(ignore: true)
  _$$PartitionCopyWith<_$Partition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GapCopyWith<$Res> {
  factory _$$GapCopyWith(_$Gap value, $Res Function(_$Gap) then) =
      __$$GapCopyWithImpl<$Res>;
  $Res call({int offset, int size, GapUsable usable});
}

/// @nodoc
class __$$GapCopyWithImpl<$Res> extends _$PartitionOrGapCopyWithImpl<$Res>
    implements _$$GapCopyWith<$Res> {
  __$$GapCopyWithImpl(_$Gap _value, $Res Function(_$Gap) _then)
      : super(_value, (v) => _then(v as _$Gap));

  @override
  _$Gap get _value => super._value as _$Gap;

  @override
  $Res call({
    Object? offset = freezed,
    Object? size = freezed,
    Object? usable = freezed,
  }) {
    return _then(_$Gap(
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      usable: usable == freezed
          ? _value.usable
          : usable // ignore: cast_nullable_to_non_nullable
              as GapUsable,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Gap implements Gap {
  const _$Gap(
      {required this.offset,
      required this.size,
      required this.usable,
      final String? $type})
      : $type = $type ?? 'Gap';

  factory _$Gap.fromJson(Map<String, dynamic> json) => _$$GapFromJson(json);

  @override
  final int offset;
  @override
  final int size;
  @override
  final GapUsable usable;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'PartitionOrGap.gap(offset: $offset, size: $size, usable: $usable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Gap &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.usable, usable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(usable));

  @JsonKey(ignore: true)
  @override
  _$$GapCopyWith<_$Gap> get copyWith =>
      __$$GapCopyWithImpl<_$Gap>(this, _$identity);

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
            int? estimatedMinSize,
            bool? resize,
            String? path)
        partition,
    required TResult Function(int offset, int size, GapUsable usable) gap,
  }) {
    return gap(offset, size, usable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
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
            int? estimatedMinSize,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size, GapUsable usable)? gap,
  }) {
    return gap?.call(offset, size, usable);
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
            int? estimatedMinSize,
            bool? resize,
            String? path)?
        partition,
    TResult Function(int offset, int size, GapUsable usable)? gap,
    required TResult orElse(),
  }) {
    if (gap != null) {
      return gap(offset, size, usable);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Partition value)? partition,
    TResult Function(Gap value)? gap,
  }) {
    return gap?.call(this);
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
    return _$$GapToJson(
      this,
    );
  }
}

abstract class Gap implements PartitionOrGap {
  const factory Gap(
      {required final int offset,
      required final int size,
      required final GapUsable usable}) = _$Gap;

  factory Gap.fromJson(Map<String, dynamic> json) = _$Gap.fromJson;

  int get offset;
  int get size;
  GapUsable get usable;
  @JsonKey(ignore: true)
  _$$GapCopyWith<_$Gap> get copyWith => throw _privateConstructorUsedError;
}

Disk _$DiskFromJson(Map<String, dynamic> json) {
  return _Disk.fromJson(json);
}

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
abstract class _$$_DiskCopyWith<$Res> implements $DiskCopyWith<$Res> {
  factory _$$_DiskCopyWith(_$_Disk value, $Res Function(_$_Disk) then) =
      __$$_DiskCopyWithImpl<$Res>;
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
class __$$_DiskCopyWithImpl<$Res> extends _$DiskCopyWithImpl<$Res>
    implements _$$_DiskCopyWith<$Res> {
  __$$_DiskCopyWithImpl(_$_Disk _value, $Res Function(_$_Disk) _then)
      : super(_value, (v) => _then(v as _$_Disk));

  @override
  _$_Disk get _value => super._value as _$_Disk;

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
    return _then(_$_Disk(
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
          ? _value._usageLabels
          : usageLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      partitions: partitions == freezed
          ? _value._partitions
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
      required final List<String> usageLabels,
      required final List<PartitionOrGap> partitions,
      required this.okForGuided,
      required this.ptable,
      required this.preserve,
      required this.path,
      required this.bootDevice,
      this.model,
      this.vendor})
      : _usageLabels = usageLabels,
        _partitions = partitions;

  factory _$_Disk.fromJson(Map<String, dynamic> json) => _$$_DiskFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String type;
  @override
  final int size;
  final List<String> _usageLabels;
  @override
  List<String> get usageLabels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usageLabels);
  }

  final List<PartitionOrGap> _partitions;
  @override
  List<PartitionOrGap> get partitions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partitions);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_Disk &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality()
                .equals(other._usageLabels, _usageLabels) &&
            const DeepCollectionEquality()
                .equals(other._partitions, _partitions) &&
            const DeepCollectionEquality()
                .equals(other.okForGuided, okForGuided) &&
            const DeepCollectionEquality().equals(other.ptable, ptable) &&
            const DeepCollectionEquality().equals(other.preserve, preserve) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality()
                .equals(other.bootDevice, bootDevice) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.vendor, vendor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(_usageLabels),
      const DeepCollectionEquality().hash(_partitions),
      const DeepCollectionEquality().hash(okForGuided),
      const DeepCollectionEquality().hash(ptable),
      const DeepCollectionEquality().hash(preserve),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(bootDevice),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(vendor));

  @JsonKey(ignore: true)
  @override
  _$$_DiskCopyWith<_$_Disk> get copyWith =>
      __$$_DiskCopyWithImpl<_$_Disk>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiskToJson(
      this,
    );
  }
}

abstract class _Disk implements Disk {
  const factory _Disk(
      {required final String id,
      required final String label,
      required final String type,
      required final int size,
      required final List<String> usageLabels,
      required final List<PartitionOrGap> partitions,
      required final bool okForGuided,
      required final String? ptable,
      required final bool preserve,
      required final String? path,
      required final bool bootDevice,
      final String? model,
      final String? vendor}) = _$_Disk;

  factory _Disk.fromJson(Map<String, dynamic> json) = _$_Disk.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get type;
  @override
  int get size;
  @override
  List<String> get usageLabels;
  @override
  List<PartitionOrGap> get partitions;
  @override
  bool get okForGuided;
  @override
  String? get ptable;
  @override
  bool get preserve;
  @override
  String? get path;
  @override
  bool get bootDevice;
  @override
  String? get model;
  @override
  String? get vendor;
  @override
  @JsonKey(ignore: true)
  _$$_DiskCopyWith<_$_Disk> get copyWith => throw _privateConstructorUsedError;
}

GuidedChoice _$GuidedChoiceFromJson(Map<String, dynamic> json) {
  return _GuidedChoice.fromJson(json);
}

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
abstract class _$$_GuidedChoiceCopyWith<$Res>
    implements $GuidedChoiceCopyWith<$Res> {
  factory _$$_GuidedChoiceCopyWith(
          _$_GuidedChoice value, $Res Function(_$_GuidedChoice) then) =
      __$$_GuidedChoiceCopyWithImpl<$Res>;
  @override
  $Res call({String diskId, bool useLvm, String? password});
}

/// @nodoc
class __$$_GuidedChoiceCopyWithImpl<$Res>
    extends _$GuidedChoiceCopyWithImpl<$Res>
    implements _$$_GuidedChoiceCopyWith<$Res> {
  __$$_GuidedChoiceCopyWithImpl(
      _$_GuidedChoice _value, $Res Function(_$_GuidedChoice) _then)
      : super(_value, (v) => _then(v as _$_GuidedChoice));

  @override
  _$_GuidedChoice get _value => super._value as _$_GuidedChoice;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? useLvm = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_GuidedChoice(
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
      _$$_GuidedChoiceFromJson(json);

  @override
  final String diskId;
  @override
  @JsonKey()
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
        (other.runtimeType == runtimeType &&
            other is _$_GuidedChoice &&
            const DeepCollectionEquality().equals(other.diskId, diskId) &&
            const DeepCollectionEquality().equals(other.useLvm, useLvm) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diskId),
      const DeepCollectionEquality().hash(useLvm),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_GuidedChoiceCopyWith<_$_GuidedChoice> get copyWith =>
      __$$_GuidedChoiceCopyWithImpl<_$_GuidedChoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuidedChoiceToJson(
      this,
    );
  }
}

abstract class _GuidedChoice implements GuidedChoice {
  const factory _GuidedChoice(
      {required final String diskId,
      final bool useLvm,
      final String? password}) = _$_GuidedChoice;

  factory _GuidedChoice.fromJson(Map<String, dynamic> json) =
      _$_GuidedChoice.fromJson;

  @override
  String get diskId;
  @override
  bool get useLvm;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_GuidedChoiceCopyWith<_$_GuidedChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

GuidedStorageResponse _$GuidedStorageResponseFromJson(
    Map<String, dynamic> json) {
  return _GuidedStorageResponse.fromJson(json);
}

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
abstract class _$$_GuidedStorageResponseCopyWith<$Res>
    implements $GuidedStorageResponseCopyWith<$Res> {
  factory _$$_GuidedStorageResponseCopyWith(_$_GuidedStorageResponse value,
          $Res Function(_$_GuidedStorageResponse) then) =
      __$$_GuidedStorageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {ProbeStatus status, ErrorReportRef? errorReport, List<Disk>? disks});

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class __$$_GuidedStorageResponseCopyWithImpl<$Res>
    extends _$GuidedStorageResponseCopyWithImpl<$Res>
    implements _$$_GuidedStorageResponseCopyWith<$Res> {
  __$$_GuidedStorageResponseCopyWithImpl(_$_GuidedStorageResponse _value,
      $Res Function(_$_GuidedStorageResponse) _then)
      : super(_value, (v) => _then(v as _$_GuidedStorageResponse));

  @override
  _$_GuidedStorageResponse get _value =>
      super._value as _$_GuidedStorageResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? disks = freezed,
  }) {
    return _then(_$_GuidedStorageResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      disks: disks == freezed
          ? _value._disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<Disk>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuidedStorageResponse implements _GuidedStorageResponse {
  const _$_GuidedStorageResponse(
      {required this.status, this.errorReport, final List<Disk>? disks})
      : _disks = disks;

  factory _$_GuidedStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GuidedStorageResponseFromJson(json);

  @override
  final ProbeStatus status;
  @override
  final ErrorReportRef? errorReport;
  final List<Disk>? _disks;
  @override
  List<Disk>? get disks {
    final value = _disks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GuidedStorageResponse(status: $status, errorReport: $errorReport, disks: $disks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuidedStorageResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorReport, errorReport) &&
            const DeepCollectionEquality().equals(other._disks, _disks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorReport),
      const DeepCollectionEquality().hash(_disks));

  @JsonKey(ignore: true)
  @override
  _$$_GuidedStorageResponseCopyWith<_$_GuidedStorageResponse> get copyWith =>
      __$$_GuidedStorageResponseCopyWithImpl<_$_GuidedStorageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuidedStorageResponseToJson(
      this,
    );
  }
}

abstract class _GuidedStorageResponse implements GuidedStorageResponse {
  const factory _GuidedStorageResponse(
      {required final ProbeStatus status,
      final ErrorReportRef? errorReport,
      final List<Disk>? disks}) = _$_GuidedStorageResponse;

  factory _GuidedStorageResponse.fromJson(Map<String, dynamic> json) =
      _$_GuidedStorageResponse.fromJson;

  @override
  ProbeStatus get status;
  @override
  ErrorReportRef? get errorReport;
  @override
  List<Disk>? get disks;
  @override
  @JsonKey(ignore: true)
  _$$_GuidedStorageResponseCopyWith<_$_GuidedStorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StorageResponse _$StorageResponseFromJson(Map<String, dynamic> json) {
  return _StorageResponse.fromJson(json);
}

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
abstract class _$$_StorageResponseCopyWith<$Res>
    implements $StorageResponseCopyWith<$Res> {
  factory _$$_StorageResponseCopyWith(
          _$_StorageResponse value, $Res Function(_$_StorageResponse) then) =
      __$$_StorageResponseCopyWithImpl<$Res>;
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
class __$$_StorageResponseCopyWithImpl<$Res>
    extends _$StorageResponseCopyWithImpl<$Res>
    implements _$$_StorageResponseCopyWith<$Res> {
  __$$_StorageResponseCopyWithImpl(
      _$_StorageResponse _value, $Res Function(_$_StorageResponse) _then)
      : super(_value, (v) => _then(v as _$_StorageResponse));

  @override
  _$_StorageResponse get _value => super._value as _$_StorageResponse;

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
    return _then(_$_StorageResponse(
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
          ? _value._origConfig
          : origConfig // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      config: config == freezed
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      blockdev: blockdev == freezed
          ? _value._blockdev
          : blockdev // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      dasd: dasd == freezed
          ? _value._dasd
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
      final List<dynamic>? origConfig,
      final List<dynamic>? config,
      final Map<String, dynamic>? blockdev,
      final Map<String, dynamic>? dasd,
      this.storageVersion = 1})
      : _origConfig = origConfig,
        _config = config,
        _blockdev = blockdev,
        _dasd = dasd;

  factory _$_StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StorageResponseFromJson(json);

  @override
  final ProbeStatus status;
  @override
  final ErrorReportRef? errorReport;
  @override
  final Bootloader? bootloader;
  final List<dynamic>? _origConfig;
  @override
  List<dynamic>? get origConfig {
    final value = _origConfig;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _config;
  @override
  List<dynamic>? get config {
    final value = _config;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _blockdev;
  @override
  Map<String, dynamic>? get blockdev {
    final value = _blockdev;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _dasd;
  @override
  Map<String, dynamic>? get dasd {
    final value = _dasd;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int storageVersion;

  @override
  String toString() {
    return 'StorageResponse(status: $status, errorReport: $errorReport, bootloader: $bootloader, origConfig: $origConfig, config: $config, blockdev: $blockdev, dasd: $dasd, storageVersion: $storageVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StorageResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorReport, errorReport) &&
            const DeepCollectionEquality()
                .equals(other.bootloader, bootloader) &&
            const DeepCollectionEquality()
                .equals(other._origConfig, _origConfig) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality().equals(other._blockdev, _blockdev) &&
            const DeepCollectionEquality().equals(other._dasd, _dasd) &&
            const DeepCollectionEquality()
                .equals(other.storageVersion, storageVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorReport),
      const DeepCollectionEquality().hash(bootloader),
      const DeepCollectionEquality().hash(_origConfig),
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(_blockdev),
      const DeepCollectionEquality().hash(_dasd),
      const DeepCollectionEquality().hash(storageVersion));

  @JsonKey(ignore: true)
  @override
  _$$_StorageResponseCopyWith<_$_StorageResponse> get copyWith =>
      __$$_StorageResponseCopyWithImpl<_$_StorageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StorageResponseToJson(
      this,
    );
  }
}

abstract class _StorageResponse implements StorageResponse {
  const factory _StorageResponse(
      {required final ProbeStatus status,
      final ErrorReportRef? errorReport,
      final Bootloader? bootloader,
      final List<dynamic>? origConfig,
      final List<dynamic>? config,
      final Map<String, dynamic>? blockdev,
      final Map<String, dynamic>? dasd,
      final int storageVersion}) = _$_StorageResponse;

  factory _StorageResponse.fromJson(Map<String, dynamic> json) =
      _$_StorageResponse.fromJson;

  @override
  ProbeStatus get status;
  @override
  ErrorReportRef? get errorReport;
  @override
  Bootloader? get bootloader;
  @override
  List<dynamic>? get origConfig;
  @override
  List<dynamic>? get config;
  @override
  Map<String, dynamic>? get blockdev;
  @override
  Map<String, dynamic>? get dasd;
  @override
  int get storageVersion;
  @override
  @JsonKey(ignore: true)
  _$$_StorageResponseCopyWith<_$_StorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StorageResponseV2 _$StorageResponseV2FromJson(Map<String, dynamic> json) {
  return _StorageResponseV2.fromJson(json);
}

/// @nodoc
mixin _$StorageResponseV2 {
  ProbeStatus get status => throw _privateConstructorUsedError;
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  List<Disk> get disks => throw _privateConstructorUsedError;
  bool? get needRoot => throw _privateConstructorUsedError;
  bool? get needBoot => throw _privateConstructorUsedError;
  int? get installMinimumSize => throw _privateConstructorUsedError;

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
      {ProbeStatus status,
      ErrorReportRef? errorReport,
      List<Disk> disks,
      bool? needRoot,
      bool? needBoot,
      int? installMinimumSize});

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
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? disks = freezed,
    Object? needRoot = freezed,
    Object? needBoot = freezed,
    Object? installMinimumSize = freezed,
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
              as List<Disk>,
      needRoot: needRoot == freezed
          ? _value.needRoot
          : needRoot // ignore: cast_nullable_to_non_nullable
              as bool?,
      needBoot: needBoot == freezed
          ? _value.needBoot
          : needBoot // ignore: cast_nullable_to_non_nullable
              as bool?,
      installMinimumSize: installMinimumSize == freezed
          ? _value.installMinimumSize
          : installMinimumSize // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_StorageResponseV2CopyWith<$Res>
    implements $StorageResponseV2CopyWith<$Res> {
  factory _$$_StorageResponseV2CopyWith(_$_StorageResponseV2 value,
          $Res Function(_$_StorageResponseV2) then) =
      __$$_StorageResponseV2CopyWithImpl<$Res>;
  @override
  $Res call(
      {ProbeStatus status,
      ErrorReportRef? errorReport,
      List<Disk> disks,
      bool? needRoot,
      bool? needBoot,
      int? installMinimumSize});

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport;
}

/// @nodoc
class __$$_StorageResponseV2CopyWithImpl<$Res>
    extends _$StorageResponseV2CopyWithImpl<$Res>
    implements _$$_StorageResponseV2CopyWith<$Res> {
  __$$_StorageResponseV2CopyWithImpl(
      _$_StorageResponseV2 _value, $Res Function(_$_StorageResponseV2) _then)
      : super(_value, (v) => _then(v as _$_StorageResponseV2));

  @override
  _$_StorageResponseV2 get _value => super._value as _$_StorageResponseV2;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? disks = freezed,
    Object? needRoot = freezed,
    Object? needBoot = freezed,
    Object? installMinimumSize = freezed,
  }) {
    return _then(_$_StorageResponseV2(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      disks: disks == freezed
          ? _value._disks
          : disks // ignore: cast_nullable_to_non_nullable
              as List<Disk>,
      needRoot: needRoot == freezed
          ? _value.needRoot
          : needRoot // ignore: cast_nullable_to_non_nullable
              as bool?,
      needBoot: needBoot == freezed
          ? _value.needBoot
          : needBoot // ignore: cast_nullable_to_non_nullable
              as bool?,
      installMinimumSize: installMinimumSize == freezed
          ? _value.installMinimumSize
          : installMinimumSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StorageResponseV2 implements _StorageResponseV2 {
  const _$_StorageResponseV2(
      {required this.status,
      this.errorReport,
      final List<Disk> disks = const [],
      this.needRoot,
      this.needBoot,
      this.installMinimumSize})
      : _disks = disks;

  factory _$_StorageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$$_StorageResponseV2FromJson(json);

  @override
  final ProbeStatus status;
  @override
  final ErrorReportRef? errorReport;
  final List<Disk> _disks;
  @override
  @JsonKey()
  List<Disk> get disks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disks);
  }

  @override
  final bool? needRoot;
  @override
  final bool? needBoot;
  @override
  final int? installMinimumSize;

  @override
  String toString() {
    return 'StorageResponseV2(status: $status, errorReport: $errorReport, disks: $disks, needRoot: $needRoot, needBoot: $needBoot, installMinimumSize: $installMinimumSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StorageResponseV2 &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorReport, errorReport) &&
            const DeepCollectionEquality().equals(other._disks, _disks) &&
            const DeepCollectionEquality().equals(other.needRoot, needRoot) &&
            const DeepCollectionEquality().equals(other.needBoot, needBoot) &&
            const DeepCollectionEquality()
                .equals(other.installMinimumSize, installMinimumSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorReport),
      const DeepCollectionEquality().hash(_disks),
      const DeepCollectionEquality().hash(needRoot),
      const DeepCollectionEquality().hash(needBoot),
      const DeepCollectionEquality().hash(installMinimumSize));

  @JsonKey(ignore: true)
  @override
  _$$_StorageResponseV2CopyWith<_$_StorageResponseV2> get copyWith =>
      __$$_StorageResponseV2CopyWithImpl<_$_StorageResponseV2>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StorageResponseV2ToJson(
      this,
    );
  }
}

abstract class _StorageResponseV2 implements StorageResponseV2 {
  const factory _StorageResponseV2(
      {required final ProbeStatus status,
      final ErrorReportRef? errorReport,
      final List<Disk> disks,
      final bool? needRoot,
      final bool? needBoot,
      final int? installMinimumSize}) = _$_StorageResponseV2;

  factory _StorageResponseV2.fromJson(Map<String, dynamic> json) =
      _$_StorageResponseV2.fromJson;

  @override
  ProbeStatus get status;
  @override
  ErrorReportRef? get errorReport;
  @override
  List<Disk> get disks;
  @override
  bool? get needRoot;
  @override
  bool? get needBoot;
  @override
  int? get installMinimumSize;
  @override
  @JsonKey(ignore: true)
  _$$_StorageResponseV2CopyWith<_$_StorageResponseV2> get copyWith =>
      throw _privateConstructorUsedError;
}

GuidedResizeValues _$GuidedResizeValuesFromJson(Map<String, dynamic> json) {
  return _GuidedResizeValues.fromJson(json);
}

/// @nodoc
mixin _$GuidedResizeValues {
  int get installMax => throw _privateConstructorUsedError;
  int get minimum => throw _privateConstructorUsedError;
  int get recommended => throw _privateConstructorUsedError;
  int get maximum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidedResizeValuesCopyWith<GuidedResizeValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidedResizeValuesCopyWith<$Res> {
  factory $GuidedResizeValuesCopyWith(
          GuidedResizeValues value, $Res Function(GuidedResizeValues) then) =
      _$GuidedResizeValuesCopyWithImpl<$Res>;
  $Res call({int installMax, int minimum, int recommended, int maximum});
}

/// @nodoc
class _$GuidedResizeValuesCopyWithImpl<$Res>
    implements $GuidedResizeValuesCopyWith<$Res> {
  _$GuidedResizeValuesCopyWithImpl(this._value, this._then);

  final GuidedResizeValues _value;
  // ignore: unused_field
  final $Res Function(GuidedResizeValues) _then;

  @override
  $Res call({
    Object? installMax = freezed,
    Object? minimum = freezed,
    Object? recommended = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_value.copyWith(
      installMax: installMax == freezed
          ? _value.installMax
          : installMax // ignore: cast_nullable_to_non_nullable
              as int,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      recommended: recommended == freezed
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GuidedResizeValuesCopyWith<$Res>
    implements $GuidedResizeValuesCopyWith<$Res> {
  factory _$$_GuidedResizeValuesCopyWith(_$_GuidedResizeValues value,
          $Res Function(_$_GuidedResizeValues) then) =
      __$$_GuidedResizeValuesCopyWithImpl<$Res>;
  @override
  $Res call({int installMax, int minimum, int recommended, int maximum});
}

/// @nodoc
class __$$_GuidedResizeValuesCopyWithImpl<$Res>
    extends _$GuidedResizeValuesCopyWithImpl<$Res>
    implements _$$_GuidedResizeValuesCopyWith<$Res> {
  __$$_GuidedResizeValuesCopyWithImpl(
      _$_GuidedResizeValues _value, $Res Function(_$_GuidedResizeValues) _then)
      : super(_value, (v) => _then(v as _$_GuidedResizeValues));

  @override
  _$_GuidedResizeValues get _value => super._value as _$_GuidedResizeValues;

  @override
  $Res call({
    Object? installMax = freezed,
    Object? minimum = freezed,
    Object? recommended = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_$_GuidedResizeValues(
      installMax: installMax == freezed
          ? _value.installMax
          : installMax // ignore: cast_nullable_to_non_nullable
              as int,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      recommended: recommended == freezed
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuidedResizeValues implements _GuidedResizeValues {
  const _$_GuidedResizeValues(
      {required this.installMax,
      required this.minimum,
      required this.recommended,
      required this.maximum});

  factory _$_GuidedResizeValues.fromJson(Map<String, dynamic> json) =>
      _$$_GuidedResizeValuesFromJson(json);

  @override
  final int installMax;
  @override
  final int minimum;
  @override
  final int recommended;
  @override
  final int maximum;

  @override
  String toString() {
    return 'GuidedResizeValues(installMax: $installMax, minimum: $minimum, recommended: $recommended, maximum: $maximum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuidedResizeValues &&
            const DeepCollectionEquality()
                .equals(other.installMax, installMax) &&
            const DeepCollectionEquality().equals(other.minimum, minimum) &&
            const DeepCollectionEquality()
                .equals(other.recommended, recommended) &&
            const DeepCollectionEquality().equals(other.maximum, maximum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(installMax),
      const DeepCollectionEquality().hash(minimum),
      const DeepCollectionEquality().hash(recommended),
      const DeepCollectionEquality().hash(maximum));

  @JsonKey(ignore: true)
  @override
  _$$_GuidedResizeValuesCopyWith<_$_GuidedResizeValues> get copyWith =>
      __$$_GuidedResizeValuesCopyWithImpl<_$_GuidedResizeValues>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuidedResizeValuesToJson(
      this,
    );
  }
}

abstract class _GuidedResizeValues implements GuidedResizeValues {
  const factory _GuidedResizeValues(
      {required final int installMax,
      required final int minimum,
      required final int recommended,
      required final int maximum}) = _$_GuidedResizeValues;

  factory _GuidedResizeValues.fromJson(Map<String, dynamic> json) =
      _$_GuidedResizeValues.fromJson;

  @override
  int get installMax;
  @override
  int get minimum;
  @override
  int get recommended;
  @override
  int get maximum;
  @override
  @JsonKey(ignore: true)
  _$$_GuidedResizeValuesCopyWith<_$_GuidedResizeValues> get copyWith =>
      throw _privateConstructorUsedError;
}

GuidedStorageTarget _$GuidedStorageTargetFromJson(Map<String, dynamic> json) {
  switch (json['\$type']) {
    case 'GuidedStorageTargetReformat':
      return GuidedStorageTargetReformat.fromJson(json);
    case 'GuidedStorageTargetResize':
      return GuidedStorageTargetResize.fromJson(json);
    case 'GuidedStorageTargetUseGap':
      return GuidedStorageTargetUseGap.fromJson(json);

    default:
      throw CheckedFromJsonException(json, '\$type', 'GuidedStorageTarget',
          'Invalid union type "${json['\$type']}"!');
  }
}

/// @nodoc
mixin _$GuidedStorageTarget {
  String get diskId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String diskId) reformat,
    required TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)
        resize,
    required TResult Function(String diskId, Gap gap) useGap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GuidedStorageTargetReformat value) reformat,
    required TResult Function(GuidedStorageTargetResize value) resize,
    required TResult Function(GuidedStorageTargetUseGap value) useGap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidedStorageTargetCopyWith<GuidedStorageTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidedStorageTargetCopyWith<$Res> {
  factory $GuidedStorageTargetCopyWith(
          GuidedStorageTarget value, $Res Function(GuidedStorageTarget) then) =
      _$GuidedStorageTargetCopyWithImpl<$Res>;
  $Res call({String diskId});
}

/// @nodoc
class _$GuidedStorageTargetCopyWithImpl<$Res>
    implements $GuidedStorageTargetCopyWith<$Res> {
  _$GuidedStorageTargetCopyWithImpl(this._value, this._then);

  final GuidedStorageTarget _value;
  // ignore: unused_field
  final $Res Function(GuidedStorageTarget) _then;

  @override
  $Res call({
    Object? diskId = freezed,
  }) {
    return _then(_value.copyWith(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$GuidedStorageTargetReformatCopyWith<$Res>
    implements $GuidedStorageTargetCopyWith<$Res> {
  factory _$$GuidedStorageTargetReformatCopyWith(
          _$GuidedStorageTargetReformat value,
          $Res Function(_$GuidedStorageTargetReformat) then) =
      __$$GuidedStorageTargetReformatCopyWithImpl<$Res>;
  @override
  $Res call({String diskId});
}

/// @nodoc
class __$$GuidedStorageTargetReformatCopyWithImpl<$Res>
    extends _$GuidedStorageTargetCopyWithImpl<$Res>
    implements _$$GuidedStorageTargetReformatCopyWith<$Res> {
  __$$GuidedStorageTargetReformatCopyWithImpl(
      _$GuidedStorageTargetReformat _value,
      $Res Function(_$GuidedStorageTargetReformat) _then)
      : super(_value, (v) => _then(v as _$GuidedStorageTargetReformat));

  @override
  _$GuidedStorageTargetReformat get _value =>
      super._value as _$GuidedStorageTargetReformat;

  @override
  $Res call({
    Object? diskId = freezed,
  }) {
    return _then(_$GuidedStorageTargetReformat(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuidedStorageTargetReformat implements GuidedStorageTargetReformat {
  const _$GuidedStorageTargetReformat(
      {required this.diskId, final String? $type})
      : $type = $type ?? 'GuidedStorageTargetReformat';

  factory _$GuidedStorageTargetReformat.fromJson(Map<String, dynamic> json) =>
      _$$GuidedStorageTargetReformatFromJson(json);

  @override
  final String diskId;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'GuidedStorageTarget.reformat(diskId: $diskId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuidedStorageTargetReformat &&
            const DeepCollectionEquality().equals(other.diskId, diskId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(diskId));

  @JsonKey(ignore: true)
  @override
  _$$GuidedStorageTargetReformatCopyWith<_$GuidedStorageTargetReformat>
      get copyWith => __$$GuidedStorageTargetReformatCopyWithImpl<
          _$GuidedStorageTargetReformat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String diskId) reformat,
    required TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)
        resize,
    required TResult Function(String diskId, Gap gap) useGap,
  }) {
    return reformat(diskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
  }) {
    return reformat?.call(diskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
    required TResult orElse(),
  }) {
    if (reformat != null) {
      return reformat(diskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GuidedStorageTargetReformat value) reformat,
    required TResult Function(GuidedStorageTargetResize value) resize,
    required TResult Function(GuidedStorageTargetUseGap value) useGap,
  }) {
    return reformat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
  }) {
    return reformat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
    required TResult orElse(),
  }) {
    if (reformat != null) {
      return reformat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GuidedStorageTargetReformatToJson(
      this,
    );
  }
}

abstract class GuidedStorageTargetReformat implements GuidedStorageTarget {
  const factory GuidedStorageTargetReformat({required final String diskId}) =
      _$GuidedStorageTargetReformat;

  factory GuidedStorageTargetReformat.fromJson(Map<String, dynamic> json) =
      _$GuidedStorageTargetReformat.fromJson;

  @override
  String get diskId;
  @override
  @JsonKey(ignore: true)
  _$$GuidedStorageTargetReformatCopyWith<_$GuidedStorageTargetReformat>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GuidedStorageTargetResizeCopyWith<$Res>
    implements $GuidedStorageTargetCopyWith<$Res> {
  factory _$$GuidedStorageTargetResizeCopyWith(
          _$GuidedStorageTargetResize value,
          $Res Function(_$GuidedStorageTargetResize) then) =
      __$$GuidedStorageTargetResizeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String diskId,
      int partitionNumber,
      int newSize,
      int? minimum,
      int? recommended,
      int? maximum});
}

/// @nodoc
class __$$GuidedStorageTargetResizeCopyWithImpl<$Res>
    extends _$GuidedStorageTargetCopyWithImpl<$Res>
    implements _$$GuidedStorageTargetResizeCopyWith<$Res> {
  __$$GuidedStorageTargetResizeCopyWithImpl(_$GuidedStorageTargetResize _value,
      $Res Function(_$GuidedStorageTargetResize) _then)
      : super(_value, (v) => _then(v as _$GuidedStorageTargetResize));

  @override
  _$GuidedStorageTargetResize get _value =>
      super._value as _$GuidedStorageTargetResize;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partitionNumber = freezed,
    Object? newSize = freezed,
    Object? minimum = freezed,
    Object? recommended = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_$GuidedStorageTargetResize(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      partitionNumber: partitionNumber == freezed
          ? _value.partitionNumber
          : partitionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      newSize: newSize == freezed
          ? _value.newSize
          : newSize // ignore: cast_nullable_to_non_nullable
              as int,
      minimum: minimum == freezed
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int?,
      recommended: recommended == freezed
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum: maximum == freezed
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuidedStorageTargetResize implements GuidedStorageTargetResize {
  const _$GuidedStorageTargetResize(
      {required this.diskId,
      required this.partitionNumber,
      required this.newSize,
      required this.minimum,
      required this.recommended,
      required this.maximum,
      final String? $type})
      : $type = $type ?? 'GuidedStorageTargetResize';

  factory _$GuidedStorageTargetResize.fromJson(Map<String, dynamic> json) =>
      _$$GuidedStorageTargetResizeFromJson(json);

  @override
  final String diskId;
  @override
  final int partitionNumber;
  @override
  final int newSize;
  @override
  final int? minimum;
  @override
  final int? recommended;
  @override
  final int? maximum;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'GuidedStorageTarget.resize(diskId: $diskId, partitionNumber: $partitionNumber, newSize: $newSize, minimum: $minimum, recommended: $recommended, maximum: $maximum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuidedStorageTargetResize &&
            const DeepCollectionEquality().equals(other.diskId, diskId) &&
            const DeepCollectionEquality()
                .equals(other.partitionNumber, partitionNumber) &&
            const DeepCollectionEquality().equals(other.newSize, newSize) &&
            const DeepCollectionEquality().equals(other.minimum, minimum) &&
            const DeepCollectionEquality()
                .equals(other.recommended, recommended) &&
            const DeepCollectionEquality().equals(other.maximum, maximum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diskId),
      const DeepCollectionEquality().hash(partitionNumber),
      const DeepCollectionEquality().hash(newSize),
      const DeepCollectionEquality().hash(minimum),
      const DeepCollectionEquality().hash(recommended),
      const DeepCollectionEquality().hash(maximum));

  @JsonKey(ignore: true)
  @override
  _$$GuidedStorageTargetResizeCopyWith<_$GuidedStorageTargetResize>
      get copyWith => __$$GuidedStorageTargetResizeCopyWithImpl<
          _$GuidedStorageTargetResize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String diskId) reformat,
    required TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)
        resize,
    required TResult Function(String diskId, Gap gap) useGap,
  }) {
    return resize(
        diskId, partitionNumber, newSize, minimum, recommended, maximum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
  }) {
    return resize?.call(
        diskId, partitionNumber, newSize, minimum, recommended, maximum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
    required TResult orElse(),
  }) {
    if (resize != null) {
      return resize(
          diskId, partitionNumber, newSize, minimum, recommended, maximum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GuidedStorageTargetReformat value) reformat,
    required TResult Function(GuidedStorageTargetResize value) resize,
    required TResult Function(GuidedStorageTargetUseGap value) useGap,
  }) {
    return resize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
  }) {
    return resize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
    required TResult orElse(),
  }) {
    if (resize != null) {
      return resize(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GuidedStorageTargetResizeToJson(
      this,
    );
  }
}

abstract class GuidedStorageTargetResize implements GuidedStorageTarget {
  const factory GuidedStorageTargetResize(
      {required final String diskId,
      required final int partitionNumber,
      required final int newSize,
      required final int? minimum,
      required final int? recommended,
      required final int? maximum}) = _$GuidedStorageTargetResize;

  factory GuidedStorageTargetResize.fromJson(Map<String, dynamic> json) =
      _$GuidedStorageTargetResize.fromJson;

  @override
  String get diskId;
  int get partitionNumber;
  int get newSize;
  int? get minimum;
  int? get recommended;
  int? get maximum;
  @override
  @JsonKey(ignore: true)
  _$$GuidedStorageTargetResizeCopyWith<_$GuidedStorageTargetResize>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GuidedStorageTargetUseGapCopyWith<$Res>
    implements $GuidedStorageTargetCopyWith<$Res> {
  factory _$$GuidedStorageTargetUseGapCopyWith(
          _$GuidedStorageTargetUseGap value,
          $Res Function(_$GuidedStorageTargetUseGap) then) =
      __$$GuidedStorageTargetUseGapCopyWithImpl<$Res>;
  @override
  $Res call({String diskId, Gap gap});
}

/// @nodoc
class __$$GuidedStorageTargetUseGapCopyWithImpl<$Res>
    extends _$GuidedStorageTargetCopyWithImpl<$Res>
    implements _$$GuidedStorageTargetUseGapCopyWith<$Res> {
  __$$GuidedStorageTargetUseGapCopyWithImpl(_$GuidedStorageTargetUseGap _value,
      $Res Function(_$GuidedStorageTargetUseGap) _then)
      : super(_value, (v) => _then(v as _$GuidedStorageTargetUseGap));

  @override
  _$GuidedStorageTargetUseGap get _value =>
      super._value as _$GuidedStorageTargetUseGap;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? gap = freezed,
  }) {
    return _then(_$GuidedStorageTargetUseGap(
      diskId: diskId == freezed
          ? _value.diskId
          : diskId // ignore: cast_nullable_to_non_nullable
              as String,
      gap: gap == freezed
          ? _value.gap
          : gap // ignore: cast_nullable_to_non_nullable
              as Gap,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuidedStorageTargetUseGap implements GuidedStorageTargetUseGap {
  const _$GuidedStorageTargetUseGap(
      {required this.diskId, required this.gap, final String? $type})
      : $type = $type ?? 'GuidedStorageTargetUseGap';

  factory _$GuidedStorageTargetUseGap.fromJson(Map<String, dynamic> json) =>
      _$$GuidedStorageTargetUseGapFromJson(json);

  @override
  final String diskId;
  @override
  final Gap gap;

  @JsonKey(name: '\$type')
  final String $type;

  @override
  String toString() {
    return 'GuidedStorageTarget.useGap(diskId: $diskId, gap: $gap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuidedStorageTargetUseGap &&
            const DeepCollectionEquality().equals(other.diskId, diskId) &&
            const DeepCollectionEquality().equals(other.gap, gap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diskId),
      const DeepCollectionEquality().hash(gap));

  @JsonKey(ignore: true)
  @override
  _$$GuidedStorageTargetUseGapCopyWith<_$GuidedStorageTargetUseGap>
      get copyWith => __$$GuidedStorageTargetUseGapCopyWithImpl<
          _$GuidedStorageTargetUseGap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String diskId) reformat,
    required TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)
        resize,
    required TResult Function(String diskId, Gap gap) useGap,
  }) {
    return useGap(diskId, gap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
  }) {
    return useGap?.call(diskId, gap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String diskId)? reformat,
    TResult Function(String diskId, int partitionNumber, int newSize,
            int? minimum, int? recommended, int? maximum)?
        resize,
    TResult Function(String diskId, Gap gap)? useGap,
    required TResult orElse(),
  }) {
    if (useGap != null) {
      return useGap(diskId, gap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GuidedStorageTargetReformat value) reformat,
    required TResult Function(GuidedStorageTargetResize value) resize,
    required TResult Function(GuidedStorageTargetUseGap value) useGap,
  }) {
    return useGap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
  }) {
    return useGap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GuidedStorageTargetReformat value)? reformat,
    TResult Function(GuidedStorageTargetResize value)? resize,
    TResult Function(GuidedStorageTargetUseGap value)? useGap,
    required TResult orElse(),
  }) {
    if (useGap != null) {
      return useGap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GuidedStorageTargetUseGapToJson(
      this,
    );
  }
}

abstract class GuidedStorageTargetUseGap implements GuidedStorageTarget {
  const factory GuidedStorageTargetUseGap(
      {required final String diskId,
      required final Gap gap}) = _$GuidedStorageTargetUseGap;

  factory GuidedStorageTargetUseGap.fromJson(Map<String, dynamic> json) =
      _$GuidedStorageTargetUseGap.fromJson;

  @override
  String get diskId;
  Gap get gap;
  @override
  @JsonKey(ignore: true)
  _$$GuidedStorageTargetUseGapCopyWith<_$GuidedStorageTargetUseGap>
      get copyWith => throw _privateConstructorUsedError;
}

GuidedChoiceV2 _$GuidedChoiceV2FromJson(Map<String, dynamic> json) {
  return _GuidedChoiceV2.fromJson(json);
}

/// @nodoc
mixin _$GuidedChoiceV2 {
  GuidedStorageTarget get target => throw _privateConstructorUsedError;
  bool get useLvm => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidedChoiceV2CopyWith<GuidedChoiceV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidedChoiceV2CopyWith<$Res> {
  factory $GuidedChoiceV2CopyWith(
          GuidedChoiceV2 value, $Res Function(GuidedChoiceV2) then) =
      _$GuidedChoiceV2CopyWithImpl<$Res>;
  $Res call({GuidedStorageTarget target, bool useLvm, String? password});

  $GuidedStorageTargetCopyWith<$Res> get target;
}

/// @nodoc
class _$GuidedChoiceV2CopyWithImpl<$Res>
    implements $GuidedChoiceV2CopyWith<$Res> {
  _$GuidedChoiceV2CopyWithImpl(this._value, this._then);

  final GuidedChoiceV2 _value;
  // ignore: unused_field
  final $Res Function(GuidedChoiceV2) _then;

  @override
  $Res call({
    Object? target = freezed,
    Object? useLvm = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as GuidedStorageTarget,
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

  @override
  $GuidedStorageTargetCopyWith<$Res> get target {
    return $GuidedStorageTargetCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value));
    });
  }
}

/// @nodoc
abstract class _$$_GuidedChoiceV2CopyWith<$Res>
    implements $GuidedChoiceV2CopyWith<$Res> {
  factory _$$_GuidedChoiceV2CopyWith(
          _$_GuidedChoiceV2 value, $Res Function(_$_GuidedChoiceV2) then) =
      __$$_GuidedChoiceV2CopyWithImpl<$Res>;
  @override
  $Res call({GuidedStorageTarget target, bool useLvm, String? password});

  @override
  $GuidedStorageTargetCopyWith<$Res> get target;
}

/// @nodoc
class __$$_GuidedChoiceV2CopyWithImpl<$Res>
    extends _$GuidedChoiceV2CopyWithImpl<$Res>
    implements _$$_GuidedChoiceV2CopyWith<$Res> {
  __$$_GuidedChoiceV2CopyWithImpl(
      _$_GuidedChoiceV2 _value, $Res Function(_$_GuidedChoiceV2) _then)
      : super(_value, (v) => _then(v as _$_GuidedChoiceV2));

  @override
  _$_GuidedChoiceV2 get _value => super._value as _$_GuidedChoiceV2;

  @override
  $Res call({
    Object? target = freezed,
    Object? useLvm = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_GuidedChoiceV2(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as GuidedStorageTarget,
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
class _$_GuidedChoiceV2 implements _GuidedChoiceV2 {
  const _$_GuidedChoiceV2(
      {required this.target, this.useLvm = false, this.password});

  factory _$_GuidedChoiceV2.fromJson(Map<String, dynamic> json) =>
      _$$_GuidedChoiceV2FromJson(json);

  @override
  final GuidedStorageTarget target;
  @override
  @JsonKey()
  final bool useLvm;
  @override
  final String? password;

  @override
  String toString() {
    return 'GuidedChoiceV2(target: $target, useLvm: $useLvm, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuidedChoiceV2 &&
            const DeepCollectionEquality().equals(other.target, target) &&
            const DeepCollectionEquality().equals(other.useLvm, useLvm) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(target),
      const DeepCollectionEquality().hash(useLvm),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_GuidedChoiceV2CopyWith<_$_GuidedChoiceV2> get copyWith =>
      __$$_GuidedChoiceV2CopyWithImpl<_$_GuidedChoiceV2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuidedChoiceV2ToJson(
      this,
    );
  }
}

abstract class _GuidedChoiceV2 implements GuidedChoiceV2 {
  const factory _GuidedChoiceV2(
      {required final GuidedStorageTarget target,
      final bool useLvm,
      final String? password}) = _$_GuidedChoiceV2;

  factory _GuidedChoiceV2.fromJson(Map<String, dynamic> json) =
      _$_GuidedChoiceV2.fromJson;

  @override
  GuidedStorageTarget get target;
  @override
  bool get useLvm;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_GuidedChoiceV2CopyWith<_$_GuidedChoiceV2> get copyWith =>
      throw _privateConstructorUsedError;
}

GuidedStorageResponseV2 _$GuidedStorageResponseV2FromJson(
    Map<String, dynamic> json) {
  return _GuidedStorageResponseV2.fromJson(json);
}

/// @nodoc
mixin _$GuidedStorageResponseV2 {
  ProbeStatus get status => throw _privateConstructorUsedError;
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  GuidedChoiceV2? get configured => throw _privateConstructorUsedError;
  List<GuidedStorageTarget> get possible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidedStorageResponseV2CopyWith<GuidedStorageResponseV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidedStorageResponseV2CopyWith<$Res> {
  factory $GuidedStorageResponseV2CopyWith(GuidedStorageResponseV2 value,
          $Res Function(GuidedStorageResponseV2) then) =
      _$GuidedStorageResponseV2CopyWithImpl<$Res>;
  $Res call(
      {ProbeStatus status,
      ErrorReportRef? errorReport,
      GuidedChoiceV2? configured,
      List<GuidedStorageTarget> possible});

  $ErrorReportRefCopyWith<$Res>? get errorReport;
  $GuidedChoiceV2CopyWith<$Res>? get configured;
}

/// @nodoc
class _$GuidedStorageResponseV2CopyWithImpl<$Res>
    implements $GuidedStorageResponseV2CopyWith<$Res> {
  _$GuidedStorageResponseV2CopyWithImpl(this._value, this._then);

  final GuidedStorageResponseV2 _value;
  // ignore: unused_field
  final $Res Function(GuidedStorageResponseV2) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? configured = freezed,
    Object? possible = freezed,
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
      configured: configured == freezed
          ? _value.configured
          : configured // ignore: cast_nullable_to_non_nullable
              as GuidedChoiceV2?,
      possible: possible == freezed
          ? _value.possible
          : possible // ignore: cast_nullable_to_non_nullable
              as List<GuidedStorageTarget>,
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

  @override
  $GuidedChoiceV2CopyWith<$Res>? get configured {
    if (_value.configured == null) {
      return null;
    }

    return $GuidedChoiceV2CopyWith<$Res>(_value.configured!, (value) {
      return _then(_value.copyWith(configured: value));
    });
  }
}

/// @nodoc
abstract class _$$_GuidedStorageResponseV2CopyWith<$Res>
    implements $GuidedStorageResponseV2CopyWith<$Res> {
  factory _$$_GuidedStorageResponseV2CopyWith(_$_GuidedStorageResponseV2 value,
          $Res Function(_$_GuidedStorageResponseV2) then) =
      __$$_GuidedStorageResponseV2CopyWithImpl<$Res>;
  @override
  $Res call(
      {ProbeStatus status,
      ErrorReportRef? errorReport,
      GuidedChoiceV2? configured,
      List<GuidedStorageTarget> possible});

  @override
  $ErrorReportRefCopyWith<$Res>? get errorReport;
  @override
  $GuidedChoiceV2CopyWith<$Res>? get configured;
}

/// @nodoc
class __$$_GuidedStorageResponseV2CopyWithImpl<$Res>
    extends _$GuidedStorageResponseV2CopyWithImpl<$Res>
    implements _$$_GuidedStorageResponseV2CopyWith<$Res> {
  __$$_GuidedStorageResponseV2CopyWithImpl(_$_GuidedStorageResponseV2 _value,
      $Res Function(_$_GuidedStorageResponseV2) _then)
      : super(_value, (v) => _then(v as _$_GuidedStorageResponseV2));

  @override
  _$_GuidedStorageResponseV2 get _value =>
      super._value as _$_GuidedStorageResponseV2;

  @override
  $Res call({
    Object? status = freezed,
    Object? errorReport = freezed,
    Object? configured = freezed,
    Object? possible = freezed,
  }) {
    return _then(_$_GuidedStorageResponseV2(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus,
      errorReport: errorReport == freezed
          ? _value.errorReport
          : errorReport // ignore: cast_nullable_to_non_nullable
              as ErrorReportRef?,
      configured: configured == freezed
          ? _value.configured
          : configured // ignore: cast_nullable_to_non_nullable
              as GuidedChoiceV2?,
      possible: possible == freezed
          ? _value._possible
          : possible // ignore: cast_nullable_to_non_nullable
              as List<GuidedStorageTarget>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuidedStorageResponseV2 implements _GuidedStorageResponseV2 {
  const _$_GuidedStorageResponseV2(
      {required this.status,
      this.errorReport,
      this.configured,
      final List<GuidedStorageTarget> possible = const []})
      : _possible = possible;

  factory _$_GuidedStorageResponseV2.fromJson(Map<String, dynamic> json) =>
      _$$_GuidedStorageResponseV2FromJson(json);

  @override
  final ProbeStatus status;
  @override
  final ErrorReportRef? errorReport;
  @override
  final GuidedChoiceV2? configured;
  final List<GuidedStorageTarget> _possible;
  @override
  @JsonKey()
  List<GuidedStorageTarget> get possible {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possible);
  }

  @override
  String toString() {
    return 'GuidedStorageResponseV2(status: $status, errorReport: $errorReport, configured: $configured, possible: $possible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuidedStorageResponseV2 &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorReport, errorReport) &&
            const DeepCollectionEquality()
                .equals(other.configured, configured) &&
            const DeepCollectionEquality().equals(other._possible, _possible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorReport),
      const DeepCollectionEquality().hash(configured),
      const DeepCollectionEquality().hash(_possible));

  @JsonKey(ignore: true)
  @override
  _$$_GuidedStorageResponseV2CopyWith<_$_GuidedStorageResponseV2>
      get copyWith =>
          __$$_GuidedStorageResponseV2CopyWithImpl<_$_GuidedStorageResponseV2>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuidedStorageResponseV2ToJson(
      this,
    );
  }
}

abstract class _GuidedStorageResponseV2 implements GuidedStorageResponseV2 {
  const factory _GuidedStorageResponseV2(
      {required final ProbeStatus status,
      final ErrorReportRef? errorReport,
      final GuidedChoiceV2? configured,
      final List<GuidedStorageTarget> possible}) = _$_GuidedStorageResponseV2;

  factory _GuidedStorageResponseV2.fromJson(Map<String, dynamic> json) =
      _$_GuidedStorageResponseV2.fromJson;

  @override
  ProbeStatus get status;
  @override
  ErrorReportRef? get errorReport;
  @override
  GuidedChoiceV2? get configured;
  @override
  List<GuidedStorageTarget> get possible;
  @override
  @JsonKey(ignore: true)
  _$$_GuidedStorageResponseV2CopyWith<_$_GuidedStorageResponseV2>
      get copyWith => throw _privateConstructorUsedError;
}

AddPartitionV2 _$AddPartitionV2FromJson(Map<String, dynamic> json) {
  return _AddPartitionV2.fromJson(json);
}

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
abstract class _$$_AddPartitionV2CopyWith<$Res>
    implements $AddPartitionV2CopyWith<$Res> {
  factory _$$_AddPartitionV2CopyWith(
          _$_AddPartitionV2 value, $Res Function(_$_AddPartitionV2) then) =
      __$$_AddPartitionV2CopyWithImpl<$Res>;
  @override
  $Res call({String diskId, Partition partition, Gap gap});
}

/// @nodoc
class __$$_AddPartitionV2CopyWithImpl<$Res>
    extends _$AddPartitionV2CopyWithImpl<$Res>
    implements _$$_AddPartitionV2CopyWith<$Res> {
  __$$_AddPartitionV2CopyWithImpl(
      _$_AddPartitionV2 _value, $Res Function(_$_AddPartitionV2) _then)
      : super(_value, (v) => _then(v as _$_AddPartitionV2));

  @override
  _$_AddPartitionV2 get _value => super._value as _$_AddPartitionV2;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partition = freezed,
    Object? gap = freezed,
  }) {
    return _then(_$_AddPartitionV2(
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
      _$$_AddPartitionV2FromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_AddPartitionV2 &&
            const DeepCollectionEquality().equals(other.diskId, diskId) &&
            const DeepCollectionEquality().equals(other.partition, partition) &&
            const DeepCollectionEquality().equals(other.gap, gap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diskId),
      const DeepCollectionEquality().hash(partition),
      const DeepCollectionEquality().hash(gap));

  @JsonKey(ignore: true)
  @override
  _$$_AddPartitionV2CopyWith<_$_AddPartitionV2> get copyWith =>
      __$$_AddPartitionV2CopyWithImpl<_$_AddPartitionV2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddPartitionV2ToJson(
      this,
    );
  }
}

abstract class _AddPartitionV2 implements AddPartitionV2 {
  const factory _AddPartitionV2(
      {required final String diskId,
      required final Partition partition,
      required final Gap gap}) = _$_AddPartitionV2;

  factory _AddPartitionV2.fromJson(Map<String, dynamic> json) =
      _$_AddPartitionV2.fromJson;

  @override
  String get diskId;
  @override
  Partition get partition;
  @override
  Gap get gap;
  @override
  @JsonKey(ignore: true)
  _$$_AddPartitionV2CopyWith<_$_AddPartitionV2> get copyWith =>
      throw _privateConstructorUsedError;
}

ModifyPartitionV2 _$ModifyPartitionV2FromJson(Map<String, dynamic> json) {
  return _ModifyPartitionV2.fromJson(json);
}

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
abstract class _$$_ModifyPartitionV2CopyWith<$Res>
    implements $ModifyPartitionV2CopyWith<$Res> {
  factory _$$_ModifyPartitionV2CopyWith(_$_ModifyPartitionV2 value,
          $Res Function(_$_ModifyPartitionV2) then) =
      __$$_ModifyPartitionV2CopyWithImpl<$Res>;
  @override
  $Res call({String diskId, Partition partition});
}

/// @nodoc
class __$$_ModifyPartitionV2CopyWithImpl<$Res>
    extends _$ModifyPartitionV2CopyWithImpl<$Res>
    implements _$$_ModifyPartitionV2CopyWith<$Res> {
  __$$_ModifyPartitionV2CopyWithImpl(
      _$_ModifyPartitionV2 _value, $Res Function(_$_ModifyPartitionV2) _then)
      : super(_value, (v) => _then(v as _$_ModifyPartitionV2));

  @override
  _$_ModifyPartitionV2 get _value => super._value as _$_ModifyPartitionV2;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? partition = freezed,
  }) {
    return _then(_$_ModifyPartitionV2(
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
      _$$_ModifyPartitionV2FromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ModifyPartitionV2 &&
            const DeepCollectionEquality().equals(other.diskId, diskId) &&
            const DeepCollectionEquality().equals(other.partition, partition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diskId),
      const DeepCollectionEquality().hash(partition));

  @JsonKey(ignore: true)
  @override
  _$$_ModifyPartitionV2CopyWith<_$_ModifyPartitionV2> get copyWith =>
      __$$_ModifyPartitionV2CopyWithImpl<_$_ModifyPartitionV2>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModifyPartitionV2ToJson(
      this,
    );
  }
}

abstract class _ModifyPartitionV2 implements ModifyPartitionV2 {
  const factory _ModifyPartitionV2(
      {required final String diskId,
      required final Partition partition}) = _$_ModifyPartitionV2;

  factory _ModifyPartitionV2.fromJson(Map<String, dynamic> json) =
      _$_ModifyPartitionV2.fromJson;

  @override
  String get diskId;
  @override
  Partition get partition;
  @override
  @JsonKey(ignore: true)
  _$$_ModifyPartitionV2CopyWith<_$_ModifyPartitionV2> get copyWith =>
      throw _privateConstructorUsedError;
}

ReformatDisk _$ReformatDiskFromJson(Map<String, dynamic> json) {
  return _ReformatDisk.fromJson(json);
}

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
abstract class _$$_ReformatDiskCopyWith<$Res>
    implements $ReformatDiskCopyWith<$Res> {
  factory _$$_ReformatDiskCopyWith(
          _$_ReformatDisk value, $Res Function(_$_ReformatDisk) then) =
      __$$_ReformatDiskCopyWithImpl<$Res>;
  @override
  $Res call({String diskId, String? ptable});
}

/// @nodoc
class __$$_ReformatDiskCopyWithImpl<$Res>
    extends _$ReformatDiskCopyWithImpl<$Res>
    implements _$$_ReformatDiskCopyWith<$Res> {
  __$$_ReformatDiskCopyWithImpl(
      _$_ReformatDisk _value, $Res Function(_$_ReformatDisk) _then)
      : super(_value, (v) => _then(v as _$_ReformatDisk));

  @override
  _$_ReformatDisk get _value => super._value as _$_ReformatDisk;

  @override
  $Res call({
    Object? diskId = freezed,
    Object? ptable = freezed,
  }) {
    return _then(_$_ReformatDisk(
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
      _$$_ReformatDiskFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ReformatDisk &&
            const DeepCollectionEquality().equals(other.diskId, diskId) &&
            const DeepCollectionEquality().equals(other.ptable, ptable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diskId),
      const DeepCollectionEquality().hash(ptable));

  @JsonKey(ignore: true)
  @override
  _$$_ReformatDiskCopyWith<_$_ReformatDisk> get copyWith =>
      __$$_ReformatDiskCopyWithImpl<_$_ReformatDisk>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReformatDiskToJson(
      this,
    );
  }
}

abstract class _ReformatDisk implements ReformatDisk {
  const factory _ReformatDisk(
      {required final String diskId, final String? ptable}) = _$_ReformatDisk;

  factory _ReformatDisk.fromJson(Map<String, dynamic> json) =
      _$_ReformatDisk.fromJson;

  @override
  String get diskId;
  @override
  String? get ptable;
  @override
  @JsonKey(ignore: true)
  _$$_ReformatDiskCopyWith<_$_ReformatDisk> get copyWith =>
      throw _privateConstructorUsedError;
}

IdentityData _$IdentityDataFromJson(Map<String, dynamic> json) {
  return _IdentityData.fromJson(json);
}

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
abstract class _$$_IdentityDataCopyWith<$Res>
    implements $IdentityDataCopyWith<$Res> {
  factory _$$_IdentityDataCopyWith(
          _$_IdentityData value, $Res Function(_$_IdentityData) then) =
      __$$_IdentityDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String realname,
      String username,
      String cryptedPassword,
      String hostname});
}

/// @nodoc
class __$$_IdentityDataCopyWithImpl<$Res>
    extends _$IdentityDataCopyWithImpl<$Res>
    implements _$$_IdentityDataCopyWith<$Res> {
  __$$_IdentityDataCopyWithImpl(
      _$_IdentityData _value, $Res Function(_$_IdentityData) _then)
      : super(_value, (v) => _then(v as _$_IdentityData));

  @override
  _$_IdentityData get _value => super._value as _$_IdentityData;

  @override
  $Res call({
    Object? realname = freezed,
    Object? username = freezed,
    Object? cryptedPassword = freezed,
    Object? hostname = freezed,
  }) {
    return _then(_$_IdentityData(
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
      _$$_IdentityDataFromJson(json);

  @override
  @JsonKey()
  final String realname;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String cryptedPassword;
  @override
  @JsonKey()
  final String hostname;

  @override
  String toString() {
    return 'IdentityData(realname: $realname, username: $username, cryptedPassword: $cryptedPassword, hostname: $hostname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdentityData &&
            const DeepCollectionEquality().equals(other.realname, realname) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.cryptedPassword, cryptedPassword) &&
            const DeepCollectionEquality().equals(other.hostname, hostname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(realname),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(cryptedPassword),
      const DeepCollectionEquality().hash(hostname));

  @JsonKey(ignore: true)
  @override
  _$$_IdentityDataCopyWith<_$_IdentityData> get copyWith =>
      __$$_IdentityDataCopyWithImpl<_$_IdentityData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdentityDataToJson(
      this,
    );
  }
}

abstract class _IdentityData implements IdentityData {
  const factory _IdentityData(
      {final String realname,
      final String username,
      final String cryptedPassword,
      final String hostname}) = _$_IdentityData;

  factory _IdentityData.fromJson(Map<String, dynamic> json) =
      _$_IdentityData.fromJson;

  @override
  String get realname;
  @override
  String get username;
  @override
  String get cryptedPassword;
  @override
  String get hostname;
  @override
  @JsonKey(ignore: true)
  _$$_IdentityDataCopyWith<_$_IdentityData> get copyWith =>
      throw _privateConstructorUsedError;
}

SSHData _$SSHDataFromJson(Map<String, dynamic> json) {
  return _SSHData.fromJson(json);
}

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
abstract class _$$_SSHDataCopyWith<$Res> implements $SSHDataCopyWith<$Res> {
  factory _$$_SSHDataCopyWith(
          _$_SSHData value, $Res Function(_$_SSHData) then) =
      __$$_SSHDataCopyWithImpl<$Res>;
  @override
  $Res call({bool installServer, bool allowPw, List<String> authorizedKeys});
}

/// @nodoc
class __$$_SSHDataCopyWithImpl<$Res> extends _$SSHDataCopyWithImpl<$Res>
    implements _$$_SSHDataCopyWith<$Res> {
  __$$_SSHDataCopyWithImpl(_$_SSHData _value, $Res Function(_$_SSHData) _then)
      : super(_value, (v) => _then(v as _$_SSHData));

  @override
  _$_SSHData get _value => super._value as _$_SSHData;

  @override
  $Res call({
    Object? installServer = freezed,
    Object? allowPw = freezed,
    Object? authorizedKeys = freezed,
  }) {
    return _then(_$_SSHData(
      installServer: installServer == freezed
          ? _value.installServer
          : installServer // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPw: allowPw == freezed
          ? _value.allowPw
          : allowPw // ignore: cast_nullable_to_non_nullable
              as bool,
      authorizedKeys: authorizedKeys == freezed
          ? _value._authorizedKeys
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
      final List<String> authorizedKeys = const []})
      : _authorizedKeys = authorizedKeys;

  factory _$_SSHData.fromJson(Map<String, dynamic> json) =>
      _$$_SSHDataFromJson(json);

  @override
  final bool installServer;
  @override
  final bool allowPw;
  final List<String> _authorizedKeys;
  @override
  @JsonKey()
  List<String> get authorizedKeys {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorizedKeys);
  }

  @override
  String toString() {
    return 'SSHData(installServer: $installServer, allowPw: $allowPw, authorizedKeys: $authorizedKeys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SSHData &&
            const DeepCollectionEquality()
                .equals(other.installServer, installServer) &&
            const DeepCollectionEquality().equals(other.allowPw, allowPw) &&
            const DeepCollectionEquality()
                .equals(other._authorizedKeys, _authorizedKeys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(installServer),
      const DeepCollectionEquality().hash(allowPw),
      const DeepCollectionEquality().hash(_authorizedKeys));

  @JsonKey(ignore: true)
  @override
  _$$_SSHDataCopyWith<_$_SSHData> get copyWith =>
      __$$_SSHDataCopyWithImpl<_$_SSHData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SSHDataToJson(
      this,
    );
  }
}

abstract class _SSHData implements SSHData {
  const factory _SSHData(
      {required final bool installServer,
      required final bool allowPw,
      final List<String> authorizedKeys}) = _$_SSHData;

  factory _SSHData.fromJson(Map<String, dynamic> json) = _$_SSHData.fromJson;

  @override
  bool get installServer;
  @override
  bool get allowPw;
  @override
  List<String> get authorizedKeys;
  @override
  @JsonKey(ignore: true)
  _$$_SSHDataCopyWith<_$_SSHData> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelSnapInfo _$ChannelSnapInfoFromJson(Map<String, dynamic> json) {
  return _ChannelSnapInfo.fromJson(json);
}

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
abstract class _$$_ChannelSnapInfoCopyWith<$Res>
    implements $ChannelSnapInfoCopyWith<$Res> {
  factory _$$_ChannelSnapInfoCopyWith(
          _$_ChannelSnapInfo value, $Res Function(_$_ChannelSnapInfo) then) =
      __$$_ChannelSnapInfoCopyWithImpl<$Res>;
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
class __$$_ChannelSnapInfoCopyWithImpl<$Res>
    extends _$ChannelSnapInfoCopyWithImpl<$Res>
    implements _$$_ChannelSnapInfoCopyWith<$Res> {
  __$$_ChannelSnapInfoCopyWithImpl(
      _$_ChannelSnapInfo _value, $Res Function(_$_ChannelSnapInfo) _then)
      : super(_value, (v) => _then(v as _$_ChannelSnapInfo));

  @override
  _$_ChannelSnapInfo get _value => super._value as _$_ChannelSnapInfo;

  @override
  $Res call({
    Object? channelName = freezed,
    Object? revision = freezed,
    Object? confinement = freezed,
    Object? version = freezed,
    Object? size = freezed,
    Object? releasedAt = freezed,
  }) {
    return _then(_$_ChannelSnapInfo(
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
      _$$_ChannelSnapInfoFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_ChannelSnapInfo &&
            const DeepCollectionEquality()
                .equals(other.channelName, channelName) &&
            const DeepCollectionEquality().equals(other.revision, revision) &&
            const DeepCollectionEquality()
                .equals(other.confinement, confinement) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality()
                .equals(other.releasedAt, releasedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(channelName),
      const DeepCollectionEquality().hash(revision),
      const DeepCollectionEquality().hash(confinement),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(releasedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ChannelSnapInfoCopyWith<_$_ChannelSnapInfo> get copyWith =>
      __$$_ChannelSnapInfoCopyWithImpl<_$_ChannelSnapInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelSnapInfoToJson(
      this,
    );
  }
}

abstract class _ChannelSnapInfo implements ChannelSnapInfo {
  const factory _ChannelSnapInfo(
      {required final String channelName,
      required final String revision,
      required final String confinement,
      required final String version,
      required final int size,
      required final DateTime releasedAt}) = _$_ChannelSnapInfo;

  factory _ChannelSnapInfo.fromJson(Map<String, dynamic> json) =
      _$_ChannelSnapInfo.fromJson;

  @override
  String get channelName;
  @override
  String get revision;
  @override
  String get confinement;
  @override
  String get version;
  @override
  int get size;
  @override
  DateTime get releasedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChannelSnapInfoCopyWith<_$_ChannelSnapInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

SnapInfo _$SnapInfoFromJson(Map<String, dynamic> json) {
  return _SnapInfo.fromJson(json);
}

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
abstract class _$$_SnapInfoCopyWith<$Res> implements $SnapInfoCopyWith<$Res> {
  factory _$$_SnapInfoCopyWith(
          _$_SnapInfo value, $Res Function(_$_SnapInfo) then) =
      __$$_SnapInfoCopyWithImpl<$Res>;
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
class __$$_SnapInfoCopyWithImpl<$Res> extends _$SnapInfoCopyWithImpl<$Res>
    implements _$$_SnapInfoCopyWith<$Res> {
  __$$_SnapInfoCopyWithImpl(
      _$_SnapInfo _value, $Res Function(_$_SnapInfo) _then)
      : super(_value, (v) => _then(v as _$_SnapInfo));

  @override
  _$_SnapInfo get _value => super._value as _$_SnapInfo;

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
    return _then(_$_SnapInfo(
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
          ? _value._channels
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
      final List<ChannelSnapInfo> channels = const []})
      : _channels = channels;

  factory _$_SnapInfo.fromJson(Map<String, dynamic> json) =>
      _$$_SnapInfoFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String summary;
  @override
  @JsonKey()
  final String publisher;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey()
  final bool starred;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String confinement;
  @override
  @JsonKey()
  final String license;
  final List<ChannelSnapInfo> _channels;
  @override
  @JsonKey()
  List<ChannelSnapInfo> get channels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  @override
  String toString() {
    return 'SnapInfo(name: $name, summary: $summary, publisher: $publisher, verified: $verified, starred: $starred, description: $description, confinement: $confinement, license: $license, channels: $channels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SnapInfo &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.summary, summary) &&
            const DeepCollectionEquality().equals(other.publisher, publisher) &&
            const DeepCollectionEquality().equals(other.verified, verified) &&
            const DeepCollectionEquality().equals(other.starred, starred) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.confinement, confinement) &&
            const DeepCollectionEquality().equals(other.license, license) &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(summary),
      const DeepCollectionEquality().hash(publisher),
      const DeepCollectionEquality().hash(verified),
      const DeepCollectionEquality().hash(starred),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(confinement),
      const DeepCollectionEquality().hash(license),
      const DeepCollectionEquality().hash(_channels));

  @JsonKey(ignore: true)
  @override
  _$$_SnapInfoCopyWith<_$_SnapInfo> get copyWith =>
      __$$_SnapInfoCopyWithImpl<_$_SnapInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SnapInfoToJson(
      this,
    );
  }
}

abstract class _SnapInfo implements SnapInfo {
  const factory _SnapInfo(
      {required final String name,
      final String summary,
      final String publisher,
      final bool verified,
      final bool starred,
      final String description,
      final String confinement,
      final String license,
      final List<ChannelSnapInfo> channels}) = _$_SnapInfo;

  factory _SnapInfo.fromJson(Map<String, dynamic> json) = _$_SnapInfo.fromJson;

  @override
  String get name;
  @override
  String get summary;
  @override
  String get publisher;
  @override
  bool get verified;
  @override
  bool get starred;
  @override
  String get description;
  @override
  String get confinement;
  @override
  String get license;
  @override
  List<ChannelSnapInfo> get channels;
  @override
  @JsonKey(ignore: true)
  _$$_SnapInfoCopyWith<_$_SnapInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

DriversResponse _$DriversResponseFromJson(Map<String, dynamic> json) {
  return _DriversResponse.fromJson(json);
}

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
abstract class _$$_DriversResponseCopyWith<$Res>
    implements $DriversResponseCopyWith<$Res> {
  factory _$$_DriversResponseCopyWith(
          _$_DriversResponse value, $Res Function(_$_DriversResponse) then) =
      __$$_DriversResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool install,
      List<String>? drivers,
      bool localOnly,
      bool searchDrivers});
}

/// @nodoc
class __$$_DriversResponseCopyWithImpl<$Res>
    extends _$DriversResponseCopyWithImpl<$Res>
    implements _$$_DriversResponseCopyWith<$Res> {
  __$$_DriversResponseCopyWithImpl(
      _$_DriversResponse _value, $Res Function(_$_DriversResponse) _then)
      : super(_value, (v) => _then(v as _$_DriversResponse));

  @override
  _$_DriversResponse get _value => super._value as _$_DriversResponse;

  @override
  $Res call({
    Object? install = freezed,
    Object? drivers = freezed,
    Object? localOnly = freezed,
    Object? searchDrivers = freezed,
  }) {
    return _then(_$_DriversResponse(
      install: install == freezed
          ? _value.install
          : install // ignore: cast_nullable_to_non_nullable
              as bool,
      drivers: drivers == freezed
          ? _value._drivers
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
      required final List<String>? drivers,
      required this.localOnly,
      required this.searchDrivers})
      : _drivers = drivers;

  factory _$_DriversResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DriversResponseFromJson(json);

  @override
  final bool install;
  final List<String>? _drivers;
  @override
  List<String>? get drivers {
    final value = _drivers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_DriversResponse &&
            const DeepCollectionEquality().equals(other.install, install) &&
            const DeepCollectionEquality().equals(other._drivers, _drivers) &&
            const DeepCollectionEquality().equals(other.localOnly, localOnly) &&
            const DeepCollectionEquality()
                .equals(other.searchDrivers, searchDrivers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(install),
      const DeepCollectionEquality().hash(_drivers),
      const DeepCollectionEquality().hash(localOnly),
      const DeepCollectionEquality().hash(searchDrivers));

  @JsonKey(ignore: true)
  @override
  _$$_DriversResponseCopyWith<_$_DriversResponse> get copyWith =>
      __$$_DriversResponseCopyWithImpl<_$_DriversResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DriversResponseToJson(
      this,
    );
  }
}

abstract class _DriversResponse implements DriversResponse {
  const factory _DriversResponse(
      {required final bool install,
      required final List<String>? drivers,
      required final bool localOnly,
      required final bool searchDrivers}) = _$_DriversResponse;

  factory _DriversResponse.fromJson(Map<String, dynamic> json) =
      _$_DriversResponse.fromJson;

  @override
  bool get install;
  @override
  List<String>? get drivers;
  @override
  bool get localOnly;
  @override
  bool get searchDrivers;
  @override
  @JsonKey(ignore: true)
  _$$_DriversResponseCopyWith<_$_DriversResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DriversPayload _$DriversPayloadFromJson(Map<String, dynamic> json) {
  return _DriversPayload.fromJson(json);
}

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
abstract class _$$_DriversPayloadCopyWith<$Res>
    implements $DriversPayloadCopyWith<$Res> {
  factory _$$_DriversPayloadCopyWith(
          _$_DriversPayload value, $Res Function(_$_DriversPayload) then) =
      __$$_DriversPayloadCopyWithImpl<$Res>;
  @override
  $Res call({bool install});
}

/// @nodoc
class __$$_DriversPayloadCopyWithImpl<$Res>
    extends _$DriversPayloadCopyWithImpl<$Res>
    implements _$$_DriversPayloadCopyWith<$Res> {
  __$$_DriversPayloadCopyWithImpl(
      _$_DriversPayload _value, $Res Function(_$_DriversPayload) _then)
      : super(_value, (v) => _then(v as _$_DriversPayload));

  @override
  _$_DriversPayload get _value => super._value as _$_DriversPayload;

  @override
  $Res call({
    Object? install = freezed,
  }) {
    return _then(_$_DriversPayload(
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
      _$$_DriversPayloadFromJson(json);

  @override
  final bool install;

  @override
  String toString() {
    return 'DriversPayload(install: $install)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DriversPayload &&
            const DeepCollectionEquality().equals(other.install, install));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(install));

  @JsonKey(ignore: true)
  @override
  _$$_DriversPayloadCopyWith<_$_DriversPayload> get copyWith =>
      __$$_DriversPayloadCopyWithImpl<_$_DriversPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DriversPayloadToJson(
      this,
    );
  }
}

abstract class _DriversPayload implements DriversPayload {
  const factory _DriversPayload({required final bool install}) =
      _$_DriversPayload;

  factory _DriversPayload.fromJson(Map<String, dynamic> json) =
      _$_DriversPayload.fromJson;

  @override
  bool get install;
  @override
  @JsonKey(ignore: true)
  _$$_DriversPayloadCopyWith<_$_DriversPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

SnapSelection _$SnapSelectionFromJson(Map<String, dynamic> json) {
  return _SnapSelection.fromJson(json);
}

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
abstract class _$$_SnapSelectionCopyWith<$Res>
    implements $SnapSelectionCopyWith<$Res> {
  factory _$$_SnapSelectionCopyWith(
          _$_SnapSelection value, $Res Function(_$_SnapSelection) then) =
      __$$_SnapSelectionCopyWithImpl<$Res>;
  @override
  $Res call({String name, String channel, bool classic});
}

/// @nodoc
class __$$_SnapSelectionCopyWithImpl<$Res>
    extends _$SnapSelectionCopyWithImpl<$Res>
    implements _$$_SnapSelectionCopyWith<$Res> {
  __$$_SnapSelectionCopyWithImpl(
      _$_SnapSelection _value, $Res Function(_$_SnapSelection) _then)
      : super(_value, (v) => _then(v as _$_SnapSelection));

  @override
  _$_SnapSelection get _value => super._value as _$_SnapSelection;

  @override
  $Res call({
    Object? name = freezed,
    Object? channel = freezed,
    Object? classic = freezed,
  }) {
    return _then(_$_SnapSelection(
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
      _$$_SnapSelectionFromJson(json);

  @override
  final String name;
  @override
  final String channel;
  @override
  @JsonKey()
  final bool classic;

  @override
  String toString() {
    return 'SnapSelection(name: $name, channel: $channel, classic: $classic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SnapSelection &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.channel, channel) &&
            const DeepCollectionEquality().equals(other.classic, classic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(channel),
      const DeepCollectionEquality().hash(classic));

  @JsonKey(ignore: true)
  @override
  _$$_SnapSelectionCopyWith<_$_SnapSelection> get copyWith =>
      __$$_SnapSelectionCopyWithImpl<_$_SnapSelection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SnapSelectionToJson(
      this,
    );
  }
}

abstract class _SnapSelection implements SnapSelection {
  const factory _SnapSelection(
      {required final String name,
      required final String channel,
      final bool classic}) = _$_SnapSelection;

  factory _SnapSelection.fromJson(Map<String, dynamic> json) =
      _$_SnapSelection.fromJson;

  @override
  String get name;
  @override
  String get channel;
  @override
  bool get classic;
  @override
  @JsonKey(ignore: true)
  _$$_SnapSelectionCopyWith<_$_SnapSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

SnapListResponse _$SnapListResponseFromJson(Map<String, dynamic> json) {
  return _SnapListResponse.fromJson(json);
}

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
abstract class _$$_SnapListResponseCopyWith<$Res>
    implements $SnapListResponseCopyWith<$Res> {
  factory _$$_SnapListResponseCopyWith(
          _$_SnapListResponse value, $Res Function(_$_SnapListResponse) then) =
      __$$_SnapListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {SnapCheckState status,
      List<SnapInfo> snaps,
      List<SnapSelection> selections});
}

/// @nodoc
class __$$_SnapListResponseCopyWithImpl<$Res>
    extends _$SnapListResponseCopyWithImpl<$Res>
    implements _$$_SnapListResponseCopyWith<$Res> {
  __$$_SnapListResponseCopyWithImpl(
      _$_SnapListResponse _value, $Res Function(_$_SnapListResponse) _then)
      : super(_value, (v) => _then(v as _$_SnapListResponse));

  @override
  _$_SnapListResponse get _value => super._value as _$_SnapListResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? snaps = freezed,
    Object? selections = freezed,
  }) {
    return _then(_$_SnapListResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SnapCheckState,
      snaps: snaps == freezed
          ? _value._snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<SnapInfo>,
      selections: selections == freezed
          ? _value._selections
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
      final List<SnapInfo> snaps = const [],
      final List<SnapSelection> selections = const []})
      : _snaps = snaps,
        _selections = selections;

  factory _$_SnapListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SnapListResponseFromJson(json);

  @override
  final SnapCheckState status;
  final List<SnapInfo> _snaps;
  @override
  @JsonKey()
  List<SnapInfo> get snaps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_snaps);
  }

  final List<SnapSelection> _selections;
  @override
  @JsonKey()
  List<SnapSelection> get selections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selections);
  }

  @override
  String toString() {
    return 'SnapListResponse(status: $status, snaps: $snaps, selections: $selections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SnapListResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._snaps, _snaps) &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_snaps),
      const DeepCollectionEquality().hash(_selections));

  @JsonKey(ignore: true)
  @override
  _$$_SnapListResponseCopyWith<_$_SnapListResponse> get copyWith =>
      __$$_SnapListResponseCopyWithImpl<_$_SnapListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SnapListResponseToJson(
      this,
    );
  }
}

abstract class _SnapListResponse implements SnapListResponse {
  const factory _SnapListResponse(
      {required final SnapCheckState status,
      final List<SnapInfo> snaps,
      final List<SnapSelection> selections}) = _$_SnapListResponse;

  factory _SnapListResponse.fromJson(Map<String, dynamic> json) =
      _$_SnapListResponse.fromJson;

  @override
  SnapCheckState get status;
  @override
  List<SnapInfo> get snaps;
  @override
  List<SnapSelection> get selections;
  @override
  @JsonKey(ignore: true)
  _$$_SnapListResponseCopyWith<_$_SnapListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeZoneInfo _$TimeZoneInfoFromJson(Map<String, dynamic> json) {
  return _TimeZoneInfo.fromJson(json);
}

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
abstract class _$$_TimeZoneInfoCopyWith<$Res>
    implements $TimeZoneInfoCopyWith<$Res> {
  factory _$$_TimeZoneInfoCopyWith(
          _$_TimeZoneInfo value, $Res Function(_$_TimeZoneInfo) then) =
      __$$_TimeZoneInfoCopyWithImpl<$Res>;
  @override
  $Res call({String timezone, bool fromGeoip});
}

/// @nodoc
class __$$_TimeZoneInfoCopyWithImpl<$Res>
    extends _$TimeZoneInfoCopyWithImpl<$Res>
    implements _$$_TimeZoneInfoCopyWith<$Res> {
  __$$_TimeZoneInfoCopyWithImpl(
      _$_TimeZoneInfo _value, $Res Function(_$_TimeZoneInfo) _then)
      : super(_value, (v) => _then(v as _$_TimeZoneInfo));

  @override
  _$_TimeZoneInfo get _value => super._value as _$_TimeZoneInfo;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? fromGeoip = freezed,
  }) {
    return _then(_$_TimeZoneInfo(
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
      _$$_TimeZoneInfoFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_TimeZoneInfo &&
            const DeepCollectionEquality().equals(other.timezone, timezone) &&
            const DeepCollectionEquality().equals(other.fromGeoip, fromGeoip));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timezone),
      const DeepCollectionEquality().hash(fromGeoip));

  @JsonKey(ignore: true)
  @override
  _$$_TimeZoneInfoCopyWith<_$_TimeZoneInfo> get copyWith =>
      __$$_TimeZoneInfoCopyWithImpl<_$_TimeZoneInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeZoneInfoToJson(
      this,
    );
  }
}

abstract class _TimeZoneInfo implements TimeZoneInfo {
  const factory _TimeZoneInfo(
      {required final String timezone,
      required final bool fromGeoip}) = _$_TimeZoneInfo;

  factory _TimeZoneInfo.fromJson(Map<String, dynamic> json) =
      _$_TimeZoneInfo.fromJson;

  @override
  String get timezone;
  @override
  bool get fromGeoip;
  @override
  @JsonKey(ignore: true)
  _$$_TimeZoneInfoCopyWith<_$_TimeZoneInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProInfo _$UbuntuProInfoFromJson(Map<String, dynamic> json) {
  return _UbuntuProInfo.fromJson(json);
}

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
abstract class _$$_UbuntuProInfoCopyWith<$Res>
    implements $UbuntuProInfoCopyWith<$Res> {
  factory _$$_UbuntuProInfoCopyWith(
          _$_UbuntuProInfo value, $Res Function(_$_UbuntuProInfo) then) =
      __$$_UbuntuProInfoCopyWithImpl<$Res>;
  @override
  $Res call({String token});
}

/// @nodoc
class __$$_UbuntuProInfoCopyWithImpl<$Res>
    extends _$UbuntuProInfoCopyWithImpl<$Res>
    implements _$$_UbuntuProInfoCopyWith<$Res> {
  __$$_UbuntuProInfoCopyWithImpl(
      _$_UbuntuProInfo _value, $Res Function(_$_UbuntuProInfo) _then)
      : super(_value, (v) => _then(v as _$_UbuntuProInfo));

  @override
  _$_UbuntuProInfo get _value => super._value as _$_UbuntuProInfo;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$_UbuntuProInfo(
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
      _$$_UbuntuProInfoFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'UbuntuProInfo(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UbuntuProInfo &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_UbuntuProInfoCopyWith<_$_UbuntuProInfo> get copyWith =>
      __$$_UbuntuProInfoCopyWithImpl<_$_UbuntuProInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UbuntuProInfoToJson(
      this,
    );
  }
}

abstract class _UbuntuProInfo implements UbuntuProInfo {
  const factory _UbuntuProInfo({required final String token}) =
      _$_UbuntuProInfo;

  factory _UbuntuProInfo.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProInfo.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_UbuntuProInfoCopyWith<_$_UbuntuProInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProResponse _$UbuntuProResponseFromJson(Map<String, dynamic> json) {
  return _UbuntuProResponse.fromJson(json);
}

/// @nodoc
mixin _$UbuntuProResponse {
  String get token => throw _privateConstructorUsedError;
  bool get hasNetwork => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UbuntuProResponseCopyWith<UbuntuProResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbuntuProResponseCopyWith<$Res> {
  factory $UbuntuProResponseCopyWith(
          UbuntuProResponse value, $Res Function(UbuntuProResponse) then) =
      _$UbuntuProResponseCopyWithImpl<$Res>;
  $Res call({String token, bool hasNetwork});
}

/// @nodoc
class _$UbuntuProResponseCopyWithImpl<$Res>
    implements $UbuntuProResponseCopyWith<$Res> {
  _$UbuntuProResponseCopyWithImpl(this._value, this._then);

  final UbuntuProResponse _value;
  // ignore: unused_field
  final $Res Function(UbuntuProResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? hasNetwork = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      hasNetwork: hasNetwork == freezed
          ? _value.hasNetwork
          : hasNetwork // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UbuntuProResponseCopyWith<$Res>
    implements $UbuntuProResponseCopyWith<$Res> {
  factory _$$_UbuntuProResponseCopyWith(_$_UbuntuProResponse value,
          $Res Function(_$_UbuntuProResponse) then) =
      __$$_UbuntuProResponseCopyWithImpl<$Res>;
  @override
  $Res call({String token, bool hasNetwork});
}

/// @nodoc
class __$$_UbuntuProResponseCopyWithImpl<$Res>
    extends _$UbuntuProResponseCopyWithImpl<$Res>
    implements _$$_UbuntuProResponseCopyWith<$Res> {
  __$$_UbuntuProResponseCopyWithImpl(
      _$_UbuntuProResponse _value, $Res Function(_$_UbuntuProResponse) _then)
      : super(_value, (v) => _then(v as _$_UbuntuProResponse));

  @override
  _$_UbuntuProResponse get _value => super._value as _$_UbuntuProResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? hasNetwork = freezed,
  }) {
    return _then(_$_UbuntuProResponse(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      hasNetwork: hasNetwork == freezed
          ? _value.hasNetwork
          : hasNetwork // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProResponse implements _UbuntuProResponse {
  const _$_UbuntuProResponse({required this.token, required this.hasNetwork});

  factory _$_UbuntuProResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UbuntuProResponseFromJson(json);

  @override
  final String token;
  @override
  final bool hasNetwork;

  @override
  String toString() {
    return 'UbuntuProResponse(token: $token, hasNetwork: $hasNetwork)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UbuntuProResponse &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.hasNetwork, hasNetwork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(hasNetwork));

  @JsonKey(ignore: true)
  @override
  _$$_UbuntuProResponseCopyWith<_$_UbuntuProResponse> get copyWith =>
      __$$_UbuntuProResponseCopyWithImpl<_$_UbuntuProResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UbuntuProResponseToJson(
      this,
    );
  }
}

abstract class _UbuntuProResponse implements UbuntuProResponse {
  const factory _UbuntuProResponse(
      {required final String token,
      required final bool hasNetwork}) = _$_UbuntuProResponse;

  factory _UbuntuProResponse.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProResponse.fromJson;

  @override
  String get token;
  @override
  bool get hasNetwork;
  @override
  @JsonKey(ignore: true)
  _$$_UbuntuProResponseCopyWith<_$_UbuntuProResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

UPCSInitiateResponse _$UPCSInitiateResponseFromJson(Map<String, dynamic> json) {
  return _UPCSInitiateResponse.fromJson(json);
}

/// @nodoc
mixin _$UPCSInitiateResponse {
  String get userCode => throw _privateConstructorUsedError;
  int get validitySeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UPCSInitiateResponseCopyWith<UPCSInitiateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UPCSInitiateResponseCopyWith<$Res> {
  factory $UPCSInitiateResponseCopyWith(UPCSInitiateResponse value,
          $Res Function(UPCSInitiateResponse) then) =
      _$UPCSInitiateResponseCopyWithImpl<$Res>;
  $Res call({String userCode, int validitySeconds});
}

/// @nodoc
class _$UPCSInitiateResponseCopyWithImpl<$Res>
    implements $UPCSInitiateResponseCopyWith<$Res> {
  _$UPCSInitiateResponseCopyWithImpl(this._value, this._then);

  final UPCSInitiateResponse _value;
  // ignore: unused_field
  final $Res Function(UPCSInitiateResponse) _then;

  @override
  $Res call({
    Object? userCode = freezed,
    Object? validitySeconds = freezed,
  }) {
    return _then(_value.copyWith(
      userCode: userCode == freezed
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      validitySeconds: validitySeconds == freezed
          ? _value.validitySeconds
          : validitySeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_UPCSInitiateResponseCopyWith<$Res>
    implements $UPCSInitiateResponseCopyWith<$Res> {
  factory _$$_UPCSInitiateResponseCopyWith(_$_UPCSInitiateResponse value,
          $Res Function(_$_UPCSInitiateResponse) then) =
      __$$_UPCSInitiateResponseCopyWithImpl<$Res>;
  @override
  $Res call({String userCode, int validitySeconds});
}

/// @nodoc
class __$$_UPCSInitiateResponseCopyWithImpl<$Res>
    extends _$UPCSInitiateResponseCopyWithImpl<$Res>
    implements _$$_UPCSInitiateResponseCopyWith<$Res> {
  __$$_UPCSInitiateResponseCopyWithImpl(_$_UPCSInitiateResponse _value,
      $Res Function(_$_UPCSInitiateResponse) _then)
      : super(_value, (v) => _then(v as _$_UPCSInitiateResponse));

  @override
  _$_UPCSInitiateResponse get _value => super._value as _$_UPCSInitiateResponse;

  @override
  $Res call({
    Object? userCode = freezed,
    Object? validitySeconds = freezed,
  }) {
    return _then(_$_UPCSInitiateResponse(
      userCode: userCode == freezed
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      validitySeconds: validitySeconds == freezed
          ? _value.validitySeconds
          : validitySeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UPCSInitiateResponse implements _UPCSInitiateResponse {
  const _$_UPCSInitiateResponse(
      {required this.userCode, required this.validitySeconds});

  factory _$_UPCSInitiateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UPCSInitiateResponseFromJson(json);

  @override
  final String userCode;
  @override
  final int validitySeconds;

  @override
  String toString() {
    return 'UPCSInitiateResponse(userCode: $userCode, validitySeconds: $validitySeconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UPCSInitiateResponse &&
            const DeepCollectionEquality().equals(other.userCode, userCode) &&
            const DeepCollectionEquality()
                .equals(other.validitySeconds, validitySeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userCode),
      const DeepCollectionEquality().hash(validitySeconds));

  @JsonKey(ignore: true)
  @override
  _$$_UPCSInitiateResponseCopyWith<_$_UPCSInitiateResponse> get copyWith =>
      __$$_UPCSInitiateResponseCopyWithImpl<_$_UPCSInitiateResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UPCSInitiateResponseToJson(
      this,
    );
  }
}

abstract class _UPCSInitiateResponse implements UPCSInitiateResponse {
  const factory _UPCSInitiateResponse(
      {required final String userCode,
      required final int validitySeconds}) = _$_UPCSInitiateResponse;

  factory _UPCSInitiateResponse.fromJson(Map<String, dynamic> json) =
      _$_UPCSInitiateResponse.fromJson;

  @override
  String get userCode;
  @override
  int get validitySeconds;
  @override
  @JsonKey(ignore: true)
  _$$_UPCSInitiateResponseCopyWith<_$_UPCSInitiateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

UPCSWaitResponse _$UPCSWaitResponseFromJson(Map<String, dynamic> json) {
  return _UPCSWaitResponse.fromJson(json);
}

/// @nodoc
mixin _$UPCSWaitResponse {
  UPCSWaitStatus get status => throw _privateConstructorUsedError;
  String? get contractToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UPCSWaitResponseCopyWith<UPCSWaitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UPCSWaitResponseCopyWith<$Res> {
  factory $UPCSWaitResponseCopyWith(
          UPCSWaitResponse value, $Res Function(UPCSWaitResponse) then) =
      _$UPCSWaitResponseCopyWithImpl<$Res>;
  $Res call({UPCSWaitStatus status, String? contractToken});
}

/// @nodoc
class _$UPCSWaitResponseCopyWithImpl<$Res>
    implements $UPCSWaitResponseCopyWith<$Res> {
  _$UPCSWaitResponseCopyWithImpl(this._value, this._then);

  final UPCSWaitResponse _value;
  // ignore: unused_field
  final $Res Function(UPCSWaitResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? contractToken = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UPCSWaitStatus,
      contractToken: contractToken == freezed
          ? _value.contractToken
          : contractToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UPCSWaitResponseCopyWith<$Res>
    implements $UPCSWaitResponseCopyWith<$Res> {
  factory _$$_UPCSWaitResponseCopyWith(
          _$_UPCSWaitResponse value, $Res Function(_$_UPCSWaitResponse) then) =
      __$$_UPCSWaitResponseCopyWithImpl<$Res>;
  @override
  $Res call({UPCSWaitStatus status, String? contractToken});
}

/// @nodoc
class __$$_UPCSWaitResponseCopyWithImpl<$Res>
    extends _$UPCSWaitResponseCopyWithImpl<$Res>
    implements _$$_UPCSWaitResponseCopyWith<$Res> {
  __$$_UPCSWaitResponseCopyWithImpl(
      _$_UPCSWaitResponse _value, $Res Function(_$_UPCSWaitResponse) _then)
      : super(_value, (v) => _then(v as _$_UPCSWaitResponse));

  @override
  _$_UPCSWaitResponse get _value => super._value as _$_UPCSWaitResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? contractToken = freezed,
  }) {
    return _then(_$_UPCSWaitResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UPCSWaitStatus,
      contractToken: contractToken == freezed
          ? _value.contractToken
          : contractToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UPCSWaitResponse implements _UPCSWaitResponse {
  const _$_UPCSWaitResponse(
      {required this.status, required this.contractToken});

  factory _$_UPCSWaitResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UPCSWaitResponseFromJson(json);

  @override
  final UPCSWaitStatus status;
  @override
  final String? contractToken;

  @override
  String toString() {
    return 'UPCSWaitResponse(status: $status, contractToken: $contractToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UPCSWaitResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.contractToken, contractToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(contractToken));

  @JsonKey(ignore: true)
  @override
  _$$_UPCSWaitResponseCopyWith<_$_UPCSWaitResponse> get copyWith =>
      __$$_UPCSWaitResponseCopyWithImpl<_$_UPCSWaitResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UPCSWaitResponseToJson(
      this,
    );
  }
}

abstract class _UPCSWaitResponse implements UPCSWaitResponse {
  const factory _UPCSWaitResponse(
      {required final UPCSWaitStatus status,
      required final String? contractToken}) = _$_UPCSWaitResponse;

  factory _UPCSWaitResponse.fromJson(Map<String, dynamic> json) =
      _$_UPCSWaitResponse.fromJson;

  @override
  UPCSWaitStatus get status;
  @override
  String? get contractToken;
  @override
  @JsonKey(ignore: true)
  _$$_UPCSWaitResponseCopyWith<_$_UPCSWaitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProService _$UbuntuProServiceFromJson(Map<String, dynamic> json) {
  return _UbuntuProService.fromJson(json);
}

/// @nodoc
mixin _$UbuntuProService {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get autoEnabled => throw _privateConstructorUsedError;

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
  $Res call({String name, String description, bool autoEnabled});
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
    Object? autoEnabled = freezed,
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
      autoEnabled: autoEnabled == freezed
          ? _value.autoEnabled
          : autoEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UbuntuProServiceCopyWith<$Res>
    implements $UbuntuProServiceCopyWith<$Res> {
  factory _$$_UbuntuProServiceCopyWith(
          _$_UbuntuProService value, $Res Function(_$_UbuntuProService) then) =
      __$$_UbuntuProServiceCopyWithImpl<$Res>;
  @override
  $Res call({String name, String description, bool autoEnabled});
}

/// @nodoc
class __$$_UbuntuProServiceCopyWithImpl<$Res>
    extends _$UbuntuProServiceCopyWithImpl<$Res>
    implements _$$_UbuntuProServiceCopyWith<$Res> {
  __$$_UbuntuProServiceCopyWithImpl(
      _$_UbuntuProService _value, $Res Function(_$_UbuntuProService) _then)
      : super(_value, (v) => _then(v as _$_UbuntuProService));

  @override
  _$_UbuntuProService get _value => super._value as _$_UbuntuProService;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? autoEnabled = freezed,
  }) {
    return _then(_$_UbuntuProService(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      autoEnabled: autoEnabled == freezed
          ? _value.autoEnabled
          : autoEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProService implements _UbuntuProService {
  const _$_UbuntuProService(
      {required this.name,
      required this.description,
      required this.autoEnabled});

  factory _$_UbuntuProService.fromJson(Map<String, dynamic> json) =>
      _$$_UbuntuProServiceFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final bool autoEnabled;

  @override
  String toString() {
    return 'UbuntuProService(name: $name, description: $description, autoEnabled: $autoEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UbuntuProService &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.autoEnabled, autoEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(autoEnabled));

  @JsonKey(ignore: true)
  @override
  _$$_UbuntuProServiceCopyWith<_$_UbuntuProService> get copyWith =>
      __$$_UbuntuProServiceCopyWithImpl<_$_UbuntuProService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UbuntuProServiceToJson(
      this,
    );
  }
}

abstract class _UbuntuProService implements UbuntuProService {
  const factory _UbuntuProService(
      {required final String name,
      required final String description,
      required final bool autoEnabled}) = _$_UbuntuProService;

  factory _UbuntuProService.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProService.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  bool get autoEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_UbuntuProServiceCopyWith<_$_UbuntuProService> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProSubscription _$UbuntuProSubscriptionFromJson(
    Map<String, dynamic> json) {
  return _UbuntuProSubscription.fromJson(json);
}

/// @nodoc
mixin _$UbuntuProSubscription {
  String get contractName => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get contractToken => throw _privateConstructorUsedError;
  List<UbuntuProService> get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UbuntuProSubscriptionCopyWith<UbuntuProSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbuntuProSubscriptionCopyWith<$Res> {
  factory $UbuntuProSubscriptionCopyWith(UbuntuProSubscription value,
          $Res Function(UbuntuProSubscription) then) =
      _$UbuntuProSubscriptionCopyWithImpl<$Res>;
  $Res call(
      {String contractName,
      String accountName,
      String contractToken,
      List<UbuntuProService> services});
}

/// @nodoc
class _$UbuntuProSubscriptionCopyWithImpl<$Res>
    implements $UbuntuProSubscriptionCopyWith<$Res> {
  _$UbuntuProSubscriptionCopyWithImpl(this._value, this._then);

  final UbuntuProSubscription _value;
  // ignore: unused_field
  final $Res Function(UbuntuProSubscription) _then;

  @override
  $Res call({
    Object? contractName = freezed,
    Object? accountName = freezed,
    Object? contractToken = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      contractName: contractName == freezed
          ? _value.contractName
          : contractName // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      contractToken: contractToken == freezed
          ? _value.contractToken
          : contractToken // ignore: cast_nullable_to_non_nullable
              as String,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<UbuntuProService>,
    ));
  }
}

/// @nodoc
abstract class _$$_UbuntuProSubscriptionCopyWith<$Res>
    implements $UbuntuProSubscriptionCopyWith<$Res> {
  factory _$$_UbuntuProSubscriptionCopyWith(_$_UbuntuProSubscription value,
          $Res Function(_$_UbuntuProSubscription) then) =
      __$$_UbuntuProSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String contractName,
      String accountName,
      String contractToken,
      List<UbuntuProService> services});
}

/// @nodoc
class __$$_UbuntuProSubscriptionCopyWithImpl<$Res>
    extends _$UbuntuProSubscriptionCopyWithImpl<$Res>
    implements _$$_UbuntuProSubscriptionCopyWith<$Res> {
  __$$_UbuntuProSubscriptionCopyWithImpl(_$_UbuntuProSubscription _value,
      $Res Function(_$_UbuntuProSubscription) _then)
      : super(_value, (v) => _then(v as _$_UbuntuProSubscription));

  @override
  _$_UbuntuProSubscription get _value =>
      super._value as _$_UbuntuProSubscription;

  @override
  $Res call({
    Object? contractName = freezed,
    Object? accountName = freezed,
    Object? contractToken = freezed,
    Object? services = freezed,
  }) {
    return _then(_$_UbuntuProSubscription(
      contractName: contractName == freezed
          ? _value.contractName
          : contractName // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      contractToken: contractToken == freezed
          ? _value.contractToken
          : contractToken // ignore: cast_nullable_to_non_nullable
              as String,
      services: services == freezed
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<UbuntuProService>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProSubscription implements _UbuntuProSubscription {
  const _$_UbuntuProSubscription(
      {required this.contractName,
      required this.accountName,
      required this.contractToken,
      required final List<UbuntuProService> services})
      : _services = services;

  factory _$_UbuntuProSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_UbuntuProSubscriptionFromJson(json);

  @override
  final String contractName;
  @override
  final String accountName;
  @override
  final String contractToken;
  final List<UbuntuProService> _services;
  @override
  List<UbuntuProService> get services {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'UbuntuProSubscription(contractName: $contractName, accountName: $accountName, contractToken: $contractToken, services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UbuntuProSubscription &&
            const DeepCollectionEquality()
                .equals(other.contractName, contractName) &&
            const DeepCollectionEquality()
                .equals(other.accountName, accountName) &&
            const DeepCollectionEquality()
                .equals(other.contractToken, contractToken) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contractName),
      const DeepCollectionEquality().hash(accountName),
      const DeepCollectionEquality().hash(contractToken),
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  _$$_UbuntuProSubscriptionCopyWith<_$_UbuntuProSubscription> get copyWith =>
      __$$_UbuntuProSubscriptionCopyWithImpl<_$_UbuntuProSubscription>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UbuntuProSubscriptionToJson(
      this,
    );
  }
}

abstract class _UbuntuProSubscription implements UbuntuProSubscription {
  const factory _UbuntuProSubscription(
          {required final String contractName,
          required final String accountName,
          required final String contractToken,
          required final List<UbuntuProService> services}) =
      _$_UbuntuProSubscription;

  factory _UbuntuProSubscription.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProSubscription.fromJson;

  @override
  String get contractName;
  @override
  String get accountName;
  @override
  String get contractToken;
  @override
  List<UbuntuProService> get services;
  @override
  @JsonKey(ignore: true)
  _$$_UbuntuProSubscriptionCopyWith<_$_UbuntuProSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

UbuntuProCheckTokenAnswer _$UbuntuProCheckTokenAnswerFromJson(
    Map<String, dynamic> json) {
  return _UbuntuProCheckTokenAnswer.fromJson(json);
}

/// @nodoc
mixin _$UbuntuProCheckTokenAnswer {
  UbuntuProCheckTokenStatus get status => throw _privateConstructorUsedError;
  UbuntuProSubscription? get subscription => throw _privateConstructorUsedError;

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
      {UbuntuProCheckTokenStatus status, UbuntuProSubscription? subscription});

  $UbuntuProSubscriptionCopyWith<$Res>? get subscription;
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
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UbuntuProCheckTokenStatus,
      subscription: subscription == freezed
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as UbuntuProSubscription?,
    ));
  }

  @override
  $UbuntuProSubscriptionCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $UbuntuProSubscriptionCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value));
    });
  }
}

/// @nodoc
abstract class _$$_UbuntuProCheckTokenAnswerCopyWith<$Res>
    implements $UbuntuProCheckTokenAnswerCopyWith<$Res> {
  factory _$$_UbuntuProCheckTokenAnswerCopyWith(
          _$_UbuntuProCheckTokenAnswer value,
          $Res Function(_$_UbuntuProCheckTokenAnswer) then) =
      __$$_UbuntuProCheckTokenAnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {UbuntuProCheckTokenStatus status, UbuntuProSubscription? subscription});

  @override
  $UbuntuProSubscriptionCopyWith<$Res>? get subscription;
}

/// @nodoc
class __$$_UbuntuProCheckTokenAnswerCopyWithImpl<$Res>
    extends _$UbuntuProCheckTokenAnswerCopyWithImpl<$Res>
    implements _$$_UbuntuProCheckTokenAnswerCopyWith<$Res> {
  __$$_UbuntuProCheckTokenAnswerCopyWithImpl(
      _$_UbuntuProCheckTokenAnswer _value,
      $Res Function(_$_UbuntuProCheckTokenAnswer) _then)
      : super(_value, (v) => _then(v as _$_UbuntuProCheckTokenAnswer));

  @override
  _$_UbuntuProCheckTokenAnswer get _value =>
      super._value as _$_UbuntuProCheckTokenAnswer;

  @override
  $Res call({
    Object? status = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_$_UbuntuProCheckTokenAnswer(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UbuntuProCheckTokenStatus,
      subscription: subscription == freezed
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as UbuntuProSubscription?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UbuntuProCheckTokenAnswer implements _UbuntuProCheckTokenAnswer {
  const _$_UbuntuProCheckTokenAnswer(
      {required this.status, required this.subscription});

  factory _$_UbuntuProCheckTokenAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_UbuntuProCheckTokenAnswerFromJson(json);

  @override
  final UbuntuProCheckTokenStatus status;
  @override
  final UbuntuProSubscription? subscription;

  @override
  String toString() {
    return 'UbuntuProCheckTokenAnswer(status: $status, subscription: $subscription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UbuntuProCheckTokenAnswer &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.subscription, subscription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(subscription));

  @JsonKey(ignore: true)
  @override
  _$$_UbuntuProCheckTokenAnswerCopyWith<_$_UbuntuProCheckTokenAnswer>
      get copyWith => __$$_UbuntuProCheckTokenAnswerCopyWithImpl<
          _$_UbuntuProCheckTokenAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UbuntuProCheckTokenAnswerToJson(
      this,
    );
  }
}

abstract class _UbuntuProCheckTokenAnswer implements UbuntuProCheckTokenAnswer {
  const factory _UbuntuProCheckTokenAnswer(
          {required final UbuntuProCheckTokenStatus status,
          required final UbuntuProSubscription? subscription}) =
      _$_UbuntuProCheckTokenAnswer;

  factory _UbuntuProCheckTokenAnswer.fromJson(Map<String, dynamic> json) =
      _$_UbuntuProCheckTokenAnswer.fromJson;

  @override
  UbuntuProCheckTokenStatus get status;
  @override
  UbuntuProSubscription? get subscription;
  @override
  @JsonKey(ignore: true)
  _$$_UbuntuProCheckTokenAnswerCopyWith<_$_UbuntuProCheckTokenAnswer>
      get copyWith => throw _privateConstructorUsedError;
}

WSLConfigurationBase _$WSLConfigurationBaseFromJson(Map<String, dynamic> json) {
  return _WSLConfigurationBase.fromJson(json);
}

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
abstract class _$$_WSLConfigurationBaseCopyWith<$Res>
    implements $WSLConfigurationBaseCopyWith<$Res> {
  factory _$$_WSLConfigurationBaseCopyWith(_$_WSLConfigurationBase value,
          $Res Function(_$_WSLConfigurationBase) then) =
      __$$_WSLConfigurationBaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String automountRoot,
      String automountOptions,
      bool networkGeneratehosts,
      bool networkGenerateresolvconf});
}

/// @nodoc
class __$$_WSLConfigurationBaseCopyWithImpl<$Res>
    extends _$WSLConfigurationBaseCopyWithImpl<$Res>
    implements _$$_WSLConfigurationBaseCopyWith<$Res> {
  __$$_WSLConfigurationBaseCopyWithImpl(_$_WSLConfigurationBase _value,
      $Res Function(_$_WSLConfigurationBase) _then)
      : super(_value, (v) => _then(v as _$_WSLConfigurationBase));

  @override
  _$_WSLConfigurationBase get _value => super._value as _$_WSLConfigurationBase;

  @override
  $Res call({
    Object? automountRoot = freezed,
    Object? automountOptions = freezed,
    Object? networkGeneratehosts = freezed,
    Object? networkGenerateresolvconf = freezed,
  }) {
    return _then(_$_WSLConfigurationBase(
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
      _$$_WSLConfigurationBaseFromJson(json);

  @override
  @JsonKey()
  final String automountRoot;
  @override
  @JsonKey()
  final String automountOptions;
  @override
  @JsonKey()
  final bool networkGeneratehosts;
  @override
  @JsonKey()
  final bool networkGenerateresolvconf;

  @override
  String toString() {
    return 'WSLConfigurationBase(automountRoot: $automountRoot, automountOptions: $automountOptions, networkGeneratehosts: $networkGeneratehosts, networkGenerateresolvconf: $networkGenerateresolvconf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WSLConfigurationBase &&
            const DeepCollectionEquality()
                .equals(other.automountRoot, automountRoot) &&
            const DeepCollectionEquality()
                .equals(other.automountOptions, automountOptions) &&
            const DeepCollectionEquality()
                .equals(other.networkGeneratehosts, networkGeneratehosts) &&
            const DeepCollectionEquality().equals(
                other.networkGenerateresolvconf, networkGenerateresolvconf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(automountRoot),
      const DeepCollectionEquality().hash(automountOptions),
      const DeepCollectionEquality().hash(networkGeneratehosts),
      const DeepCollectionEquality().hash(networkGenerateresolvconf));

  @JsonKey(ignore: true)
  @override
  _$$_WSLConfigurationBaseCopyWith<_$_WSLConfigurationBase> get copyWith =>
      __$$_WSLConfigurationBaseCopyWithImpl<_$_WSLConfigurationBase>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WSLConfigurationBaseToJson(
      this,
    );
  }
}

abstract class _WSLConfigurationBase implements WSLConfigurationBase {
  const factory _WSLConfigurationBase(
      {final String automountRoot,
      final String automountOptions,
      final bool networkGeneratehosts,
      final bool networkGenerateresolvconf}) = _$_WSLConfigurationBase;

  factory _WSLConfigurationBase.fromJson(Map<String, dynamic> json) =
      _$_WSLConfigurationBase.fromJson;

  @override
  String get automountRoot;
  @override
  String get automountOptions;
  @override
  bool get networkGeneratehosts;
  @override
  bool get networkGenerateresolvconf;
  @override
  @JsonKey(ignore: true)
  _$$_WSLConfigurationBaseCopyWith<_$_WSLConfigurationBase> get copyWith =>
      throw _privateConstructorUsedError;
}

WSLConfigurationAdvanced _$WSLConfigurationAdvancedFromJson(
    Map<String, dynamic> json) {
  return _WSLConfigurationAdvanced.fromJson(json);
}

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
abstract class _$$_WSLConfigurationAdvancedCopyWith<$Res>
    implements $WSLConfigurationAdvancedCopyWith<$Res> {
  factory _$$_WSLConfigurationAdvancedCopyWith(
          _$_WSLConfigurationAdvanced value,
          $Res Function(_$_WSLConfigurationAdvanced) then) =
      __$$_WSLConfigurationAdvancedCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool automountEnabled,
      bool automountMountfstab,
      bool interopEnabled,
      bool interopAppendwindowspath,
      bool systemdEnabled});
}

/// @nodoc
class __$$_WSLConfigurationAdvancedCopyWithImpl<$Res>
    extends _$WSLConfigurationAdvancedCopyWithImpl<$Res>
    implements _$$_WSLConfigurationAdvancedCopyWith<$Res> {
  __$$_WSLConfigurationAdvancedCopyWithImpl(_$_WSLConfigurationAdvanced _value,
      $Res Function(_$_WSLConfigurationAdvanced) _then)
      : super(_value, (v) => _then(v as _$_WSLConfigurationAdvanced));

  @override
  _$_WSLConfigurationAdvanced get _value =>
      super._value as _$_WSLConfigurationAdvanced;

  @override
  $Res call({
    Object? automountEnabled = freezed,
    Object? automountMountfstab = freezed,
    Object? interopEnabled = freezed,
    Object? interopAppendwindowspath = freezed,
    Object? systemdEnabled = freezed,
  }) {
    return _then(_$_WSLConfigurationAdvanced(
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
      _$$_WSLConfigurationAdvancedFromJson(json);

  @override
  @JsonKey()
  final bool automountEnabled;
  @override
  @JsonKey()
  final bool automountMountfstab;
  @override
  @JsonKey()
  final bool interopEnabled;
  @override
  @JsonKey()
  final bool interopAppendwindowspath;
  @override
  @JsonKey()
  final bool systemdEnabled;

  @override
  String toString() {
    return 'WSLConfigurationAdvanced(automountEnabled: $automountEnabled, automountMountfstab: $automountMountfstab, interopEnabled: $interopEnabled, interopAppendwindowspath: $interopAppendwindowspath, systemdEnabled: $systemdEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WSLConfigurationAdvanced &&
            const DeepCollectionEquality()
                .equals(other.automountEnabled, automountEnabled) &&
            const DeepCollectionEquality()
                .equals(other.automountMountfstab, automountMountfstab) &&
            const DeepCollectionEquality()
                .equals(other.interopEnabled, interopEnabled) &&
            const DeepCollectionEquality().equals(
                other.interopAppendwindowspath, interopAppendwindowspath) &&
            const DeepCollectionEquality()
                .equals(other.systemdEnabled, systemdEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(automountEnabled),
      const DeepCollectionEquality().hash(automountMountfstab),
      const DeepCollectionEquality().hash(interopEnabled),
      const DeepCollectionEquality().hash(interopAppendwindowspath),
      const DeepCollectionEquality().hash(systemdEnabled));

  @JsonKey(ignore: true)
  @override
  _$$_WSLConfigurationAdvancedCopyWith<_$_WSLConfigurationAdvanced>
      get copyWith => __$$_WSLConfigurationAdvancedCopyWithImpl<
          _$_WSLConfigurationAdvanced>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WSLConfigurationAdvancedToJson(
      this,
    );
  }
}

abstract class _WSLConfigurationAdvanced implements WSLConfigurationAdvanced {
  const factory _WSLConfigurationAdvanced(
      {final bool automountEnabled,
      final bool automountMountfstab,
      final bool interopEnabled,
      final bool interopAppendwindowspath,
      final bool systemdEnabled}) = _$_WSLConfigurationAdvanced;

  factory _WSLConfigurationAdvanced.fromJson(Map<String, dynamic> json) =
      _$_WSLConfigurationAdvanced.fromJson;

  @override
  bool get automountEnabled;
  @override
  bool get automountMountfstab;
  @override
  bool get interopEnabled;
  @override
  bool get interopAppendwindowspath;
  @override
  bool get systemdEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_WSLConfigurationAdvancedCopyWith<_$_WSLConfigurationAdvanced>
      get copyWith => throw _privateConstructorUsedError;
}
