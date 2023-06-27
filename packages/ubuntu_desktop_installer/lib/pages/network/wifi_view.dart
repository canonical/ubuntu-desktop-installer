import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'connect_model.dart';
import 'network_tile.dart';
import 'wifi_model.dart';

typedef OnWifiSelected = void Function(
  WifiDevice device,
  AccessPoint accessPoint,
);

class WifiRadioButton extends ConsumerWidget {
  const WifiRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ConnectMode? value;
  final ValueChanged<ConnectMode?>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(wifiModelProvider);
    final lang = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: !model.isEnabled || model.devices.isEmpty
          ? NetworkTile(
              leading: Icon(YaruIcons.window_close,
                  color: Theme.of(context).colorScheme.error),
              title: !model.isEnabled
                  ? Text(lang.wirelessNetworkingDisabled)
                  : Text(lang.noWifiDevicesDetected),
            )
          : YaruRadioButton<ConnectMode>(
              title: Text(lang.selectWifiNetwork),
              value: ConnectMode.wifi,
              groupValue: value,
              onChanged: onChanged,
            ),
    );
  }
}

class WifiView extends ConsumerStatefulWidget {
  const WifiView({
    super.key,
    required this.expanded,
    required this.onEnabled,
    required this.onSelected,
  });

  final bool expanded;
  final VoidCallback onEnabled;
  final OnWifiSelected onSelected;

  @override
  ConsumerState<WifiView> createState() => _WifiViewState();
}

class _WifiViewState extends ConsumerState<WifiView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wifiModelProvider).startPeriodicScanning();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = ref.watch(wifiModelProvider);
    if (!model.isEnabled) {
      return NetworkTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lang.wifiMustBeEnabled),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                model.enable();
                widget.onEnabled();
              },
              child: Text(lang.enableWifi),
            ),
          ],
        ),
      );
    }
    if (model.devices.isEmpty) return const SizedBox.shrink();

    return AnimatedExpanded(
      expanded: widget.expanded,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: kWizardWidthFraction,
        child: Padding(
          padding: kWizardIndentation,
          child: WifiListView(onSelected: widget.onSelected),
        ),
      ),
    );
  }
}

class WifiListView extends ConsumerWidget {
  const WifiListView({
    super.key,
    required this.onSelected,
  });

  final OnWifiSelected onSelected;
  static final wifiDeviceProvider =
      Provider<WifiDevice>((_) => throw UnimplementedError());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(wifiModelProvider);

    return YaruBorderContainer(
      clipBehavior: Clip.antiAlias,
      child: OverrideMouseCursor(
        cursor: SystemMouseCursors.basic,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.devices.length,
          itemBuilder: (context, index) {
            return ProviderScope(
              overrides: [
                wifiDeviceProvider.overrideWithValue(model.devices[index]),
              ],
              child: WifiListTile(
                key: ValueKey(index),
                selected: model.isSelectedDevice(model.devices[index]),
                onSelected: (device, accessPoint) {
                  model.selectDevice(device);
                  onSelected(device, accessPoint);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class WifiListTile extends ConsumerWidget {
  const WifiListTile({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final bool selected;
  final OnWifiSelected onSelected;

  static final accessPointProvider =
      Provider<AccessPoint>((_) => throw UnimplementedError());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = ref.watch(WifiListView.wifiDeviceProvider);
    final textColor = Theme.of(context).textTheme.titleMedium!.color;
    final iconSize = IconTheme.of(context).size;
    return ExpansionTile(
      initiallyExpanded: true,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(device.model ?? device.interface),
      textColor: textColor,
      iconColor: textColor,
      trailing: device.isConnecting
          ? SizedBox(
              width: iconSize,
              height: iconSize,
              child: const YaruCircularProgressIndicator(strokeWidth: 3),
            )
          : null,
      children: <Widget>[
        for (final accessPoint in device.accessPoints)
          ProviderScope(
            overrides: [accessPointProvider.overrideWithValue(accessPoint)],
            child: ListTile(
              key: ValueKey(accessPoint.name),
              title: Text(accessPoint.name),
              leading:
                  device.isActive && device.isActiveAccessPoint(accessPoint)
                      ? const Icon(YaruIcons.ok_simple)
                      : const SizedBox.shrink(),
              selected: selected && device.isSelectedAccessPoint(accessPoint),
              trailing: SizedBox(
                width: iconSize,
                height: iconSize,
                child: Icon(_wifiIcon(accessPoint)),
              ),
              onTap: () {
                device.selectAccessPoint(accessPoint);
                onSelected(device, accessPoint);
              },
            ),
          ),
      ],
    );
  }
}

IconData _wifiIcon(AccessPoint model) {
  final strength = (model.strength ~/ 20 + 1).clamp(1, 5);
  return model.isOpen ? _wifiIconOpen(strength) : _wifiIconLock(strength);
}

IconData _wifiIconOpen(int strength) {
  const icons = <int, IconData>{
    1: YaruIcons.network_wireless_signal_none,
    2: YaruIcons.network_wireless_signal_weak,
    3: YaruIcons.network_wireless_signal_ok,
    4: YaruIcons.network_wireless_signal_good,
    5: YaruIcons.network_wireless_signal_excellent,
  };
  return icons[strength]!;
}

IconData _wifiIconLock(int strength) {
  const icons = <int, IconData>{
    1: YaruIcons.network_wireless_signal_none_secure,
    2: YaruIcons.network_wireless_signal_weak_secure,
    3: YaruIcons.network_wireless_signal_ok_secure,
    4: YaruIcons.network_wireless_signal_good_secure,
    5: YaruIcons.network_wireless_signal_excellent_secure,
  };
  return icons[strength]!;
}
