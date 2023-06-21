import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'advanced_setup_model.dart';

class MountLocationFormField extends StatelessWidget {
  const MountLocationFormField({super.key, required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final mountLocation = context
        .select<AdvancedSetupModel, String>((model) => model.mountLocation);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.advancedSetupMountLocationHint,
      helperText: lang.advancedSetupMountLocationHelper,
      initialValue: mountLocation,
      validator: CallbackValidator(
        AdvancedSetupModel.isValidMountLocation,
        errorText: lang.advancedSetupMountLocationInvalid,
      ),
      onChanged: (value) {
        final model = Provider.of<AdvancedSetupModel>(context, listen: false);
        model.mountLocation = value;
      },
    );
  }
}

class MountOptionFormField extends StatelessWidget {
  const MountOptionFormField({super.key, required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final mountOption = context
        .select<AdvancedSetupModel, String>((model) => model.mountOption);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.advancedSetupMountOptionHint,
      helperText: lang.advancedSetupMountOptionHelper,
      initialValue: mountOption,
      onChanged: (value) {
        final model = Provider.of<AdvancedSetupModel>(context, listen: false);
        model.mountOption = value;
      },
    );
  }
}

class HostGenerationCheckButton extends StatelessWidget {
  const HostGenerationCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final enableHostGeneration = context.select<AdvancedSetupModel, bool>(
        (model) => model.enableHostGeneration);

    return Align(
      alignment: Alignment.topLeft,
      child: IntrinsicWidth(
        child: YaruCheckButton(
          contentPadding: kContentPadding,
          title: Text(lang.advancedSetupHostGenerationTitle),
          subtitle: Text(lang.advancedSetupHostGenerationSubtitle),
          value: enableHostGeneration,
          onChanged: (value) {
            final model =
                Provider.of<AdvancedSetupModel>(context, listen: false);
            model.enableHostGeneration = value!;
          },
        ),
      ),
    );
  }
}

class ResolvConfGenerationCheckButton extends StatelessWidget {
  const ResolvConfGenerationCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final enableResolvConfGeneration = context.select<AdvancedSetupModel, bool>(
        (model) => model.enableResolvConfGeneration);

    return Align(
      alignment: Alignment.topLeft,
      child: IntrinsicWidth(
        child: YaruCheckButton(
          contentPadding: kContentPadding,
          title: Text(lang.advancedSetupResolvConfGenerationTitle),
          subtitle: Text(lang.advancedSetupResolvConfGenerationSubtitle),
          value: enableResolvConfGeneration,
          onChanged: (value) {
            final model =
                Provider.of<AdvancedSetupModel>(context, listen: false);
            model.enableResolvConfGeneration = value!;
          },
        ),
      ),
    );
  }
}
