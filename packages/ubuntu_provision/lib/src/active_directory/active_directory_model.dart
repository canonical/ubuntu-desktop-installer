import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

final activeDirectoryModelProvider = ChangeNotifierProvider(
  (_) => ActiveDirectoryModel(getService<ActiveDirectoryService>()),
);

class ActiveDirectoryModel extends SafeChangeNotifier {
  ActiveDirectoryModel(this._service) {
    Listenable.merge([
      _domainName,
      _adminName,
      _password,
      _domainNameValidation,
      _adminNameValidation,
      _passwordValidation,
    ]).addListener(notifyListeners);
  }

  final ActiveDirectoryService _service;
  final _domainName = ValueNotifier<String?>(null);
  final _adminName = ValueNotifier<String?>(null);
  final _password = ValueNotifier<String?>(null);
  final _domainNameValidation =
      ValueNotifier<List<AdDomainNameValidation>?>(null);
  final _adminNameValidation = ValueNotifier<AdAdminNameValidation?>(null);
  final _passwordValidation = ValueNotifier<AdPasswordValidation?>(null);

  String get domainName => _domainName.value ?? '';
  bool get isDomainNameValid =>
      _domainNameValidation.value?.singleOrNull == AdDomainNameValidation.OK;
  List<AdDomainNameValidation>? get domainNameValidation =>
      _domainNameValidation.value;

  Future<void> setDomainName(String value) {
    _domainName.value = value;
    return validateDomainName();
  }

  Future<void> validateDomainName() {
    return _service
        .checkDomainName(domainName)
        .then((validation) => _domainNameValidation.value = validation);
  }

  Future<void> pingDomainController() async {
    return _service
        .pingDomainController(domainName)
        .then((validation) => _domainNameValidation.value = [validation]);
  }

  String get adminName => _adminName.value ?? '';
  bool get isAdminNameValid =>
      _adminNameValidation.value == AdAdminNameValidation.OK;
  AdAdminNameValidation? get adminNameValidation => _adminNameValidation.value;

  Future<void> setAdminName(String value) {
    _adminName.value = value;
    return validateAdminName();
  }

  Future<void> validateAdminName() {
    return _service
        .checkAdminName(adminName)
        .then((validation) => _adminNameValidation.value = validation);
  }

  String get password => _password.value ?? '';
  bool get isPasswordValid =>
      _passwordValidation.value == AdPasswordValidation.OK;
  AdPasswordValidation? get passwordValidation => _passwordValidation.value;

  Future<void> setPassword(String value) {
    _password.value = value;
    return validatePassword();
  }

  Future<void> validatePassword() {
    return _service
        .checkPassword(password)
        .then((validation) => _passwordValidation.value = validation);
  }

  bool get isValid => isDomainNameValid && isAdminNameValid && isPasswordValid;

  Future<bool> init() async {
    if (!await _service.isUsed()) {
      return false;
    }

    await _service.getConnectionInfo().then((info) {
      _domainName.value = info.domainName;
      _adminName.value = info.adminName;
      _password.value = info.password;
    }).then(
      (_) => Future.wait([
        validateDomainName(),
        validateAdminName(),
        validatePassword(),
      ]),
    );
    return true;
  }

  Future<void> save() {
    return _service.setConnectionInfo(AdConnectionInfo(
      domainName: domainName,
      adminName: adminName,
      password: password,
    ));
  }

  Future<AdJoinResult> getJoinResult() {
    return _service.getJoinResult();
  }
}
