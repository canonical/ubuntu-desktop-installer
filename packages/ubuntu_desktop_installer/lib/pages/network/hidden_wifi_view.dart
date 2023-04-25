import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import 'connect_model.dart';
import 'hidden_wifi_model.dart';
import 'wifi_model.dart';

class HiddenWifiRadioButton extends StatelessWidget {
  const HiddenWifiRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ConnectMode? value;
  final ValueChanged<ConnectMode?> onChanged;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HiddenWifiModel>(context);
    if (!model.isEnabled || model.devices.isEmpty) {
      return const SizedBox.shrink();
    }

    final lang = AppLocalizations.of(context);
    return YaruRadioButton<ConnectMode>(
      title: Text(lang.hiddenWifiNetwork),
      contentPadding: const EdgeInsets.only(top: 8),
      value: ConnectMode.hiddenWifi,
      groupValue: value,
      onChanged: onChanged,
    );
  }
}

class HiddenWifiView extends StatefulWidget {
  const HiddenWifiView({
    super.key,
    required this.expanded,
  });

  final bool expanded;

  @override
  State<HiddenWifiView> createState() => _HiddenWifiViewState();
}

class _HiddenWifiViewState extends State<HiddenWifiView> {
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
    final lang = AppLocalizations.of(context);
    final model = Provider.of<HiddenWifiModel>(context);
    if (!model.isEnabled || model.devices.isEmpty) {
      return const SizedBox.shrink();
    }

    return AnimatedExpanded(
      expanded: widget.expanded,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: kContentWidthFraction,
          child: Padding(
            padding: kContentIndentation,
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
                  const SizedBox(height: kContentSpacing),
                ValidatedFormField(
                  focusNode: _focusNode,
                  initialValue: model.ssid,
                  onChanged: model.setSsid,
                  validator: RequiredValidator(
                    errorText: lang.hiddenWifiNetworkNameRequired,
                  ),
                  labelText: lang.hiddenWifiNetworkNameLabel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
