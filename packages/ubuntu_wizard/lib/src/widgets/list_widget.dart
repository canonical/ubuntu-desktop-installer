import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
  final _scrollController = ItemScrollController();
  final _scrollListener = ItemPositionsListener.create();

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
    super.dispose();
  }

  void _scrollTo(int index) {
    if (index == -1) return;

    final pos = _scrollListener.itemPositions.value
        .firstWhereOrNull((item) => item.index == index);
    if (pos == null) {
      // the item does not exist in the viewport. jump and align the center.
      final box =
          _scrollableKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        _scrollController.jumpTo(
          index: index,
          alignment: _centerAlign(context, box.size.height),
        );
      }
    } else if (pos.itemLeadingEdge < 0) {
      // partly above the viewport, align the top edge
      _scrollController.jumpTo(index: index, alignment: 0);
    } else if (pos.itemTrailingEdge > 1) {
      // partly below the viewport, align the bottom edge
      _scrollController.jumpTo(
        index: index,
        alignment: 1 - pos.itemTrailingEdge + pos.itemLeadingEdge,
      );
    }

    _focusNode.requestFocus();
  }

  static double _centerAlign(BuildContext context, double totalHeight) {
    final theme = ListTileTheme.of(context);
    final tileHeight = theme.dense == true ? kMinInteractiveDimension : 56;
    return 0.5 - tileHeight / totalHeight / 2;
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
            return ScrollablePositionedList.builder(
              key: _scrollableKey,
              initialAlignment: _centerAlign(context, constraints.maxHeight),
              initialScrollIndex: widget.selectedIndex,
              itemScrollController: _scrollController,
              itemPositionsListener: _scrollListener,
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder,
            );
          },
        ),
      ),
    );
  }
}
