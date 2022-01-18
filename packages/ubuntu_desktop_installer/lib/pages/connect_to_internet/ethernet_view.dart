import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_icons/yaru_icons.dart';

import '../../l10n.dart';
import 'connect_model.dart';
import 'ethernet_model.dart';
import 'network_tile.dart';

class EthernetRadioButton extends StatelessWidget {
  const EthernetRadioButton({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final ConnectMode? value;
  final ValueChanged<ConnectMode?> onChanged;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EthernetModel>(context);
    final lang = AppLocalizations.of(context);
    if (!model.isEnabled || model.devices.isEmpty) {
      return NetworkTile(
        leading:
            Icon(YaruIcons.window_close, color: Theme.of(context).errorColor),
        title: model.devices.isEmpty
            ? Text(lang.noWiredConnection)
            : Text(lang.wiredDisabled),
      );
    }

    return RadioButton<ConnectMode>(
      title: Text(lang.useWiredConnection),
      value: ConnectMode.ethernet,
      groupValue: value,
      onChanged: onChanged,
    );
  }
}

class EthernetView extends StatelessWidget {
  const EthernetView({
    Key? key,
    required this.expanded,
    required this.onEnabled,
  }) : super(key: key);

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
