import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/app_theme.dart';

import 'package:ubuntu_desktop_installer/pages/choose_your_look_page.dart';
import 'package:ubuntu_desktop_installer/widgets/option_card.dart';

import 'simple_navigator_observer.dart';

void main() {
  final themeSettings = GSettings(schemaId: 'org.gnome.desktop.interface');

  late SimpleNavigatorObserver observer;
  late MaterialApp app;
  late AppTheme appTheme;

  Future<void> setUpApp(WidgetTester tester) async {
    observer = SimpleNavigatorObserver();
    app = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale('en'),
      home: ChangeNotifierProvider(
        create: (_) {
          appTheme = AppTheme(themeSettings);
          return appTheme;
        },
        child: ChooseYourLookPage(),
      ),
      navigatorObservers: [observer],
    );
    await tester.pumpWidget(app);
    expect(observer.pushed.length, 1);
    expect(observer.pushed.first.settings.name, '/');
  }

  testWidgets('should toggle the theme', (tester) async {
    await setUpApp(tester);

    expect(find.byType(AppBar), findsNWidgets(1));
    expect(find.byType(Text), findsNWidgets(8));
    expect(find.byType(OptionCard), findsNWidgets(2));
    expect(find.byType(OutlinedButton), findsNWidgets(2));
    appTheme.apply(Brightness.light);
    expect(themeSettings.stringValue('gtk-theme'), 'Yaru');
    appTheme.apply(Brightness.dark);
    expect(themeSettings.stringValue('gtk-theme'), 'Yaru-dark');
  });
}
