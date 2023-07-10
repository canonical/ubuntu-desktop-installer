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
