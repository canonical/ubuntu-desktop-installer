import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'connect_model.dart';
import 'ethernet_model.dart';
import 'network_l10n.dart';
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
    final model = ref.watch(ethernetModelProvider);
    final lang = NetworkLocalizations.of(context);
    if (!model.isEnabled || model.devices.isEmpty) {
      return NetworkTile(
        leading: Icon(YaruIcons.window_close,
            color: Theme.of(context).colorScheme.error),
        title: model.devices.isEmpty
            ? Text(lang.networkWiredNone)
            : Text(lang.networkWiredOff),
      );
    }

    return YaruRadioButton<ConnectMode>(
      title: Text(lang.networkWiredOption),
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
    final lang = NetworkLocalizations.of(context);
    final model = ref.watch(ethernetModelProvider);
    if (model.devices.isNotEmpty && !model.isEnabled) {
      return NetworkTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lang.networkWiredDisabled),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                model.enable();
                onEnabled();
              },
              child: Text(lang.networkWiredEnable),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
