import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'connect_model.dart';
import 'ethernet_model.dart';
import 'network_tile.dart';

class EthernetRadioButton extends StatelessWidget {
  const EthernetRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ConnectMode? value;
  final ValueChanged<ConnectMode?> onChanged;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EthernetModel>(context);
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

class EthernetView extends StatelessWidget {
  const EthernetView({
    super.key,
    required this.expanded,
    required this.onEnabled,
  });

  final bool expanded;
  final VoidCallback onEnabled;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = Provider.of<EthernetModel>(context);
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
