import 'package:mockito/annotations.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

export 'generated.mocks.dart';

@GenerateMocks([
  SubiquityClient,
  SubiquityServer,
  SubiquityStatusMonitor,
])
class _Generated {} // ignore: unused_element
