import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/app.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';

void main() {
  testWidgets('create an app instance', (tester) async {
    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'en');
    when(client.wslSetupOptions()).thenAnswer(
      (_) async => const WSLSetupOptions(installLanguageSupportPackages: false),
    );
    registerMockService<SubiquityClient>(client);
    registerService(LanguageFallbackService.linux);

    await tester.pumpWidget(
      Provider<AppModel>(
          create: (_) => const AppModel(variant: Variant.WSL_SETUP),
          child: const UbuntuWslSetupApp()),
    );

    expect(find.byType(Wizard), findsOneWidget);
  });
}
