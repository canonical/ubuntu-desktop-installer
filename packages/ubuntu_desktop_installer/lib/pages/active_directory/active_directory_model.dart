import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

class ActiveDirectoryModel extends SafeChangeNotifier {
  ActiveDirectoryModel(this._client) {
    Listenable.merge([
      _domainName,
      _adminName,
      _password,
      _domainNameValidation,
      _adminNameValidation,
      _passwordValidation,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
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
    return _client
        .checkActiveDirectoryDomainName(domainName)
        .then((validation) => _domainNameValidation.value = validation);
  }

  Future<void> pingDomainController() async {
    return _client
        .pingActiveDirectoryDomainController(domainName)
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
    return _client
        .checkActiveDirectoryAdminName(adminName)
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
    return _client
        .checkActiveDirectoryPassword(password)
        .then((validation) => _passwordValidation.value = validation);
  }

  bool get isValid => isDomainNameValid && isAdminNameValid && isPasswordValid;

  Future<void> init() {
    return _client.getActiveDirectory().then((info) {
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
  }

  Future<void> save() {
    return _client.setActiveDirectory(AdConnectionInfo(
      domainName: domainName,
      adminName: adminName,
      password: password,
    ));
  }
}
