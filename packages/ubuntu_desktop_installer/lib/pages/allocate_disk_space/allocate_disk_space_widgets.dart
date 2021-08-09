part of 'allocate_disk_space_page.dart';

class _PartitionBar extends StatelessWidget {
  _PartitionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return RoundedContainer(
      child: CustomPaint(
        size: Size(double.infinity, 24),
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
  _PartitionPainter(this._model)
      : _selectedDiskIndex = _model.selectedDiskIndex,
        _selectedPartitionIndex = _model.selectedPartitionIndex;

  final AllocateDiskSpaceModel _model;
  final int _selectedDiskIndex;
  final int _selectedPartitionIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final diskSize = _model.selectedDisk?.size ?? 0;
    if (diskSize <= 0) return;

    final rect = Offset.zero & size;
    final partitions = _model.selectedPartitions;
    final partitionCount = partitions?.length ?? 0;
    for (var index = 0; index < partitionCount; ++index) {
      final partitionSize = partitions![index].size;
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
    return old._selectedDiskIndex != _selectedDiskIndex ||
        old._selectedPartitionIndex != _selectedPartitionIndex;
  }
}

class _PartitionLegend extends StatelessWidget {
  const _PartitionLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);

    final partitions = model.selectedPartitions;
    final partitionCount = partitions?.length ?? 0;
    final freeSpace = model.selectedDisk?.calculateFreeSpace() ?? 0;

    return SizedBox(
      height: 48,
      child: LocalizedView(
        builder: (context, lang) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: partitionCount + 1,
            separatorBuilder: (context, index) => SizedBox(width: 40),
            itemBuilder: (context, index) {
              if (index >= partitionCount) {
                return _PartitionLabel(
                  size: freeSpace,
                  title: lang.freeDiskSpace,
                  borderColor: Theme.of(context).dividerColor,
                );
              }

              final partition = partitions![index];

              return _PartitionLabel(
                // TODO:
                // - localize?
                // - partition type?
                title: '${model.selectedDisk!.id}${partition.number}',
                size: partition.size,
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

class _PartitionTable extends StatelessWidget {
  const _PartitionTable({Key? key}) : super(key: key);

  List<DataRow> _buildDataRows({
    required AllocateDiskSpaceModel model,
    required int diskIndex,
  }) {
    final disk = model.disks[diskIndex];
    return <DataRow>[
      DataRow.byIndex(
        index: diskIndex,
        selected: model.isStorageSelected(diskIndex),
        onSelectChanged: (selected) {
          if (selected == true) model.selectStorage(diskIndex);
        },
        cells: <DataCell>[
          DataCell(Row(children: [
            const Icon(YaruIcons.drive_harddisk_filled),
            const SizedBox(width: 16),
            Text(disk.id),
          ])),
          DataCell(Text(disk.type)),
          DataCell(Text('')),
          DataCell(Text(filesize(disk.size))),
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(Checkbox(value: true, onChanged: null)),
        ],
      ),
      for (var partitionIndex = 0;
          partitionIndex < disk.partitions.length;
          ++partitionIndex)
        DataRow(
          key: ValueKey(hashList([diskIndex, partitionIndex])),
          selected: model.isStorageSelected(diskIndex, partitionIndex),
          onSelectChanged: (selected) {
            if (selected == true) {
              model.selectStorage(diskIndex, partitionIndex);
            }
          },
          cells: <DataCell>[
            DataCell(Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(children: [
                const Icon(YaruIcons.drive_harddisk),
                const SizedBox(width: 16),
                Text('${disk.id}${disk.partitions[partitionIndex].number}'),
              ]),
            )),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text(filesize(disk.partitions[partitionIndex].size))),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Checkbox(value: true, onChanged: null)),
          ],
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return LocalizedView(builder: (context, lang) {
      return RoundedContainer(
        child: SingleChildScrollView(
          child: DataTable(
            showCheckboxColumn: false,
            headingTextStyle: Theme.of(context).textTheme.subtitle2,
            dataTextStyle: Theme.of(context).textTheme.bodyText2,
            columns: <DataColumn>[
              DataColumn(
                label: Text(lang.diskHeadersDevice),
              ),
              DataColumn(
                label: Text(lang.diskHeadersType),
              ),
              DataColumn(
                label: Text(lang.diskHeadersMountPoint),
              ),
              DataColumn(
                label: Text(lang.diskHeadersSize),
              ),
              DataColumn(
                label: Text(lang.diskHeadersUsed),
              ),
              DataColumn(
                label: Text(lang.diskHeadersSystem),
              ),
              DataColumn(
                label: Text(lang.diskHeadersFormat),
              ),
            ],
            rows: List.generate(model.disks.length,
                    (index) => _buildDataRows(model: model, diskIndex: index))
                .fold<List<DataRow>>([], (allRows, diskRows) {
              allRows.addAll(diskRows);
              return allRows;
            }).toList(),
          ),
        ),
      );
    });
  }
}

class _PartitionButtonRow extends StatelessWidget {
  const _PartitionButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalizedView(builder: (context, lang) {
      return Row(
        children: [
          RoundedContainer(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OutlinedButton(
                    child: const Icon(Icons.add),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: () {},
                  ),
                  VerticalDivider(width: 1),
                  OutlinedButton(
                    child: const Icon(Icons.remove),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: null,
                  ),
                  VerticalDivider(width: 1),
                  OutlinedButton(
                    child: Text(lang.changeButtonText),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(),
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ButtonBar(
            children: [
              OutlinedButton(
                child: Text(lang.newPartitionTable),
                onPressed: null,
              ),
            ],
          ),
          OutlinedButton(
            child: Text(lang.revertButtonText),
            onPressed: () {},
          ),
        ],
      );
    });
  }
}

class _BootDiskSelector extends StatelessWidget {
  const _BootDiskSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return LocalizedView(builder: (context, lang) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(lang.bootLoaderDevice),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: DropdownBuilder<int>(
              values: List.generate(model.disks.length, (index) => index),
              selected: model.bootDiskIndex,
              onSelected: model.selectBootDisk,
              itemBuilder: (context, index, _) {
                return Text(model.disks[index].id);
              },
            ),
          )
        ],
      );
    });
  }
}
