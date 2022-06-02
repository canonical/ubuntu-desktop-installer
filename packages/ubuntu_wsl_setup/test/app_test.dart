import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/app.dart';

void main() {
  testWidgets('create an app instance', (tester) async {
    final client = MockSubiquityClient();
    when(client.locale()).thenAnswer((_) async => 'en');
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(
      const UbuntuWslSetupApp(variant: Variant.WSL_SETUP),
    );

    expect(find.byType(Wizard), findsOneWidget);
  });
}
