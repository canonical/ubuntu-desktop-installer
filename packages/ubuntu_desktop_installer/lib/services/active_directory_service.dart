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
  Future<bool> isUsed();
  Future<void> setUsed(bool used);
  Future<AdConnectionInfo> getConnectionInfo();
  Future<void> setConnectionInfo(AdConnectionInfo info);
  Future<List<AdDomainNameValidation>> checkDomainName(String domain);
  Future<AdAdminNameValidation> checkAdminName(String admin);
  Future<AdPasswordValidation> checkPassword(String password);
  Future<AdDomainNameValidation> pingDomainController(String domain);
  Future<AdJoinResult> getJoinResult({bool wait = true});
}

class SubiquityActiveDirectoryService implements ActiveDirectoryService {
  SubiquityActiveDirectoryService(this._subiquity);

  final SubiquityClient _subiquity;
  bool? _used;

  @override
  Future<bool> hasSupport() {
    return _subiquity.hasActiveDirectorySupport();
  }

  @override
  Future<bool> isUsed() async {
    return _used ?? false;
  }

  @override
  Future<void> setUsed(bool used) async {
    _used = used;
    if (!used) {
      // the active directory endpoint is not optional so we need to explicitly
      // mark it as configured even if not used to avoid subiquity getting stuck
      // at waiting for it to be configured.
      _subiquity.markConfigured(['active_directory']);
    }
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
}

// TODO: implement realmd-based ActiveDirectoryService
class RealmdActiveDirectoryService implements ActiveDirectoryService {
  @override
  Future<bool> hasSupport() async => false;
  @override
  Future<bool> isUsed() async => false;
  @override
  Future<void> setUsed(bool used) async {}
  @override
  Future<AdConnectionInfo> getConnectionInfo() async =>
      const AdConnectionInfo();
  @override
  Future<void> setConnectionInfo(AdConnectionInfo info) async {}
  @override
  Future<List<AdDomainNameValidation>> checkDomainName(String domain) async =>
      [];
  @override
  Future<AdAdminNameValidation> checkAdminName(String admin) async =>
      AdAdminNameValidation.OK;
  @override
  Future<AdPasswordValidation> checkPassword(String password) async =>
      AdPasswordValidation.OK;
  @override
  Future<AdDomainNameValidation> pingDomainController(String domain) async =>
      AdDomainNameValidation.OK;
  @override
  Future<AdJoinResult> getJoinResult({bool wait = true}) async =>
      AdJoinResult.UNKNOWN;
}
