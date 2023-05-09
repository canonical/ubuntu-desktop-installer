import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart'
    show
        AdConnectionInfo,
        AdAdminNameValidation,
        AdPasswordValidation,
        AdDomainNameValidation,
        AdJoinResult;

abstract class ActiveDirectoryService {
  Future<bool> hasSupport();
  Future<AdConnectionInfo> getConnectionInfo();
  Future<void> setConnectionInfo(AdConnectionInfo info);
  Future<List<AdDomainNameValidation>> checkDomainName(String domain);
  Future<AdAdminNameValidation> checkAdminName(String admin);
  Future<AdPasswordValidation> checkPassword(String password);
  Future<AdDomainNameValidation> pingDomainController(String domain);
  Future<AdJoinResult> getJoinResult({bool wait = true});
  Future<void> markConfigured();
}

class SubiquityActiveDirectoryService implements ActiveDirectoryService {
  const SubiquityActiveDirectoryService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<bool> hasSupport() {
    return _subiquity.hasActiveDirectorySupport();
  }

  @override
  Future<AdConnectionInfo> getConnectionInfo() {
    return _subiquity.getActiveDirectory();
  }

  @override
  Future<void> setConnectionInfo(AdConnectionInfo info) {
    return _subiquity.setActiveDirectory(info);
  }

  @override
  Future<List<AdDomainNameValidation>> checkDomainName(String domain) {
    return _subiquity.checkActiveDirectoryDomainName(domain);
  }

  @override
  Future<AdAdminNameValidation> checkAdminName(String admin) {
    return _subiquity.checkActiveDirectoryAdminName(admin);
  }

  @override
  Future<AdPasswordValidation> checkPassword(String password) {
    return _subiquity.checkActiveDirectoryPassword(password);
  }

  @override
  Future<AdDomainNameValidation> pingDomainController(String domain) {
    return _subiquity.pingActiveDirectoryDomainController(domain);
  }

  @override
  Future<AdJoinResult> getJoinResult({bool wait = true}) {
    return _subiquity.getActiveDirectoryJoinResult(wait: wait);
  }

  @override
  Future<void> markConfigured() {
    return _subiquity.markConfigured(['active_directory']);
  }
}
