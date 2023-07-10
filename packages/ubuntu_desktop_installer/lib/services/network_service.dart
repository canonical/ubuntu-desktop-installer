import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_provision/services.dart';

export 'package:nm/nm.dart';

class SubiquityNetworkService extends NetworkService {
  SubiquityNetworkService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<void> markConfigured() => _subiquity.markConfigured(['network']);
}
