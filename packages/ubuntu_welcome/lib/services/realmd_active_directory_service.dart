import 'package:ubuntu_provision/services.dart';

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
