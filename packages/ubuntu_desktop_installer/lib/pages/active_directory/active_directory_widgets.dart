import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'active_directory_l10n.dart';
import 'active_directory_model.dart';

class DomainNameFormField extends StatelessWidget {
  const DomainNameFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final domainName = context.select((ActiveDirectoryModel m) => m.domainName);
    final validation =
        context.select((ActiveDirectoryModel m) => m.domainNameValidation);

    return ValidatedFormField(
      autofocus: true,
      fieldWidth: fieldWidth,
      labelText: lang.activeDirectoryDomainLabel,
      initialValue: domainName,
      successWidget: const SuccessIcon(),
      validator: CallbackValidator(
        (_) =>
            validation == null ||
            validation.singleOrNull == AdDomainNameValidation.OK,
        errorText: validation?.firstOrNull?.localize(lang) ?? '',
      ),
      onChanged: context.read<ActiveDirectoryModel>().setDomainName,
      onEditingComplete:
          context.read<ActiveDirectoryModel>().pingDomainController,
    );
  }
}

class AdminNameFormField extends StatelessWidget {
  const AdminNameFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final adminName = context.select((ActiveDirectoryModel m) => m.adminName);
    final validation =
        context.select((ActiveDirectoryModel m) => m.adminNameValidation);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.activeDirectoryAdminLabel,
      initialValue: adminName,
      successWidget: const SuccessIcon(),
      validator: CallbackValidator(
        (_) => validation == AdAdminNameValidation.OK,
        errorText: validation?.localize(lang) ?? '',
      ),
      onChanged: context.read<ActiveDirectoryModel>().setAdminName,
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final password = context.select((ActiveDirectoryModel m) => m.password);
    final validation =
        context.select((ActiveDirectoryModel m) => m.passwordValidation);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.activeDirectoryPasswordLabel,
      obscureText: true,
      initialValue: password,
      validator: CallbackValidator(
        (_) => validation == AdPasswordValidation.OK,
        errorText: validation?.localize(lang) ?? '',
      ),
      onChanged: context.read<ActiveDirectoryModel>().setPassword,
    );
  }
}
