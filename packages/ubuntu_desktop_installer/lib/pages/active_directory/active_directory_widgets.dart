import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'active_directory_l10n.dart';
import 'active_directory_model.dart';

class DomainNameFormField extends ConsumerWidget {
  const DomainNameFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final domainName =
        ref.watch(activeDirectoryModelProvider.select((m) => m.domainName));
    final validation = ref.watch(
        activeDirectoryModelProvider.select((m) => m.domainNameValidation));

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
        errorText: validation?.firstOrNull?.localize(context) ?? '',
      ),
      onChanged: ref.read(activeDirectoryModelProvider).setDomainName,
      onEditingComplete:
          ref.read(activeDirectoryModelProvider).pingDomainController,
    );
  }
}

class AdminNameFormField extends ConsumerWidget {
  const AdminNameFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final adminName =
        ref.read(activeDirectoryModelProvider.select((m) => m.adminName));
    final validation = ref.watch(
        activeDirectoryModelProvider.select((m) => m.adminNameValidation));

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.activeDirectoryAdminLabel,
      initialValue: adminName,
      successWidget: const SuccessIcon(),
      validator: CallbackValidator(
        (_) => validation == AdAdminNameValidation.OK,
        errorText: validation?.localize(context) ?? '',
      ),
      onChanged: ref.read(activeDirectoryModelProvider).setAdminName,
    );
  }
}

class PasswordFormField extends ConsumerWidget {
  const PasswordFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final password =
        ref.watch(activeDirectoryModelProvider.select((m) => m.password));
    final validation = ref.watch(
        activeDirectoryModelProvider.select((m) => m.passwordValidation));

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.activeDirectoryPasswordLabel,
      obscureText: true,
      initialValue: password,
      validator: CallbackValidator(
        (_) => validation == AdPasswordValidation.OK,
        errorText: validation?.localize(context) ?? '',
      ),
      onChanged: ref.read(activeDirectoryModelProvider).setPassword,
    );
  }
}
