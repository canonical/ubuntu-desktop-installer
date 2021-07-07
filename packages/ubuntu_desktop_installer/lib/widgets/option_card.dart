import 'package:flutter/material.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    Key? key,
    this.imageAsset,
    this.titleText,
    this.bodyText,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final String? imageAsset;
  final String? titleText;
  final String? bodyText;
  final bool selected;
  final VoidCallback onSelected;

  @override
  OptionCardState createState() => OptionCardState();
}

class OptionCardState extends State<OptionCard> {
  bool _hovered = false;
  bool get hovered => _hovered;

  void _setHovered(bool hovered) {
    if (_hovered == hovered) return;
    setState(() => _hovered = hovered);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: widget.selected
                  ? Theme.of(context).primaryColor.withOpacity(0.4)
                  : Theme.of(context).colorScheme.onSurface.withAlpha(20),
              width: 1),
          borderRadius: BorderRadius.circular(4.0)),
      elevation: widget.selected ? 0 : 1,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: widget.imageAsset != null
                  ? Image.asset(widget.imageAsset!)
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.titleText ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: widget.selected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onSurface.withAlpha(190),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Opacity(
                opacity: 0.9,
                child: Text(widget.bodyText ?? '',
                    style: TextStyle(
                      color: widget.selected
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(190),
                    )),
              ),
            ),
          ]),
        ),
        onHover: _setHovered,
        onTap: widget.onSelected,
      ),
    );
  }
}
