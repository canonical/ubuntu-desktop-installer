import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets.dart';
import 'wifi_model.dart';

typedef OnWifiSelected = void Function(
  WifiDeviceModel device,
  AccessPointModel accessPoint,
);

class WifiView extends StatefulWidget {
  const WifiView({
    Key? key,
    this.contentPadding,
    this.contentWidthFactor,
    required this.expanded,
    required this.onSelected,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final double? contentWidthFactor;
  final bool expanded;
  final OnWifiSelected onSelected;

  @override
  _WifiViewState createState() => _WifiViewState();
}

class _WifiViewState extends State<WifiView> {
  @override
  void initState() {
    super.initState();
    Provider.of<WifiModel>(context, listen: false).requestScan();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedExpanded(
      expanded: widget.expanded,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: widget.contentWidthFactor ?? 1.0,
        child: RadioIconTile(
          contentPadding: widget.contentPadding,
          title: WifiListView(
            onSelected: (device, accessPoint) {},
          ),
        ),
      ),
    );
  }
}

class WifiListView extends StatelessWidget {
  const WifiListView({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final OnWifiSelected onSelected;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WifiModel>(context);
    return RoundedContainer(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: model.devices.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: model.devices[index],
            child: WifiListTile(
              selected: model.isSelectedDevice(model.devices[index]),
              onSelected: (device, accessPoint) {
                model.selectDevice(device);
                onSelected(device, accessPoint);
              },
            ),
          );
        },
      ),
    );
  }
}

class WifiListTile extends StatelessWidget {
  const WifiListTile({
    Key? key,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final bool selected;
  final OnWifiSelected onSelected;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WifiDeviceModel>(context);
    final textColor = Theme.of(context).textTheme.subtitle1!.color;
    final iconSize = IconTheme.of(context).size;
    return AffinityExpansionTile(
      initiallyExpanded: true,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(model.model ?? model.interface),
      textColor: textColor,
      iconColor: textColor,
      trailing: SizedBox(
        width: iconSize,
        height: iconSize,
        child: model.scanning
            ? CircularProgressIndicator()
            : IconButton(
                icon: const Icon(Icons.refresh),
                padding: EdgeInsets.zero,
                onPressed: model.requestScan,
              ),
      ),
      children: <Widget>[
        for (final accessPoint in model.accessPoints)
          ChangeNotifierProvider.value(
            value: accessPoint,
            child: ListTile(
              title: Text(accessPoint.name),
              leading: SizedBox.shrink(),
              selected: selected && model.isSelectedAccessPoint(accessPoint),
              subtitle: selected && model.isActiveAccessPoint(accessPoint)
                  ? Text(model.state.toString())
                  : null,
              trailing: SizedBox(
                width: iconSize,
                height: iconSize,
                child: model.isActiveAccessPoint(accessPoint)
                    ? model.isBusy
                        ? CircularProgressIndicator()
                        : Icon(Icons.check)
                    : Icon(_wifiIcon(accessPoint)),
              ),
              onTap: () {
                model.selectAccessPoint(accessPoint);
                onSelected(model, accessPoint);
              },
            ),
          ),
      ],
    );
  }
}

IconData _wifiIcon(AccessPointModel model) {
  final strength = (model.strength ~/ 25 + 1).clamp(1, 4);
  return model.isOpen ? _wifiIconOpen(strength) : _wifiIconLock(strength);
}

IconData _wifiIconOpen(int strength) {
  const icons = <int, IconData>{
    1: MdiIcons.wifiStrength1,
    2: MdiIcons.wifiStrength2,
    3: MdiIcons.wifiStrength3,
    4: MdiIcons.wifiStrength4,
  };
  return icons[strength]!;
}

IconData _wifiIconLock(int strength) {
  const icons = <int, IconData>{
    1: MdiIcons.wifiStrength1Lock,
    2: MdiIcons.wifiStrength2Lock,
    3: MdiIcons.wifiStrength3Lock,
    4: MdiIcons.wifiStrength4Lock,
  };
  return icons[strength]!;
}
