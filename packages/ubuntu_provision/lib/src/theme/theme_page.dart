import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'theme_l10n.dart';
import 'theme_model.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(themeModelProvider).init();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ThemeLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final model = ref.watch(themeModelProvider);
    final yaru = YaruTheme.maybeOf(context);
    return WizardPage(
      header: Text(lang.themePageHeader),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(context),
        ],
      ),
      title: YaruWindowTitleBar(
        title: Text(lang.themePageTitle),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ThemeOptionCard(
                width: width / 3,
                assetName: 'assets/theme/light-theme.png',
                selected: Theme.of(context).brightness == Brightness.light,
                onTap: () => model.setBrightness(Brightness.light),
                preferenceName: lang.themeLight,
              ),
              SizedBox(
                width: width / 20,
              ),
              _ThemeOptionCard(
                width: width / 3,
                assetName: 'assets/theme/dark-theme.png',
                selected: Theme.of(context).brightness == Brightness.dark,
                onTap: () => model.setBrightness(Brightness.dark),
                preferenceName: lang.themeDark,
              ),
            ],
          ),
          if (yaru != null)
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: kWizardSpacing * 2),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final variant in YaruVariant.accents)
                      YaruColorDisk(
                        color: variant.color,
                        selected: variant == yaru.variant,
                        onPressed: () => model.setAccent(variant.name),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  const _ThemeOptionCard({
    required this.width,
    required this.assetName,
    required this.selected,
    required this.onTap,
    required this.preferenceName,
  });

  final double width;
  final String assetName;
  final bool selected;
  final Function() onTap;
  final String preferenceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          child: YaruSelectableContainer(
            selected: selected,
            padding: EdgeInsets.zero,
            onTap: onTap,
            child: IntrinsicHeight(
              child: YaruBanner(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(assetName, package: 'ubuntu_provision'),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(preferenceName,
              style: Theme.of(context).textTheme.titleLarge),
        )
      ],
    );
  }
}
