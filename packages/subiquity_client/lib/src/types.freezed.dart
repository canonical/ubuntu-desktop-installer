// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KeyboardSetting _$KeyboardSettingFromJson(Map<String, dynamic> json) {
  return _KeyboardSetting.fromJson(json);
}

/// @nodoc
class _$KeyboardSettingTearOff {
  const _$KeyboardSettingTearOff();

  _KeyboardSetting call({String? layout, String? variant, String? toggle}) {
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
  String? get layout => throw _privateConstructorUsedError;
  String? get variant => throw _privateConstructorUsedError;
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
  $Res call({String? layout, String? variant, String? toggle});
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
              as String?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? layout, String? variant, String? toggle});
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
              as String?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
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
  const _$_KeyboardSetting({this.layout, this.variant, this.toggle});

  factory _$_KeyboardSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardSettingFromJson(json);

  @override
  final String? layout;
  @override
  final String? variant;
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
      {String? layout, String? variant, String? toggle}) = _$_KeyboardSetting;

  factory _KeyboardSetting.fromJson(Map<String, dynamic> json) =
      _$_KeyboardSetting.fromJson;

  @override
  String? get layout => throw _privateConstructorUsedError;
  @override
  String? get variant => throw _privateConstructorUsedError;
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

  _KeyboardVariant call({String? code, String? name}) {
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
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

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
  $Res call({String? code, String? name});
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
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? code, String? name});
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
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardVariant implements _KeyboardVariant {
  const _$_KeyboardVariant({this.code, this.name});

  factory _$_KeyboardVariant.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardVariantFromJson(json);

  @override
  final String? code;
  @override
  final String? name;

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
  const factory _KeyboardVariant({String? code, String? name}) =
      _$_KeyboardVariant;

  factory _KeyboardVariant.fromJson(Map<String, dynamic> json) =
      _$_KeyboardVariant.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
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
      {String? code, String? name, List<KeyboardVariant>? variants}) {
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
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<KeyboardVariant>? get variants => throw _privateConstructorUsedError;

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
  $Res call({String? code, String? name, List<KeyboardVariant>? variants});
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
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<KeyboardVariant>?,
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
  $Res call({String? code, String? name, List<KeyboardVariant>? variants});
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
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: variants == freezed
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<KeyboardVariant>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardLayout implements _KeyboardLayout {
  const _$_KeyboardLayout({this.code, this.name, this.variants});

  factory _$_KeyboardLayout.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardLayoutFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final List<KeyboardVariant>? variants;

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
      {String? code,
      String? name,
      List<KeyboardVariant>? variants}) = _$_KeyboardLayout;

  factory _KeyboardLayout.fromJson(Map<String, dynamic> json) =
      _$_KeyboardLayout.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  List<KeyboardVariant>? get variants => throw _privateConstructorUsedError;
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
      {KeyboardSetting? setting, List<KeyboardLayout>? layouts}) {
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
  KeyboardSetting? get setting => throw _privateConstructorUsedError;
  List<KeyboardLayout>? get layouts => throw _privateConstructorUsedError;

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
  $Res call({KeyboardSetting? setting, List<KeyboardLayout>? layouts});

  $KeyboardSettingCopyWith<$Res>? get setting;
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
              as KeyboardSetting?,
      layouts: layouts == freezed
          ? _value.layouts
          : layouts // ignore: cast_nullable_to_non_nullable
              as List<KeyboardLayout>?,
    ));
  }

  @override
  $KeyboardSettingCopyWith<$Res>? get setting {
    if (_value.setting == null) {
      return null;
    }

    return $KeyboardSettingCopyWith<$Res>(_value.setting!, (value) {
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
  $Res call({KeyboardSetting? setting, List<KeyboardLayout>? layouts});

  @override
  $KeyboardSettingCopyWith<$Res>? get setting;
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
              as KeyboardSetting?,
      layouts: layouts == freezed
          ? _value.layouts
          : layouts // ignore: cast_nullable_to_non_nullable
              as List<KeyboardLayout>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KeyboardSetup implements _KeyboardSetup {
  const _$_KeyboardSetup({this.setting, this.layouts});

  factory _$_KeyboardSetup.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyboardSetupFromJson(json);

  @override
  final KeyboardSetting? setting;
  @override
  final List<KeyboardLayout>? layouts;

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
      {KeyboardSetting? setting,
      List<KeyboardLayout>? layouts}) = _$_KeyboardSetup;

  factory _KeyboardSetup.fromJson(Map<String, dynamic> json) =
      _$_KeyboardSetup.fromJson;

  @override
  KeyboardSetting? get setting => throw _privateConstructorUsedError;
  @override
  List<KeyboardLayout>? get layouts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyboardSetupCopyWith<_KeyboardSetup> get copyWith =>
      throw _privateConstructorUsedError;
}

IdentityData _$IdentityDataFromJson(Map<String, dynamic> json) {
  return _IdentityData.fromJson(json);
}

/// @nodoc
class _$IdentityDataTearOff {
  const _$IdentityDataTearOff();

  _IdentityData call(
      {String? realname,
      String? username,
      @JsonKey(name: 'crypted_password') String? cryptedPassword,
      String? hostname}) {
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
  String? get realname => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'crypted_password')
  String? get cryptedPassword => throw _privateConstructorUsedError;
  String? get hostname => throw _privateConstructorUsedError;

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
      {String? realname,
      String? username,
      @JsonKey(name: 'crypted_password') String? cryptedPassword,
      String? hostname});
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
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptedPassword: cryptedPassword == freezed
          ? _value.cryptedPassword
          : cryptedPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String? realname,
      String? username,
      @JsonKey(name: 'crypted_password') String? cryptedPassword,
      String? hostname});
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
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptedPassword: cryptedPassword == freezed
          ? _value.cryptedPassword
          : cryptedPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdentityData implements _IdentityData {
  const _$_IdentityData(
      {this.realname,
      this.username,
      @JsonKey(name: 'crypted_password') this.cryptedPassword,
      this.hostname});

  factory _$_IdentityData.fromJson(Map<String, dynamic> json) =>
      _$_$_IdentityDataFromJson(json);

  @override
  final String? realname;
  @override
  final String? username;
  @override
  @JsonKey(name: 'crypted_password')
  final String? cryptedPassword;
  @override
  final String? hostname;

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
      {String? realname,
      String? username,
      @JsonKey(name: 'crypted_password') String? cryptedPassword,
      String? hostname}) = _$_IdentityData;

  factory _IdentityData.fromJson(Map<String, dynamic> json) =
      _$_IdentityData.fromJson;

  @override
  String? get realname => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crypted_password')
  String? get cryptedPassword => throw _privateConstructorUsedError;
  @override
  String? get hostname => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IdentityDataCopyWith<_IdentityData> get copyWith =>
      throw _privateConstructorUsedError;
}

