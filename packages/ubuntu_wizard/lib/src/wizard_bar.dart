import 'package:flutter/material.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'wizard_data.dart';

/// The spacing between Continue and Back buttons.
const kWizardBarSpacing = 8.0;

class WizardBar extends StatefulWidget {
  const WizardBar({
    super.key,
    this.leading,
    this.trailing,
    this.padding = const EdgeInsets.fromLTRB(
        kYaruPagePadding, 0, kYaruPagePadding, kYaruPagePadding),
  });

  final Widget? leading;
  final List<Widget>? trailing;
  final EdgeInsetsGeometry padding;

  @override
  State<WizardBar> createState() => _WizardBarState();
}

class _WizardBarState extends State<WizardBar> {
  @override
  Widget build(BuildContext context) {
    final wizardScope = Wizard.maybeOf(context);
    final wizardData = wizardScope?.wizardData as WizardData?;
    final wizardRouteData = wizardScope?.routeData as WizardRouteData?;
    final totalSteps = wizardData?.totalSteps;
    final currentStep = wizardRouteData?.step;

    return Hero(
      tag: 'wizard-bottom-bar', // keep in place during page transitions
      child: Container(
        margin: widget.padding,
        constraints: BoxConstraints(maxHeight: kPushButtonSize.height),
        child: NavigationToolbar(
          leading: widget.leading,
          middle: currentStep != null && totalSteps != null
              ? YaruPageIndicator.builder(
                  page: currentStep,
                  length: totalSteps,
                  itemSizeBuilder: (index, selectedIndex, length) =>
                      Size.square(index == selectedIndex ? 12.0 : 8.0),
                  layoutDelegate:
                      YaruPageIndicatorSteppedDelegate(baseItemSpacing: 8),
                )
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.trailing?.withSpacing(kWizardBarSpacing) ?? [],
          ),
        ),
      ),
    );
  }
}

extension on Iterable<Widget> {
  List<Widget> withSpacing(double spacing) {
    return expand((item) sync* {
      yield SizedBox(width: spacing);
      yield item;
    }).skip(1).toList();
  }
}
