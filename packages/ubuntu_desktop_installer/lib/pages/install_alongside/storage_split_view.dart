import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'storage_button.dart';
import 'storage_size_dialog.dart';

class StorageSplitView extends StatefulWidget {
  const StorageSplitView({
    super.key,
    required this.currentSize,
    required this.minimumSize,
    required this.maximumSize,
    required this.totalSize,
    required this.partition,
    required this.existingOS,
    required this.productInfo,
    required this.onResize,
  }) : assert(totalSize > 0);

  final int currentSize;
  final int minimumSize;
  final int maximumSize;
  final int totalSize;
  final Partition partition;
  final OsProber? existingOS;
  final ProductInfo productInfo;
  final ValueChanged<int> onResize;

  @override
  State<StorageSplitView> createState() => _StorageSplitViewState();
}

class _StorageSplitViewState extends State<StorageSplitView> {
  SplitViewController? _controller;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant StorageSplitView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.minimumSize != oldWidget.minimumSize ||
        widget.maximumSize != oldWidget.maximumSize ||
        widget.totalSize != oldWidget.totalSize) {
      _initController();
    }
  }

  void _initController() {
    _controller?.dispose();
    _controller = SplitViewController(
      weights: [widget.currentSize / widget.totalSize, null],
      limits: [
        WeightLimit(
          min: widget.minimumSize / widget.totalSize,
          max: widget.maximumSize / widget.totalSize,
        ),
        null,
      ],
    );
    _controller!.addListener(() {
      final weight = _controller!.weights.firstOrNull;
      if (weight != null) {
        final size = weight * widget.totalSize;
        widget.onResize(size.round());
      }
    });
  }

  void _updateController(int size) {
    _controller?.weights = [size / widget.totalSize, null];
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return SplitView(
      key: ObjectKey(_controller),
      indicator: const SizedBox.shrink(key: Key('indicator')),
      gripSize: kContentSpacing / 2,
      gripColor: Colors.transparent,
      gripColorActive: Colors.transparent,
      viewMode: SplitViewMode.Horizontal,
      controller: _controller,
      children: [
        StorageButton(
          name: widget.existingOS?.long ?? lang.installAlongsideFiles,
          size: widget.currentSize,
          sysname: widget.partition.sysname,
          format: widget.partition.format,
          onPressed: () async {
            final size = await showStorageSizeDialog(
              context,
              title: lang.installAlongsideResizePartition,
              name: widget.existingOS?.long,
              path: widget.partition.path,
              initialSize: widget.currentSize,
              minimumSize: widget.minimumSize,
              maximumSize: widget.maximumSize,
            );
            if (size != null) {
              _updateController(size);
            }
          },
        ),
        StorageButton(
          name: widget.productInfo.toString(),
          size: widget.totalSize - widget.currentSize,
          format: 'ext4', // FIXME
          onPressed: () async {
            final size = await showStorageSizeDialog(
              context,
              title: lang.installAlongsideAllocateSpace,
              name: widget.productInfo.toString(),
              initialSize: widget.totalSize - widget.currentSize,
              minimumSize: widget.totalSize - widget.maximumSize,
              maximumSize: widget.totalSize - widget.minimumSize,
            );
            if (size != null) {
              _updateController(widget.totalSize - size);
            }
          },
        ),
      ],
    );
  }
}
