part of 'allocate_disk_space_page.dart';

class _PartitionBar extends StatelessWidget {
  _PartitionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return RoundedContainer(
      child: CustomPaint(
        size: Size(double.infinity, 48),
        painter: _PartitionPainter(model),
      ),
    );
  }
}

Color _partitionColor(int index, int count) {
  assert(count > 0);
  final baseColor = HSLColor.fromColor(Colors.blue.shade900);
  final hue = (baseColor.hue + 360 / count * index) % 360;
  return baseColor.withHue(hue).toColor();
}

class _PartitionPainter extends CustomPainter {
  _PartitionPainter(this._model) : _selectedIndex = _model.selectedIndex;

  final AllocateDiskSpaceModel _model;
  final int _selectedIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final diskSize = _model.selectedDisk?.disk.size ?? 0;
    if (diskSize <= 0) return;

    final rect = Offset.zero & size;
    canvas.clipRRect(RRect.fromRectAndRadius(rect, Radius.circular(5.0)));

    final partitions = _model.findPartitions(_model.selectedIndex);
    for (var index = 0; index < partitions.length; ++index) {
      final partitionSize = partitions[index].partition?.size ?? 0;
      if (partitionSize <= 0) continue;

      final paint = Paint();
      paint.color = _partitionColor(index, partitions.length);
      paint.style = PaintingStyle.fill;

      final width = rect.width * partitionSize / diskSize;
      canvas.drawRect(Rect.fromLTWH(0, 0, width, rect.height), paint);
      canvas.translate(width, 0);
    }
  }

  @override
  bool shouldRepaint(covariant _PartitionPainter old) {
    return old._selectedIndex != _selectedIndex;
  }
}

class _PartitionLegend extends StatelessWidget {
  const _PartitionLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);

    final partitions = model.findPartitions(model.selectedIndex);
    final freeSpace = AllocateDiskSpaceModel.calculateFreeSpace(
      disk: model.selectedDisk,
      partitions: partitions,
    );

    return SizedBox(
      height: 48,
      child: LocalizedView(
        builder: (context, lang) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: partitions.length + 1,
            separatorBuilder: (context, index) => SizedBox(width: 40),
            itemBuilder: (context, index) {
              if (index >= partitions.length) {
                return _PartitionLabel(
                  size: freeSpace,
                  title: lang.freeDiskSpace,
                  borderColor: Theme.of(context).dividerColor,
                );
              }

              final partition = partitions[index];
              final partitionSize = partition.partition?.size ?? 0;

              return _PartitionLabel(
                // TODO:
                // - localize?
                // - partition type?
                title: partition.name,
                size: partitionSize,
                color: _partitionColor(index, partitions.length),
              );
            },
          );
        },
      ),
    );
  }
}

class _PartitionLabel extends StatelessWidget {
  const _PartitionLabel({
    Key? key,
    required this.title,
    required this.size,
    this.color = Colors.transparent,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  final String title;
  final int size;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 8, 0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.subtitle2),
            Text(filesize(size), style: Theme.of(context).textTheme.caption),
          ],
        ),
      ],
    );
  }
}
