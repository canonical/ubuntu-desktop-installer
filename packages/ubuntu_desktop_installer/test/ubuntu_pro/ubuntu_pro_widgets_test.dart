import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/ubuntu_pro/ubuntu_pro_model.dart';
import 'package:ubuntu_desktop_installer/pages/ubuntu_pro/ubuntu_pro_widgets.dart';

import '../widget_tester_extensions.dart';
import 'ubuntu_pro_page_test.dart';

const invalidToken = 'token1234';
const validToken = 'token12345678901234567890';
final reverseToken = validToken.split('').reversed.join('');

void main() {
  testWidgets('token input', (tester) async {
    final model = buildModel();
    final focusNode = FocusNode();

    await tester.pumpWidget(tester.buildApp(
      (context) => ChangeNotifierProvider<UbuntuProModel>.value(
        value: model,
        child: Scaffold(
          body: TokenFormField(
            fieldWidth: 600,
            focusNode: focusNode,
          ),
        ),
      ),
    ));

    expect(focusNode.hasFocus, isFalse);
    await tester.tap(find.byType(TokenFormField));
    expect(focusNode.hasFocus, isTrue);

    await tester.enterText(find.byType(TokenFormField), invalidToken);
    await tester.pump();
    verify(model.token = invalidToken).called(1);
  });

  testWidgets('token status', (tester) async {
    UbuntuTester.context = Scaffold;

    final model = buildModel();
    late StateSetter setState;

    await tester.pumpWidget(tester.buildApp((context) {
      return ChangeNotifierProvider<UbuntuProModel>.value(
        value: model,
        child: Scaffold(
          body: StatefulBuilder(builder: (context, stateSetter) {
            setState = stateSetter;
            return TokenFormField(fieldWidth: 600);
          }),
        ),
      );
    }));
    await tester.pumpAndSettle();

    expect(find.text(tester.lang.ubuntuProTokenValid), findsNothing);
    expect(find.text(tester.lang.ubuntuProTokenInvalid), findsNothing);
    expect(find.text(tester.lang.ubuntuProTokenVerifying), findsNothing);

    setState(() {
      when(model.isAttached).thenReturn(true);
      when(model.token).thenReturn(validToken);
    });
    await tester.pumpAndSettle();

    expect(find.text(tester.lang.ubuntuProTokenValid), findsOneWidget);
    expect(find.text(tester.lang.ubuntuProTokenInvalid), findsNothing);
    expect(find.text(tester.lang.ubuntuProTokenVerifying), findsNothing);

    setState(() {
      when(model.hasError).thenReturn(true);
      when(model.token).thenReturn(reverseToken);
    });
    await tester.pumpAndSettle();

    expect(find.text(tester.lang.ubuntuProTokenValid), findsNothing);
    expect(find.text(tester.lang.ubuntuProTokenInvalid), findsOneWidget);
    expect(find.text(tester.lang.ubuntuProTokenVerifying), findsNothing);

    setState(() {
      when(model.isAttaching).thenReturn(true);
      when(model.token).thenReturn(validToken);
    });
    await tester.pump();

    expect(find.text(tester.lang.ubuntuProTokenValid), findsNothing);
    expect(find.text(tester.lang.ubuntuProTokenInvalid), findsNothing);
    expect(find.text(tester.lang.ubuntuProTokenVerifying), findsOneWidget);
  });
}
