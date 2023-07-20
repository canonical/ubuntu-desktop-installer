import 'package:flutter/material.dart';

TextStyle _titleStyle(BuildContext context) {
  return TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w300,
    color: Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle _bodyStyle(BuildContext context) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.5,
    color: Theme.of(context).colorScheme.onSurface,
  );
}

class SlideLabel extends StatelessWidget {
  const SlideLabel({super.key, required this.icon, required this.label});

  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 24,
          child: icon,
        ),
        const SizedBox(width: 8),
        label,
      ],
    );
  }
}

class SlideColumn extends StatelessWidget {
  const SlideColumn({super.key, required this.children, this.spacing});

  final List<Widget> children;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _withSpacing(children, spacing ?? 16),
    );
  }

  static List<Widget> _withSpacing(List<Widget> children, double spacing) {
    return children
        .expand((item) sync* {
          yield SizedBox(height: spacing);
          yield item;
        })
        .skip(1)
        .toList();
  }
}

class SlideTable extends StatelessWidget {
  const SlideTable({super.key, required this.rows});

  final List<List<Widget>> rows;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: Divider.createBorderSide(context),
      ),
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(40),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        for (var i = 0; i < rows.length; ++i)
          TableRow(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: i > 0 ? 16 : 0,
                  bottom: 16,
                ),
                child: rows[i].first,
              ),
              const SizedBox.shrink(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: i > 0 ? 16 : 0,
                  bottom: 16,
                ),
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: rows[i].skip(1).toList(),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class SlideList extends StatelessWidget {
  const SlideList({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final child in children)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\u2022'),
                const SizedBox(width: 4),
                Expanded(child: child),
              ],
            ),
          ),
      ],
    );
  }
}

/// A layout reserved for the first slide.
class IntroSlideLayout extends StatelessWidget {
  const IntroSlideLayout({
    super.key,
    required this.title,
    required this.body,
    required this.image,
  });

  final Widget title;
  final Widget body;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        shrinkWrap: true,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultTextStyle(
                      style: _titleStyle(context).copyWith(fontSize: 30),
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 8,
                child: image,
              ),
              const Spacer(flex: 4),
            ],
          ),
        ],
      ),
    );
  }
}

/// A layout with a landscape screenshot on the right.
class LandscapeSlideLayout extends StatelessWidget {
  const LandscapeSlideLayout({
    super.key,
    required this.title,
    required this.body,
    required this.image,
    required this.table,
  });

  final Widget title;
  final Widget body;
  final Widget image;
  final Widget table;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 8,
              child: DefaultTextStyle(
                style: _titleStyle(context),
                child: title,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 14,
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: _bodyStyle(context),
                    child: body,
                  ),
                  const SizedBox(height: 16),
                  image,
                  const SizedBox(height: 16),
                  table,
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }
}

/// A layout with a portrait screenshot on the left.
class PortraitSlideLayout extends StatelessWidget {
  const PortraitSlideLayout({
    super.key,
    required this.title,
    required this.body,
    required this.image,
    required this.table,
  });

  final Widget title;
  final Widget body;
  final Widget image;
  final Widget table;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            const Spacer(flex: 1),
            Expanded(
              flex: 14,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 56),
                  DefaultTextStyle(
                    style: _titleStyle(context),
                    child: title,
                  ),
                  const SizedBox(height: 16),
                  DefaultTextStyle(
                    style: _bodyStyle(context),
                    child: body,
                  ),
                  const SizedBox(height: 16),
                  table,
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }
}

/// A "cinematic" layout with a wide banner at the top.
class CinematicSlideLayout extends StatelessWidget {
  const CinematicSlideLayout({
    super.key,
    required this.banner,
    required this.title,
    required this.body,
    required this.table,
  });

  final Widget banner;
  final Widget title;
  final Widget body;
  final Widget table;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        banner,
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 8,
              child: DefaultTextStyle(
                style: _titleStyle(context),
                child: title,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DefaultTextStyle(
                    style: _bodyStyle(context),
                    child: body,
                  ),
                  const SizedBox(height: 16),
                  table,
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }
}

/// A layout reserved for the last slide.
class OutroSlideLayout extends StatelessWidget {
  const OutroSlideLayout({
    super.key,
    required this.title,
    required this.body,
    required this.image,
    required this.list,
  });

  final Widget title;
  final Widget body;
  final Widget image;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        shrinkWrap: true,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultTextStyle(
                      style: _titleStyle(context),
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: image,
                    ),
                    const SizedBox(height: 48),
                    list,
                  ],
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
