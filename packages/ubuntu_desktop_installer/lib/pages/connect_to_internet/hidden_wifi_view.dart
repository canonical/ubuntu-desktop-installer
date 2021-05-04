import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets.dart';
import 'hidden_wifi_model.dart';

class HiddenWifiView extends StatefulWidget {
  const HiddenWifiView({
    Key? key,
    this.contentPadding,
    this.contentWidthFactor,
    required this.expanded,
    required this.onSelected,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final double? contentWidthFactor;
  final bool expanded;
  final VoidCallback onSelected;

  @override
  _HiddenWifiViewState createState() => _HiddenWifiViewState();
}

class _HiddenWifiViewState extends State<HiddenWifiView> {
  final _focusNode = FocusNode();
  final _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final model = Provider.of<HiddenWifiModel>(context, listen: false);
    _editingController.text = model.ssid;
    _editingController.addListener(_updatePassword);
  }

  void _updatePassword() {
    final model = Provider.of<HiddenWifiModel>(context, listen: false);
    model.setSsid(_editingController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _editingController.removeListener(_updatePassword);
    _editingController.dispose();
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
    final model = Provider.of<HiddenWifiModel>(context);
    final iconSize = IconTheme.of(context).size;
    return AnimatedExpanded(
      expanded: widget.expanded,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: widget.contentWidthFactor ?? 1.0,
        child: RadioIconTile(
          contentPadding: widget.contentPadding,
          title: TextField(
            controller: _editingController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              suffix: SizedBox(
                width: iconSize,
                height: iconSize,
                child: model.selectedDevice?.isBusy == true
                    ? CircularProgressIndicator()
                    : null,
              ),
              helperText: model.selectedDevice?.state.toString(),
            ),
            onTap: widget.onSelected,
          ),
        ),
      ),
    );
  }
}
