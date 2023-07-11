import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'connect_model.dart';
import 'hidden_wifi_model.dart';
import 'network_l10n.dart';
import 'wifi_model.dart';

class HiddenWifiRadioButton extends ConsumerWidget {
  const HiddenWifiRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ConnectMode? value;
  final ValueChanged<ConnectMode?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(hiddenWifiModelProvider);
    if (!model.isEnabled || model.devices.isEmpty) {
      return const SizedBox.shrink();
    }

    final lang = NetworkLocalizations.of(context);
    return YaruRadioButton<ConnectMode>(
      title: Text(lang.networkHiddenWifiOption),
      contentPadding: const EdgeInsets.only(top: 8),
      value: ConnectMode.hiddenWifi,
      groupValue: value,
      onChanged: onChanged,
    );
  }
}

class HiddenWifiView extends ConsumerStatefulWidget {
  const HiddenWifiView({
    super.key,
    required this.expanded,
  });

  final bool expanded;

  @override
  ConsumerState<HiddenWifiView> createState() => _HiddenWifiViewState();
}

class _HiddenWifiViewState extends ConsumerState<HiddenWifiView> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HiddenWifiView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.expanded != widget.expanded) {
      if (widget.expanded) {
        _focusNode.requestFocus();
      } else {
        _focusNode.unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = NetworkLocalizations.of(context);
    final model = ref.watch(hiddenWifiModelProvider);
    if (!model.isEnabled || model.devices.isEmpty) {
      return const SizedBox.shrink();
    }

    return AnimatedExpanded(
      expanded: widget.expanded,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: kWizardWidthFraction,
          child: Padding(
            padding: kWizardIndentation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (model.devices.length > 1)
                  MenuButtonBuilder<WifiDevice>(
                    values: model.devices,
                    selected: model.selectedDevice,
                    onSelected: model.selectDevice,
                    itemBuilder: (context, device, child) {
                      return Text(device.model ?? device.interface);
                    },
                  ),
                if (model.devices.length > 1)
                  const SizedBox(height: kWizardSpacing),
                ValidatedFormField(
                  focusNode: _focusNode,
                  initialValue: model.ssid,
                  onChanged: model.setSsid,
                  validator: RequiredValidator(
                    errorText: lang.networkHiddenWifiNameRequired,
                  ),
                  labelText: lang.networkHiddenWifiNameLabel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