TimezoneData _$TimezoneDataFromJson(Map<String, dynamic> json) {
  return _TimezoneData.fromJson(json);
}

/// @nodoc
class _$TimezoneDataTearOff {
  const _$TimezoneDataTearOff();

  _TimezoneData call(
      {String? timezone, @JsonKey(name: 'from_geoip') bool? fromGeoIP}) {
    return _TimezoneData(
      timezone: timezone,
      fromGeoIP: fromGeoIP,
    );
  }

  TimezoneData fromJson(Map<String, Object> json) {
    return TimezoneData.fromJson(json);
  }
}

/// @nodoc
const $TimezoneData = _$TimezoneDataTearOff();

/// @nodoc
mixin _$TimezoneData {
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_geoip')
  bool? get fromGeoIP => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimezoneDataCopyWith<TimezoneData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimezoneDataCopyWith<$Res> {
  factory $TimezoneDataCopyWith(
          TimezoneData value, $Res Function(TimezoneData) then) =
      _$TimezoneDataCopyWithImpl<$Res>;
  $Res call({String? timezone, @JsonKey(name: 'from_geoip') bool? fromGeoIP});
}

/// @nodoc
class _$TimezoneDataCopyWithImpl<$Res> implements $TimezoneDataCopyWith<$Res> {
  _$TimezoneDataCopyWithImpl(this._value, this._then);

  final TimezoneData _value;
  // ignore: unused_field
  final $Res Function(TimezoneData) _then;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? fromGeoIP = freezed,
  }) {
    return _then(_value.copyWith(
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      fromGeoIP: fromGeoIP == freezed
          ? _value.fromGeoIP
          : fromGeoIP // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$TimezoneDataCopyWith<$Res>
    implements $TimezoneDataCopyWith<$Res> {
  factory _$TimezoneDataCopyWith(
          _TimezoneData value, $Res Function(_TimezoneData) then) =
      __$TimezoneDataCopyWithImpl<$Res>;
  @override
  $Res call({String? timezone, @JsonKey(name: 'from_geoip') bool? fromGeoIP});
}

/// @nodoc
class __$TimezoneDataCopyWithImpl<$Res> extends _$TimezoneDataCopyWithImpl<$Res>
    implements _$TimezoneDataCopyWith<$Res> {
  __$TimezoneDataCopyWithImpl(
      _TimezoneData _value, $Res Function(_TimezoneData) _then)
      : super(_value, (v) => _then(v as _TimezoneData));

  @override
  _TimezoneData get _value => super._value as _TimezoneData;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? fromGeoIP = freezed,
  }) {
    return _then(_TimezoneData(
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      fromGeoIP: fromGeoIP == freezed
          ? _value.fromGeoIP
          : fromGeoIP // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimezoneData implements _TimezoneData {
  const _$_TimezoneData(
      {this.timezone, @JsonKey(name: 'from_geoip') this.fromGeoIP});

  factory _$_TimezoneData.fromJson(Map<String, dynamic> json) =>
      _$_$_TimezoneDataFromJson(json);

  @override
  final String? timezone;
  @override
  @JsonKey(name: 'from_geoip')
  final bool? fromGeoIP;

  @override
  String toString() {
    return 'TimezoneData(timezone: $timezone, fromGeoIP: $fromGeoIP)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimezoneData &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.fromGeoIP, fromGeoIP) ||
                const DeepCollectionEquality()
                    .equals(other.fromGeoIP, fromGeoIP)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(fromGeoIP);

  @JsonKey(ignore: true)
  @override
  _$TimezoneDataCopyWith<_TimezoneData> get copyWith =>
      __$TimezoneDataCopyWithImpl<_TimezoneData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimezoneDataToJson(this);
  }
}

abstract class _TimezoneData implements TimezoneData {
  const factory _TimezoneData(
      {String? timezone,
      @JsonKey(name: 'from_geoip') bool? fromGeoIP}) = _$_TimezoneData;

  factory _TimezoneData.fromJson(Map<String, dynamic> json) =
      _$_TimezoneData.fromJson;

  @override
  String? get timezone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'from_geoip')
  bool? get fromGeoIP => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimezoneDataCopyWith<_TimezoneData> get copyWith =>
      throw _privateConstructorUsedError;
}

SSHData _$SSHDataFromJson(Map<String, dynamic> json) {
  return _SSHData.fromJson(json);
}

/// @nodoc
class _$SSHDataTearOff {
  const _$SSHDataTearOff();

  _SSHData call(
      {@JsonKey(name: 'install_server') bool? installServer,
      @JsonKey(name: 'allow_pw') bool? allowPw,
      @JsonKey(name: 'authorized_keys') List<dynamic>? authorizedKeys}) {
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
  @JsonKey(name: 'install_server')
  bool? get installServer => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_pw')
  bool? get allowPw => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorized_keys')
  List<dynamic>? get authorizedKeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SSHDataCopyWith<SSHData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SSHDataCopyWith<$Res> {
  factory $SSHDataCopyWith(SSHData value, $Res Function(SSHData) then) =
      _$SSHDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'install_server') bool? installServer,
      @JsonKey(name: 'allow_pw') bool? allowPw,
      @JsonKey(name: 'authorized_keys') List<dynamic>? authorizedKeys});
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
              as bool?,
      allowPw: allowPw == freezed
          ? _value.allowPw
          : allowPw // ignore: cast_nullable_to_non_nullable
              as bool?,
      authorizedKeys: authorizedKeys == freezed
          ? _value.authorizedKeys
          : authorizedKeys // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$SSHDataCopyWith<$Res> implements $SSHDataCopyWith<$Res> {
  factory _$SSHDataCopyWith(_SSHData value, $Res Function(_SSHData) then) =
      __$SSHDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'install_server') bool? installServer,
      @JsonKey(name: 'allow_pw') bool? allowPw,
      @JsonKey(name: 'authorized_keys') List<dynamic>? authorizedKeys});
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
              as bool?,
      allowPw: allowPw == freezed
          ? _value.allowPw
          : allowPw // ignore: cast_nullable_to_non_nullable
              as bool?,
      authorizedKeys: authorizedKeys == freezed
          ? _value.authorizedKeys
          : authorizedKeys // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SSHData implements _SSHData {
  const _$_SSHData(
      {@JsonKey(name: 'install_server') this.installServer,
      @JsonKey(name: 'allow_pw') this.allowPw,
      @JsonKey(name: 'authorized_keys') this.authorizedKeys});

  factory _$_SSHData.fromJson(Map<String, dynamic> json) =>
      _$_$_SSHDataFromJson(json);

  @override
  @JsonKey(name: 'install_server')
  final bool? installServer;
  @override
  @JsonKey(name: 'allow_pw')
  final bool? allowPw;
  @override
  @JsonKey(name: 'authorized_keys')
  final List<dynamic>? authorizedKeys;

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
          {@JsonKey(name: 'install_server') bool? installServer,
          @JsonKey(name: 'allow_pw') bool? allowPw,
          @JsonKey(name: 'authorized_keys') List<dynamic>? authorizedKeys}) =
      _$_SSHData;

  factory _SSHData.fromJson(Map<String, dynamic> json) = _$_SSHData.fromJson;

  @override
  @JsonKey(name: 'install_server')
  bool? get installServer => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'allow_pw')
  bool? get allowPw => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'authorized_keys')
  List<dynamic>? get authorizedKeys => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SSHDataCopyWith<_SSHData> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorReportRef _$ErrorReportRefFromJson(Map<String, dynamic> json) {
  return _ErrorReportRef.fromJson(json);
}

