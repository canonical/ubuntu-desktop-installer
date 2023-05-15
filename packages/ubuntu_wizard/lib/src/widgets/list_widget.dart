import 'package:flutter/material.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

// assumes dense list tiles
const _kTileHeight = kMinInteractiveDimension;

class ListWidget extends StatefulWidget {
  const ListWidget.builder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.selectedIndex = -1,
    this.onKeySearch,
  });

  final int selectedIndex;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ValueChanged<String>? onKeySearch;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final _focusNode = FocusNode();
  final _scrollableKey = GlobalKey();
  ScrollController? _scrollController;

  @override
  void didUpdateWidget(ListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _scrollTo(widget.selectedIndex);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  void _scrollTo(int index) {
    if (index == -1 || _scrollController?.hasClients != true) return;

    final box = _scrollableKey.currentContext?.findRenderObject() as RenderBox?;
    if (box?.hasSize != true) return;

    final scrollOffset = _scrollController!.offset;
    final tileOffset = index * _kTileHeight;
    final viewHeight = box!.size.height;

    // jump and center align the selected item is fully outside the viewport
    if (tileOffset < scrollOffset - _kTileHeight ||
        tileOffset > scrollOffset + viewHeight) {
      final center = tileOffset - viewHeight / 2 + _kTileHeight / 2;
      _scrollController?.jumpTo(center);
    }

    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return YaruBorderContainer(
      clipBehavior: Clip.antiAlias,
      child: KeySearch(
        autofocus: true,
        focusNode: _focusNode,
        onSearch: widget.onKeySearch ?? (_) => -1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (widget.itemCount <= 0 ||
                constraints.maxWidth <= 0 ||
                constraints.maxHeight <= 0) {
              return const SizedBox.expand();
            }
            // calculate initial center-alignment
            _scrollController ??= ScrollController(
                initialScrollOffset: widget.selectedIndex * _kTileHeight -
                    constraints.maxHeight / 2 +
                    _kTileHeight / 2);
            return FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: ListView.builder(
                key: _scrollableKey,
                controller: _scrollController,
                itemExtent: _kTileHeight,
                itemCount: widget.itemCount,
                itemBuilder: (context, index) => Builder(
                  builder: (context) {
                    if (index == widget.selectedIndex) {
                      // bring a half-visible selected item into the viewport
                      context.findRenderObject()?.showOnScreen();
                    }
                    return FocusTraversalOrder(
                      order: NumericFocusOrder(index.toDouble()),
                      child: widget.itemBuilder(context, index),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
