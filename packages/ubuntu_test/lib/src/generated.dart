import 'package:mockito/annotations.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

export 'generated.mocks.dart';
export 'gsettings.mocks.dart';

@GenerateMocks([SubiquityClient, SubiquityServer])
class _Generated {} // ignore: unused_element