/// @nodoc
class _$ErrorReportRefTearOff {
  const _$ErrorReportRefTearOff();

  _ErrorReportRef call(
      {ErrorReportState? state,
      String? base,
      ErrorReportKind? kind,
      bool? seen,
      @JsonKey(name: 'oops_id') String? oopsId}) {
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
  ErrorReportState? get state => throw _privateConstructorUsedError;
  String? get base => throw _privateConstructorUsedError;
  ErrorReportKind? get kind => throw _privateConstructorUsedError;
  bool? get seen => throw _privateConstructorUsedError;
  @JsonKey(name: 'oops_id')
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
      {ErrorReportState? state,
      String? base,
      ErrorReportKind? kind,
      bool? seen,
      @JsonKey(name: 'oops_id') String? oopsId});
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
              as ErrorReportState?,
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as ErrorReportKind?,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {ErrorReportState? state,
      String? base,
      ErrorReportKind? kind,
      bool? seen,
      @JsonKey(name: 'oops_id') String? oopsId});
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
              as ErrorReportState?,
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as ErrorReportKind?,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {this.state,
      this.base,
      this.kind,
      this.seen,
      @JsonKey(name: 'oops_id') this.oopsId});

  factory _$_ErrorReportRef.fromJson(Map<String, dynamic> json) =>
      _$_$_ErrorReportRefFromJson(json);

  @override
  final ErrorReportState? state;
  @override
  final String? base;
  @override
  final ErrorReportKind? kind;
  @override
  final bool? seen;
  @override
  @JsonKey(name: 'oops_id')
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
      {ErrorReportState? state,
      String? base,
      ErrorReportKind? kind,
      bool? seen,
      @JsonKey(name: 'oops_id') String? oopsId}) = _$_ErrorReportRef;

  factory _ErrorReportRef.fromJson(Map<String, dynamic> json) =
      _$_ErrorReportRef.fromJson;

  @override
  ErrorReportState? get state => throw _privateConstructorUsedError;
  @override
  String? get base => throw _privateConstructorUsedError;
  @override
  ErrorReportKind? get kind => throw _privateConstructorUsedError;
  @override
  bool? get seen => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'oops_id')
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
      {ApplicationState? state,
      @JsonKey(name: 'confirming_tty') String? confirmingTty,
      ErrorReportRef? error,
      @JsonKey(name: 'cloud_init_ok') bool? cloudInitOk,
      bool? interactive,
      @JsonKey(name: 'echo_syslog_id') String? echoSyslogId,
      @JsonKey(name: 'log_syslog_id') String? logSyslogId,
      @JsonKey(name: 'event_syslog_id') String? eventSyslogId}) {
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
  ApplicationState? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirming_tty')
  String? get confirmingTty => throw _privateConstructorUsedError;
  ErrorReportRef? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloud_init_ok')
  bool? get cloudInitOk => throw _privateConstructorUsedError;
  bool? get interactive => throw _privateConstructorUsedError;
  @JsonKey(name: 'echo_syslog_id')
  String? get echoSyslogId => throw _privateConstructorUsedError;
  @JsonKey(name: 'log_syslog_id')
  String? get logSyslogId => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_syslog_id')
  String? get eventSyslogId => throw _privateConstructorUsedError;

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
      {ApplicationState? state,
      @JsonKey(name: 'confirming_tty') String? confirmingTty,
      ErrorReportRef? error,
      @JsonKey(name: 'cloud_init_ok') bool? cloudInitOk,
      bool? interactive,
      @JsonKey(name: 'echo_syslog_id') String? echoSyslogId,
      @JsonKey(name: 'log_syslog_id') String? logSyslogId,
      @JsonKey(name: 'event_syslog_id') String? eventSyslogId});

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
              as ApplicationState?,
      confirmingTty: confirmingTty == freezed
          ? _value.confirmingTty
          : confirmingTty // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
      logSyslogId: logSyslogId == freezed
          ? _value.logSyslogId
          : logSyslogId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventSyslogId: eventSyslogId == freezed
          ? _value.eventSyslogId
          : eventSyslogId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {ApplicationState? state,
      @JsonKey(name: 'confirming_tty') String? confirmingTty,
      ErrorReportRef? error,
      @JsonKey(name: 'cloud_init_ok') bool? cloudInitOk,
      bool? interactive,
      @JsonKey(name: 'echo_syslog_id') String? echoSyslogId,
      @JsonKey(name: 'log_syslog_id') String? logSyslogId,
      @JsonKey(name: 'event_syslog_id') String? eventSyslogId});

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
              as ApplicationState?,
      confirmingTty: confirmingTty == freezed
          ? _value.confirmingTty
          : confirmingTty // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
      logSyslogId: logSyslogId == freezed
          ? _value.logSyslogId
          : logSyslogId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventSyslogId: eventSyslogId == freezed
          ? _value.eventSyslogId
          : eventSyslogId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ApplicationStatus implements _ApplicationStatus {
  const _$_ApplicationStatus(
      {this.state,
      @JsonKey(name: 'confirming_tty') this.confirmingTty,
      this.error,
      @JsonKey(name: 'cloud_init_ok') this.cloudInitOk,
      this.interactive,
      @JsonKey(name: 'echo_syslog_id') this.echoSyslogId,
      @JsonKey(name: 'log_syslog_id') this.logSyslogId,
      @JsonKey(name: 'event_syslog_id') this.eventSyslogId});

  factory _$_ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      _$_$_ApplicationStatusFromJson(json);

  @override
  final ApplicationState? state;
  @override
  @JsonKey(name: 'confirming_tty')
  final String? confirmingTty;
  @override
  final ErrorReportRef? error;
  @override
  @JsonKey(name: 'cloud_init_ok')
  final bool? cloudInitOk;
  @override
  final bool? interactive;
  @override
  @JsonKey(name: 'echo_syslog_id')
  final String? echoSyslogId;
  @override
  @JsonKey(name: 'log_syslog_id')
  final String? logSyslogId;
  @override
  @JsonKey(name: 'event_syslog_id')
  final String? eventSyslogId;

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
          {ApplicationState? state,
          @JsonKey(name: 'confirming_tty') String? confirmingTty,
          ErrorReportRef? error,
          @JsonKey(name: 'cloud_init_ok') bool? cloudInitOk,
          bool? interactive,
          @JsonKey(name: 'echo_syslog_id') String? echoSyslogId,
          @JsonKey(name: 'log_syslog_id') String? logSyslogId,
          @JsonKey(name: 'event_syslog_id') String? eventSyslogId}) =
      _$_ApplicationStatus;

  factory _ApplicationStatus.fromJson(Map<String, dynamic> json) =
      _$_ApplicationStatus.fromJson;

  @override
  ApplicationState? get state => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'confirming_tty')
  String? get confirmingTty => throw _privateConstructorUsedError;
  @override
  ErrorReportRef? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cloud_init_ok')
  bool? get cloudInitOk => throw _privateConstructorUsedError;
  @override
  bool? get interactive => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'echo_syslog_id')
  String? get echoSyslogId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'log_syslog_id')
  String? get logSyslogId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'event_syslog_id')
  String? get eventSyslogId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationStatusCopyWith<_ApplicationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

