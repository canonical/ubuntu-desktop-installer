part of 'advanced_setup_page.dart';

class _MountLocationFormField extends StatelessWidget {
  const _MountLocationFormField({required this.fieldWidth});

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

class _MountOptionFormField extends StatelessWidget {
  const _MountOptionFormField({required this.fieldWidth});

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

class _HostGenerationCheckButton extends StatelessWidget {
  const _HostGenerationCheckButton();

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

class _ResolvConfGenerationCheckButton extends StatelessWidget {
  const _ResolvConfGenerationCheckButton();

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
