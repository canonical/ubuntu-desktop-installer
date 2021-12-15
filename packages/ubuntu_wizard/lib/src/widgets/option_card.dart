import 'package:flutter/material.dart';

/// A card widget that presents a toggleable option.
///
/// For example:
/// ```dart
/// Row(
///   children: [
///     OptionCard(
///       image: Image.asset('assets/foo.png'),
///       title: Text('Foo'),
///       body: Text('Description...'),
///       selected: model.option == MyOption.foo,
///       onSelected: () => model.option = Option.foo,
///     ),
///     OptionCard(
///       image: Image.asset('assets/bar.png'),
///       title: Text('Bar'),
///       body: Text('Description...'),
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
    this.image,
    this.title,
    this.body,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  /// An image asset that illustrates the option.
  final Widget? image;

  /// A title below the image. It should be a short text.
  final Widget? title;

  /// A body below the title. It should be a longer descriptive text.
  final Widget? body;

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
              child: widget.image ?? const SizedBox.shrink(),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                child: widget.title ?? const SizedBox.shrink(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: widget.body ?? const SizedBox.shrink(),
            ),
          ]),
        ),
        onHover: _setHovered,
        onTap: widget.onSelected,
      ),
    );
  }
}
