import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:yaru/yaru.dart';

void main() {
  const animationContent = 'Animation';
  const mainContent = 'Main content';
  const kDuration = Duration(milliseconds: 32);
  const kAnimation = Text(animationContent);
  const kChild = Text(mainContent);

  MaterialApp buildApp({Widget? Function(BuildContext)? builder}) =>
      MaterialApp(
        theme: yaruLight,
        home: SplashScreen(
          animationDuration: kDuration,
          transitionDuration: kDuration,
          animation: kAnimation,
          builder: builder ?? (_) => kChild,
        ),
      );

  testWidgets('wont change before duration', (tester) async {
    final app = buildApp();
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(
      Duration(milliseconds: (kDuration.inMilliseconds / 2).round()),
    );
    expect(find.byWidget(kAnimation), findsOneWidget);
    expect(find.byWidget(kChild), findsNothing);

    await tester.pumpAndSettle(kDuration);
    expect(find.byWidget(kChild), findsOneWidget);
  });
  testWidgets('animation kept on null', (tester) async {
    final app = buildApp(builder: (_) => null);
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(kDuration);
    expect(find.byWidget(kAnimation), findsOneWidget);
    expect(find.byWidget(kChild), findsNothing);
  });
  testWidgets('correct transition with default widget', (tester) async {
    final runOnce = ValueNotifier<bool>(false);

    final app = MaterialApp(
      home: ValueListenableBuilder<bool>(
        valueListenable: runOnce,
        builder: (context, value, _) => SplashScreen(
          animationDuration: kDuration,
          transitionDuration: kDuration,
          builder: (BuildContext context) {
            if (value) {
              return kChild;
            }
            return null;
          },
        ),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(kDuration);
    expect(find.byType(DefaultSplashWidget), findsOneWidget);
    expect(find.byWidget(kChild), findsNothing);
    runOnce.value = true;
    await tester.pumpAndSettle();
    expect(find.byWidget(kChild), findsOneWidget);
  });
}
