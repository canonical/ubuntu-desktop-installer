import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_widgets/widgets.dart';

import 'wizard_action.dart';

export 'package:wizard_router/wizard_router.dart';
export 'wizard_action.dart';

class WizardBar extends StatefulWidget {
  const WizardBar({
    super.key,
    this.leading,
    this.trailing,
    this.padding = kFooterPadding,
  });

  final WizardAction? leading;
  final List<WizardAction>? trailing;
  final EdgeInsetsGeometry padding;

  @override
  State<WizardBar> createState() => _WizardBarState();
}

class _WizardBarState extends State<WizardBar> {
  @override
  Widget build(BuildContext context) {
    final wizardScope = Wizard.maybeOf(context);
    final totalSteps = (wizardScope?.wizardData as int?);
    final currentStep = (wizardScope?.routeData as int?);

    return Hero(
      tag: 'wizard-bottom-bar', // keep in place during page transitions
      child: Container(
        margin: widget.padding,
        constraints:
            const BoxConstraints(maxHeight: 36), // TODO: kYaruButtonHeight
        child: NavigationToolbar(
          leading: _buildAction(context, widget.leading),
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
            children: widget.trailing
                    ?.map((action) => _buildAction(context, action))
                    .whereNotNull()
                    .withSpacing(kButtonBarSpacing) ??
                [],
          ),
        ),
      ),
    );
  }

  Widget? _buildAction(BuildContext context, WizardAction? action) {
    if (action == null || action.visible == false) {
      return null;
    }

    final maybeActivate = action.enabled ?? true
        ? () async {
            await action.onActivated?.call();
            if (mounted) action.execute?.call();
          }
        : null;

    final child = Text(action.label!);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 136),
      child: action.highlighted == true
          ? ElevatedButton(onPressed: maybeActivate, child: child)
          : action.flat == true
              ? OutlinedButton(onPressed: maybeActivate, child: child)
              : FilledButton(onPressed: maybeActivate, child: child),
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