Partition _$PartitionFromJson(Map<String, dynamic> json) {
  return _Partition.fromJson(json);
}

/// @nodoc
class _$PartitionTearOff {
  const _$PartitionTearOff();

  _Partition call({int? size, int? number, List<String>? annotations}) {
    return _Partition(
      size: size,
      number: number,
      annotations: annotations,
    );
  }

  Partition fromJson(Map<String, Object> json) {
    return Partition.fromJson(json);
  }
}

/// @nodoc
const $Partition = _$PartitionTearOff();

/// @nodoc
mixin _$Partition {
  int? get size => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  List<String>? get annotations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartitionCopyWith<Partition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartitionCopyWith<$Res> {
  factory $PartitionCopyWith(Partition value, $Res Function(Partition) then) =
      _$PartitionCopyWithImpl<$Res>;
  $Res call({int? size, int? number, List<String>? annotations});
}

/// @nodoc
class _$PartitionCopyWithImpl<$Res> implements $PartitionCopyWith<$Res> {
  _$PartitionCopyWithImpl(this._value, this._then);

  final Partition _value;
  // ignore: unused_field
  final $Res Function(Partition) _then;

  @override
  $Res call({
    Object? size = freezed,
    Object? number = freezed,
    Object? annotations = freezed,
  }) {
    return _then(_value.copyWith(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      annotations: annotations == freezed
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$PartitionCopyWith<$Res> implements $PartitionCopyWith<$Res> {
  factory _$PartitionCopyWith(
          _Partition value, $Res Function(_Partition) then) =
      __$PartitionCopyWithImpl<$Res>;
  @override
  $Res call({int? size, int? number, List<String>? annotations});
}

/// @nodoc
class __$PartitionCopyWithImpl<$Res> extends _$PartitionCopyWithImpl<$Res>
    implements _$PartitionCopyWith<$Res> {
  __$PartitionCopyWithImpl(_Partition _value, $Res Function(_Partition) _then)
      : super(_value, (v) => _then(v as _Partition));

  @override
  _Partition get _value => super._value as _Partition;

  @override
  $Res call({
    Object? size = freezed,
    Object? number = freezed,
    Object? annotations = freezed,
  }) {
    return _then(_Partition(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      annotations: annotations == freezed
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Partition implements _Partition {
  const _$_Partition({this.size, this.number, this.annotations});

  factory _$_Partition.fromJson(Map<String, dynamic> json) =>
      _$_$_PartitionFromJson(json);

  @override
  final int? size;
  @override
  final int? number;
  @override
  final List<String>? annotations;

  @override
  String toString() {
    return 'Partition(size: $size, number: $number, annotations: $annotations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Partition &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.annotations, annotations) ||
                const DeepCollectionEquality()
                    .equals(other.annotations, annotations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(annotations);

  @JsonKey(ignore: true)
  @override
  _$PartitionCopyWith<_Partition> get copyWith =>
      __$PartitionCopyWithImpl<_Partition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PartitionToJson(this);
  }
}

abstract class _Partition implements Partition {
  const factory _Partition(
      {int? size, int? number, List<String>? annotations}) = _$_Partition;

  factory _Partition.fromJson(Map<String, dynamic> json) =
      _$_Partition.fromJson;

  @override
  int? get size => throw _privateConstructorUsedError;
  @override
  int? get number => throw _privateConstructorUsedError;
  @override
  List<String>? get annotations => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PartitionCopyWith<_Partition> get copyWith =>
      throw _privateConstructorUsedError;
}

Disk _$DiskFromJson(Map<String, dynamic> json) {
  return _Disk.fromJson(json);
}

/// @nodoc
class _$DiskTearOff {
  const _$DiskTearOff();

  _Disk call(
      {String? id,
      String? label,
      String? type,
      int? size,
      @JsonKey(name: 'usage_labels') List<String>? usageLabels,
      List<Partition>? partitions,
      @JsonKey(name: 'ok_for_guided') bool? okForGuided}) {
    return _Disk(
      id: id,
      label: label,
      type: type,
      size: size,
      usageLabels: usageLabels,
      partitions: partitions,
      okForGuided: okForGuided,
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
  String? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'usage_labels')
  List<String>? get usageLabels => throw _privateConstructorUsedError;
  List<Partition>? get partitions => throw _privateConstructorUsedError;
  @JsonKey(name: 'ok_for_guided')
  bool? get okForGuided => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiskCopyWith<Disk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiskCopyWith<$Res> {
  factory $DiskCopyWith(Disk value, $Res Function(Disk) then) =
      _$DiskCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? label,
      String? type,
      int? size,
      @JsonKey(name: 'usage_labels') List<String>? usageLabels,
      List<Partition>? partitions,
      @JsonKey(name: 'ok_for_guided') bool? okForGuided});
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      usageLabels: usageLabels == freezed
          ? _value.usageLabels
          : usageLabels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      partitions: partitions == freezed
          ? _value.partitions
          : partitions // ignore: cast_nullable_to_non_nullable
              as List<Partition>?,
      okForGuided: okForGuided == freezed
          ? _value.okForGuided
          : okForGuided // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$DiskCopyWith<$Res> implements $DiskCopyWith<$Res> {
  factory _$DiskCopyWith(_Disk value, $Res Function(_Disk) then) =
      __$DiskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? label,
      String? type,
      int? size,
      @JsonKey(name: 'usage_labels') List<String>? usageLabels,
      List<Partition>? partitions,
      @JsonKey(name: 'ok_for_guided') bool? okForGuided});
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
  }) {
    return _then(_Disk(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      usageLabels: usageLabels == freezed
          ? _value.usageLabels
          : usageLabels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      partitions: partitions == freezed
          ? _value.partitions
          : partitions // ignore: cast_nullable_to_non_nullable
              as List<Partition>?,
      okForGuided: okForGuided == freezed
          ? _value.okForGuided
          : okForGuided // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Disk implements _Disk {
  const _$_Disk(
      {this.id,
      this.label,
      this.type,
      this.size,
      @JsonKey(name: 'usage_labels') this.usageLabels,
      this.partitions,
      @JsonKey(name: 'ok_for_guided') this.okForGuided});

  factory _$_Disk.fromJson(Map<String, dynamic> json) =>
      _$_$_DiskFromJson(json);

  @override
  final String? id;
  @override
  final String? label;
  @override
  final String? type;
  @override
  final int? size;
  @override
  @JsonKey(name: 'usage_labels')
  final List<String>? usageLabels;
  @override
  final List<Partition>? partitions;
  @override
  @JsonKey(name: 'ok_for_guided')
  final bool? okForGuided;

  @override
  String toString() {
    return 'Disk(id: $id, label: $label, type: $type, size: $size, usageLabels: $usageLabels, partitions: $partitions, okForGuided: $okForGuided)';
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
                    .equals(other.okForGuided, okForGuided)));
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
      const DeepCollectionEquality().hash(okForGuided);

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
      {String? id,
      String? label,
      String? type,
      int? size,
      @JsonKey(name: 'usage_labels') List<String>? usageLabels,
      List<Partition>? partitions,
      @JsonKey(name: 'ok_for_guided') bool? okForGuided}) = _$_Disk;

  factory _Disk.fromJson(Map<String, dynamic> json) = _$_Disk.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  int? get size => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'usage_labels')
  List<String>? get usageLabels => throw _privateConstructorUsedError;
  @override
  List<Partition>? get partitions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ok_for_guided')
  bool? get okForGuided => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'disk_id') String? diskId,
      @JsonKey(name: 'use_lvm') bool? useLvm,
      String? password}) {
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
  @JsonKey(name: 'disk_id')
  String? get diskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'use_lvm')
  bool? get useLvm => throw _privateConstructorUsedError;
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
  $Res call(
      {@JsonKey(name: 'disk_id') String? diskId,
      @JsonKey(name: 'use_lvm') bool? useLvm,
      String? password});
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
              as String?,
      useLvm: useLvm == freezed
          ? _value.useLvm
          : useLvm // ignore: cast_nullable_to_non_nullable
              as bool?,
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
  $Res call(
      {@JsonKey(name: 'disk_id') String? diskId,
      @JsonKey(name: 'use_lvm') bool? useLvm,
      String? password});
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
              as String?,
      useLvm: useLvm == freezed
          ? _value.useLvm
          : useLvm // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {@JsonKey(name: 'disk_id') this.diskId,
      @JsonKey(name: 'use_lvm') this.useLvm,
      this.password});

  factory _$_GuidedChoice.fromJson(Map<String, dynamic> json) =>
      _$_$_GuidedChoiceFromJson(json);

  @override
  @JsonKey(name: 'disk_id')
  final String? diskId;
  @override
  @JsonKey(name: 'use_lvm')
  final bool? useLvm;
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
      {@JsonKey(name: 'disk_id') String? diskId,
      @JsonKey(name: 'use_lvm') bool? useLvm,
      String? password}) = _$_GuidedChoice;

  factory _GuidedChoice.fromJson(Map<String, dynamic> json) =
      _$_GuidedChoice.fromJson;

  @override
  @JsonKey(name: 'disk_id')
  String? get diskId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'use_lvm')
  bool? get useLvm => throw _privateConstructorUsedError;
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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
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
  ProbeStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_report')
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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      List<Disk>? disks});

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
              as ProbeStatus?,
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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      List<Disk>? disks});

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
              as ProbeStatus?,
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
      {this.status,
      @JsonKey(name: 'error_report') this.errorReport,
      this.disks});

  factory _$_GuidedStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GuidedStorageResponseFromJson(json);

  @override
  final ProbeStatus? status;
  @override
  @JsonKey(name: 'error_report')
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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      List<Disk>? disks}) = _$_GuidedStorageResponse;

  factory _GuidedStorageResponse.fromJson(Map<String, dynamic> json) =
      _$_GuidedStorageResponse.fromJson;

  @override
  ProbeStatus? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'error_report')
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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      Bootloader? bootloader,
      @JsonKey(name: 'orig_config') List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd}) {
    return _StorageResponse(
      status: status,
      errorReport: errorReport,
      bootloader: bootloader,
      origConfig: origConfig,
      config: config,
      blockdev: blockdev,
      dasd: dasd,
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
  ProbeStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_report')
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  Bootloader? get bootloader => throw _privateConstructorUsedError;
  @JsonKey(name: 'orig_config')
  List<dynamic>? get origConfig => throw _privateConstructorUsedError;
  List<dynamic>? get config => throw _privateConstructorUsedError;
  Map<String, dynamic>? get blockdev => throw _privateConstructorUsedError;
  Map<String, dynamic>? get dasd => throw _privateConstructorUsedError;

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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      Bootloader? bootloader,
      @JsonKey(name: 'orig_config') List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd});

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
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus?,
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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      Bootloader? bootloader,
      @JsonKey(name: 'orig_config') List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd});

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
  }) {
    return _then(_StorageResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProbeStatus?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StorageResponse implements _StorageResponse {
  const _$_StorageResponse(
      {this.status,
      @JsonKey(name: 'error_report') this.errorReport,
      this.bootloader,
      @JsonKey(name: 'orig_config') this.origConfig,
      this.config,
      this.blockdev,
      this.dasd});

  factory _$_StorageResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_StorageResponseFromJson(json);

  @override
  final ProbeStatus? status;
  @override
  @JsonKey(name: 'error_report')
  final ErrorReportRef? errorReport;
  @override
  final Bootloader? bootloader;
  @override
  @JsonKey(name: 'orig_config')
  final List<dynamic>? origConfig;
  @override
  final List<dynamic>? config;
  @override
  final Map<String, dynamic>? blockdev;
  @override
  final Map<String, dynamic>? dasd;

  @override
  String toString() {
    return 'StorageResponse(status: $status, errorReport: $errorReport, bootloader: $bootloader, origConfig: $origConfig, config: $config, blockdev: $blockdev, dasd: $dasd)';
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
                const DeepCollectionEquality().equals(other.dasd, dasd)));
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
      const DeepCollectionEquality().hash(dasd);

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
      {ProbeStatus? status,
      @JsonKey(name: 'error_report') ErrorReportRef? errorReport,
      Bootloader? bootloader,
      @JsonKey(name: 'orig_config') List<dynamic>? origConfig,
      List<dynamic>? config,
      Map<String, dynamic>? blockdev,
      Map<String, dynamic>? dasd}) = _$_StorageResponse;

  factory _StorageResponse.fromJson(Map<String, dynamic> json) =
      _$_StorageResponse.fromJson;

  @override
  ProbeStatus? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'error_report')
  ErrorReportRef? get errorReport => throw _privateConstructorUsedError;
  @override
  Bootloader? get bootloader => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'orig_config')
  List<dynamic>? get origConfig => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get config => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get blockdev => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get dasd => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StorageResponseCopyWith<_StorageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
