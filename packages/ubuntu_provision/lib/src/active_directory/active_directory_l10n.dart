import 'package:flutter/widgets.dart';
import 'package:ubuntu_provision/l10n.dart';
import 'package:ubuntu_provision/services.dart';

abstract class ActiveDirectoryLocalizations
    extends UbuntuProvisionLocalizations {
  ActiveDirectoryLocalizations(super.locale);

  static UbuntuProvisionLocalizations of(BuildContext context) {
    return Localizations.of<UbuntuProvisionLocalizations>(
        context, UbuntuProvisionLocalizations)!;
  }
}

extension AdDomainNameValidationL10n on AdDomainNameValidation {
  String localize(BuildContext context) {
    final lang = ActiveDirectoryLocalizations.of(context);
    switch (this) {
      case AdDomainNameValidation.OK:
        return '';
      case AdDomainNameValidation.EMPTY:
        return lang.activeDirectoryDomainEmpty;
      case AdDomainNameValidation.TOO_LONG:
        return lang.activeDirectoryDomainTooLong;
      case AdDomainNameValidation.INVALID_CHARS:
        return lang.activeDirectoryDomainInvalidChars;
      case AdDomainNameValidation.START_DOT:
        return lang.activeDirectoryDomainStartDot;
      case AdDomainNameValidation.END_DOT:
        return lang.activeDirectoryDomainEndDot;
      case AdDomainNameValidation.START_HYPHEN:
        return lang.activeDirectoryDomainStartHyphen;
      case AdDomainNameValidation.END_HYPHEN:
        return lang.activeDirectoryDomainEndHyphen;
      case AdDomainNameValidation.MULTIPLE_DOTS:
        return lang.activeDirectoryDomainMultipleDots;
      case AdDomainNameValidation.REALM_NOT_FOUND:
        return lang.activeDirectoryDomainNotFound;
    }
  }
}

extension AdAdminNameValidationL10n on AdAdminNameValidation {
  String localize(BuildContext context) {
    final lang = ActiveDirectoryLocalizations.of(context);
    switch (this) {
      case AdAdminNameValidation.OK:
        return '';
      case AdAdminNameValidation.EMPTY:
        return lang.activeDirectoryAdminEmpty;
      case AdAdminNameValidation.INVALID_CHARS:
        return lang.activeDirectoryAdminInvalidChars;
    }
  }
}

extension AdPasswordValidationL10n on AdPasswordValidation {
  String localize(BuildContext context) {
    final lang = ActiveDirectoryLocalizations.of(context);
    switch (this) {
      case AdPasswordValidation.OK:
        return '';
      case AdPasswordValidation.EMPTY:
        return lang.activeDirectoryPasswordEmpty;
    }
  }
}
