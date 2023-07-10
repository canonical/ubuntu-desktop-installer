import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_provision/services.dart';

final log = Logger('ad');

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
  Future<AdJoinResult> getJoinResult({bool wait = true}) async {
    try {
      return await _subiquity.getActiveDirectoryJoinResult(wait: wait);
    } catch (e) {
      log.error(e);
      return AdJoinResult.UNKNOWN;
    }
  }
}
