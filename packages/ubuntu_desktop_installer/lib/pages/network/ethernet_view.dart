import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'network_tile.dart';

class EthernetRadioButton extends ConsumerWidget {
  const EthernetRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ConnectMode? value;
  final ValueChanged<ConnectMode?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(NetworkPage.ethernetModelProvider);
    final lang = AppLocalizations.of(context);
    if (!model.isEnabled || model.devices.isEmpty) {
      return NetworkTile(
        leading: Icon(YaruIcons.window_close,
            color: Theme.of(context).colorScheme.error),
        title: model.devices.isEmpty
            ? Text(lang.noWiredConnection)
            : Text(lang.wiredDisabled),
      );
    }

    return YaruRadioButton<ConnectMode>(
      title: Text(lang.useWiredConnection),
      value: ConnectMode.ethernet,
      groupValue: value,
      onChanged: onChanged,
    );
  }
}

class EthernetView extends ConsumerWidget {
  const EthernetView({
    super.key,
    required this.expanded,
    required this.onEnabled,
  });

  final bool expanded;
  final VoidCallback onEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final model = ref.watch(NetworkPage.ethernetModelProvider);
    if (model.devices.isNotEmpty && !model.isEnabled) {
      return NetworkTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lang.wiredMustBeEnabled),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                model.enable();
                onEnabled();
              },
              child: Text(lang.enableWired),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
