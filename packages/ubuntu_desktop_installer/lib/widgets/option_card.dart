import 'package:flutter/material.dart';

/// A card widget that presents a toggleable option.
///
/// For example:
/// ```dart
/// Row(
///   children: [
///     OptionCard(
///       imageAsset: 'assets/foo.png',
///       titleText: 'Foo',
///       bodyText: 'Description...',
///       selected: model.option == MyOption.foo,
///       onSelected: () => model.option = Option.foo,
///     ),
///     OptionCard(
///       imageAsset: 'assets/bar.png',
///       titleText: 'Bar',
///       bodyText: 'Description...',
///       selected: model.option == MyOption.bar,
///       onSelected: () => model.option = MyOption.bar,
///     ),
///   ],
/// )
/// ```
class OptionCard extends StatefulWidget {
  /// Creates an option card with the given properties.
  const OptionCard({
    Key? key,
    this.imageAsset,
    this.titleText,
    this.bodyText,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  /// An image asset that illustrates the option.
  final String? imageAsset;

  /// A short title below the image.
  final String? titleText;

  /// A longer descriptive body text below the title.
  final String? bodyText;

  /// Whether the option is currently selected.
  final bool selected;

  /// Called when the option is selected.
  final VoidCallback onSelected;

  @override
  OptionCardState createState() => OptionCardState();
}

@visibleForTesting
// ignore: public_member_api_docs
class OptionCardState extends State<OptionCard> {
  bool _hovered = false;
  bool get hovered => _hovered; // ignore: public_member_api_docs

  void _setHovered(bool hovered) {
    if (_hovered == hovered) return;
    setState(() => _hovered = hovered);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: widget.selected
                  ? Theme.of(context).primaryColor.withOpacity(0.5)
                  : Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withAlpha(hovered ? 60 : 20),
              width: 2),
          borderRadius: BorderRadius.circular(6)),
      elevation: 0,
      child: InkWell(
        hoverColor: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(6),
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
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(widget.bodyText ?? ''),
            ),
          ]),
        ),
        onHover: _setHovered,
        onTap: widget.onSelected,
      ),
    );
  }
}
