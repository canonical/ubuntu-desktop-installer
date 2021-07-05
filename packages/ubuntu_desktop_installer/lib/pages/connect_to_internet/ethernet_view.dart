import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets.dart';
import 'ethernet_model.dart';

typedef OnEthernetSelected = void Function(EthernetDeviceModel device);

class EthernetRadioListTile<T> extends StatelessWidget {
  const EthernetRadioListTile({
    Key? key,
    this.title,
    this.errorTitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.contentPadding,
  }) : super(key: key);

  final Widget? title;
  final Widget? errorTitle;
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EthernetModel>(context);
    if (model.devices.isEmpty) {
      return RadioIconTile(
        contentPadding: contentPadding,
        icon: Icon(Icons.close, color: Theme.of(context).errorColor),
        title: errorTitle,
      );
    }

    return RadioListTile<T>(
      title: title,
      contentPadding: contentPadding,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

class EthernetView extends StatelessWidget {
  const EthernetView({
    Key? key,
    this.title,
    this.contentPadding,
    this.contentWidthFactor,
    required this.expanded,
    required this.onSelected,
  }) : super(key: key);

  final Widget? title;
  final EdgeInsetsGeometry? contentPadding;
  final double? contentWidthFactor;
  final bool expanded;
  final OnEthernetSelected onSelected;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EthernetModel>(context);
    if (model.devices.length <= 1) return SizedBox.shrink();

    return AnimatedExpanded(
      expanded: expanded,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: contentWidthFactor ?? 1.0,
        child: RadioIconTile(
          contentPadding: contentPadding,
          title: _EthernetListView(
            onSelected: (device) {
              model.selectDevice(device);
              onSelected(device);
            },
          ),
        ),
      ),
    );
  }
}

class _EthernetListView extends StatelessWidget {
  const _EthernetListView({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final OnEthernetSelected onSelected;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EthernetModel>(context);
    return RoundedContainer(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: model.devices.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: model.devices[index],
            child: _EthernetListTile(
              selected: model.isSelectedDevice(model.devices[index]),
              onSelected: () => onSelected(model.devices[index]),
            ),
          );
        },
      ),
    );
  }
}

class _EthernetListTile extends StatelessWidget {
  const _EthernetListTile({
    Key? key,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EthernetDeviceModel>(context);
    return ListTile(
      title: Text(model.model ?? 'Unknown Ethernet Adapter'),
      subtitle: Text(model.vendor ?? ''),
      trailing: Icon(model.isActive ? Icons.check : null),
      selected: selected,
      onTap: onSelected,
    );
  }
}
