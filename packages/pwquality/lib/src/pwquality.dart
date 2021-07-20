import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'bindings.g.dart';

/// The available errors.
abstract class PwQualityError {
  static const int fatalFailure = -1;
  static const int integer = -2;
  static const int configFileOpen = -3;
  static const int configFileMalformed = -4;
  static const int unknownSetting = -5;
  static const int nonIntSetting = -6;
  static const int nonStringSetting = -7;
  static const int memAlloc = -8;
  static const int tooSimilar = -9;
  static const int minDigits = -10;
  static const int minUppers = -11;
  static const int minLowers = -12;
  static const int minOthers = -13;
  static const int minLength = -14;
  static const int palindrome = -15;
  static const int caseChangesOnly = -16;
  static const int rotated = -17;
  static const int minClasses = -18;
  static const int maxConsecutive = -19;
  static const int emptyPassword = -20;
  static const int samePassword = -21;
  static const int cracklibCheck = -22;
  static const int rng = -23;
  static const int generationFailed = -24;
  static const int userCheck = -25;
  static const int gecosCheck = -26;
  static const int maxClassRepeat = -27;
  static const int badWords = -28;
  static const int maxSequance = -29;
}

/// An exception from [PwQuality].
@immutable
class PwQualityException implements Exception {
  /// Constructs an exception with the give [message] and [errorCode].
  const PwQualityException(this.errorCode, [this.message = '']);

  /// The error message.
  final String message;

  /// The error code.
  final int errorCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PwQualityException &&
            runtimeType == other.runtimeType &&
            errorCode == other.errorCode;
  }

  @override
  int get hashCode => runtimeType.hashCode ^ errorCode;

  @override
  String toString() => 'PwQualityException: $message ($errorCode)';
}

/// Password quality checking and generating random passwords.
class PwQuality {
  /// Constructs an instance. Remember to call [dispose()] when done.
  PwQuality() : _lib = LibPwQuality(DynamicLibrary.open('libpwquality.so.1')) {
    _pwq = _lib.pwquality_default_settings();
  }

  final LibPwQuality _lib;
  late final Pointer<pwquality_settings> _pwq;

  /// Initializes the password quality settings.
  bool initialize() {
    final err = calloc<Pointer<Void>>();
    final rv = _lib.pwquality_read_config(_pwq, nullptr, err);
    calloc.free(err);
    return rv >= PWQ_ERROR_SUCCESS;
  }

  void dispose() => _lib.pwquality_free_settings(_pwq);

  /// The minimum password length.
  int get minLength {
    final ptr = calloc<Int32>();
    final rv = _lib.pwquality_get_int_value(_pwq, PWQ_SETTING_MIN_LENGTH, ptr);
    final value = ptr.value;
    calloc.free(ptr);
    _checkReturnValue(rv);
    return value;
  }

  set minLength(int value) {
    final rv =
        _lib.pwquality_set_int_value(_pwq, PWQ_SETTING_MIN_LENGTH, value);
    _checkReturnValue(rv);
  }

  /// Sets the maximum password sequence.
  void setMaxSequence(int value) {
    _lib.pwquality_set_int_value(_pwq, PWQ_SETTING_MAX_SEQUENCE, value);
  }

  void _checkReturnValue(int rv) {
    if (rv >= PWQ_ERROR_SUCCESS) return;
    final err = _lib.pwquality_strerror(nullptr, 0, rv, nullptr);
    throw PwQualityException(rv, err.cast<Utf8>().toDartString());
  }

  /// Generates a random password.
  String generate() {
    final cstr = calloc<Pointer<Int8>>();
    final rv = _lib.pwquality_generate(_pwq, 0, cstr);
    final password = cstr.value.cast<Utf8>().toDartString();
    _checkReturnValue(rv);
    return password;
  }

  /// Checks the quality of the given password and returns a score <1-100>.
  int qualityCheck(String password, {String? oldPassword, String? username}) {
    final cpwd = password.toNativeUtf8().cast<Int8>();
    final cold = oldPassword?.toNativeUtf8().cast<Int8>() ?? nullptr;
    final cusr = username?.toNativeUtf8().cast<Int8>() ?? nullptr;
    final rv = _lib.pwquality_check(_pwq, cpwd, cold, cusr, nullptr);
    malloc.free(cpwd);
    malloc.free(cold);
    malloc.free(cusr);
    _checkReturnValue(rv);
    return rv;
  }
}
