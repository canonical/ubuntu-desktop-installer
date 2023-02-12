import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
class OptionCard extends StatelessWidget {
  /// Creates an option card with the given properties.
  const OptionCard({
    super.key,
    this.image,
    this.title,
    this.body,
    required this.selected,
    required this.onSelected,
  });

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return YaruSelectableContainer(
      selected: selected,
      padding: EdgeInsets.zero,
      child: YaruBanner(
        onTap: onSelected,
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: image ?? const SizedBox.shrink(),
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle(
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
              child: title ?? const SizedBox.shrink(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: body ?? const SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }
}
