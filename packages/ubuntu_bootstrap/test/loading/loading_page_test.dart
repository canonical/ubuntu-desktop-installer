import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/loading/loading_page.dart';

import 'test_loading.dart';

void main() {
  testWidgets('init & advance', (tester) async {
    final model = buildLoadingModel(delay: const Duration(seconds: 3));
    await tester.pumpWidget(tester.buildApp((_) => buildLoadingPage(model)));

    verify(model.init()).called(1);
    expect(find.byType(LoadingPage), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(LoadingPage), findsNothing);
  });
}
