import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../l10n.dart';

extension TaskL10n on Task {
  String localize(BuildContext context, String snap) {
    final lang = AppLocalizations.of(context);
    switch (kind) {
      case 'refresh-snap':
        return lang.snapRefresh(snap);
      case 'check-rerefresh':
        return lang.snapCheckRerefresh(snap);
      case 'prerequisites':
        return lang.snapPrerequisites(snap);
      case 'prepare-snap':
        return lang.snapPrepare(snap);
      case 'download-snap':
        return lang.snapDownload(snap);
      case 'validate-snap':
        return lang.snapValidate(snap);
      case 'mount-snap':
        return lang.snapMount(snap);
      case 'stop-snap-services':
        return lang.snapStopServices(snap);
      case 'remove-aliases':
        return lang.snapRemoveAliases(snap);
      case 'unlink-current-snap':
        return lang.snapUnlink(snap);
      case 'update-gadget-assets':
        return lang.snapUpdateAssets(snap);
      case 'update-gadget-cmdline':
        return lang.snapUpdateKernelCommandLine(snap);
      case 'copy-snap-data':
        return lang.snapCopyData(snap);
      case 'setup-profiles':
        return lang.snapSetupProfiles(snap);
      case 'link-snap':
        return lang.snapLink(snap);
      case 'auto-connect':
        return lang.snapAutoConnect(snap);
      case 'set-auto-aliases':
        return lang.snapSetAutoAliases(snap);
      case 'setup-aliases':
        return lang.snapSetupAliases(snap);
      case 'start-snap-services':
        return lang.snapStartServices(snap);
      case 'cleanup':
        return lang.snapCleanup(snap);
      default:
        return kind;
    }
  }
}
