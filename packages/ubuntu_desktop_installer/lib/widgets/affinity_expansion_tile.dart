import 'package:flutter/material.dart';

/// [ExpansionTile] with an additional [controlAffinity] property to be able to
/// move the rotating expansion arrow icon as a leading widget before the title.
///
/// Note: This is a drop-in replacement for https://github.com/flutter/flutter/pull/80360
class AffinityExpansionTile extends StatefulWidget {
  const AffinityExpansionTile({
    Key? key,
    required this.title,
    this.children = const <Widget>[],
    this.leading,
    this.trailing,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
  }) : super(key: key);

  final Widget title;
  final List<Widget> children;
  final Widget? leading;
  final Widget? trailing;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final ListTileControlAffinity controlAffinity;
  final Color? iconColor;
  final Color? collapsedIconColor;
  final Color? textColor;
  final Color? collapsedTextColor;

  @override
  _AffinityExpansionTileState createState() => _AffinityExpansionTileState();
}

class _AffinityExpansionTileState extends State<AffinityExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late final AnimationController _controller;
  late final Animation<double> _rotation;

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _rotation = _controller.drive(_halfTween.chain(_easeInTween));

    _expanded = widget.initiallyExpanded;
    if (_expanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setExpanded(bool expanded) {
    if (_expanded == expanded) return;

    if (expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => _expanded = expanded);
    widget.onExpansionChanged?.call(expanded);
  }

  ListTileControlAffinity effectiveAffinity(ListTileControlAffinity affinity) {
    if (affinity == ListTileControlAffinity.platform) {
      return ListTileControlAffinity.trailing;
    }
    return affinity;
  }

  Widget? _buildIcon(ListTileControlAffinity affinity) {
    if (affinity != effectiveAffinity(widget.controlAffinity)) {
      return SizedBox.shrink();
    }

    return RotationTransition(
      turns: _rotation,
      child: const Icon(Icons.expand_more),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.title,
      initiallyExpanded: widget.initiallyExpanded,
      onExpansionChanged: _setExpanded,
      leading: widget.leading ?? _buildIcon(ListTileControlAffinity.leading),
      trailing: widget.trailing ?? _buildIcon(ListTileControlAffinity.trailing),
      children: widget.children,
      textColor: widget.textColor,
      collapsedTextColor: widget.collapsedTextColor,
      iconColor: widget.iconColor,
      collapsedIconColor: widget.collapsedIconColor,
    );
  }
}
