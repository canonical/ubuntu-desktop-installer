import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_icons/widgets/yaru_icons.dart';

import '../../../constants.dart';
import '../../disk_storage_service.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'allocate_disk_space_model.dart';

class AllocateDiskSpacePage extends StatefulWidget {
  const AllocateDiskSpacePage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final service = Provider.of<DiskStorageService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => AllocateDiskSpaceModel(service),
      child: AllocateDiskSpacePage(),
    );
  }

  @override
  _AllocateDiskSpacePageState createState() => _AllocateDiskSpacePageState();
}

class _AllocateDiskSpacePageState extends State<AllocateDiskSpacePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
    model.getGuidedStorage();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return LocalizedView(
        builder: (context, lang) => WizardPage(
              title: Text(lang.allocateDiskSpace),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _PartitionBar(),
                    const SizedBox(height: kContentSpacing),
                    Expanded(
                        child: RoundedContainer(
                      child: SingleChildScrollView(
                        child: DataTable(
                          showCheckboxColumn: false,
                          headingTextStyle:
                              Theme.of(context).textTheme.subtitle2,
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
                          rows: List<DataRow>.generate(
                              model.diskAndPartitionCount, (index) {
                            final element = model.diskAndPartition(index);
                            final isDisk = element.partition == null;
                            return DataRow.byIndex(
                              index: index,
                              selected: index == model.selectedIndex,
                              onSelectChanged: (selected) {
                                if (selected == true) {
                                  model.selectIndex(index);
                                }
                              },
                              cells: <DataCell>[
                                DataCell(Padding(
                                  padding:
                                      EdgeInsets.only(left: isDisk ? 0 : 40),
                                  child: Row(children: [
                                    Icon(isDisk
                                        ? YaruIcons.drive_harddisk_filled
                                        : YaruIcons.drive_harddisk),
                                    const SizedBox(width: 16),
                                    Text(element.name),
                                  ]),
                                )),
                                DataCell(Text(element.disk.type!)),
                                DataCell(Text('')),
                                DataCell(Text(filesize(
                                    element.partition?.size ??
                                        element.disk.size))),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(
                                    Checkbox(value: true, onChanged: null)),
                              ],
                            );
                          }),
                        ),
                      ),
                    )),
                  ]),
              actions: <WizardAction>[
                WizardAction(
                  label: lang.backButtonText,
                  onActivated: Wizard.of(context).back,
                ),
                WizardAction(
                  label: lang.startInstallingButtonText,
                  highlighted: true,
                  onActivated: () async {
                    await model.setGuidedStorage();
                    Wizard.of(context).next();
                  },
                ),
              ],
            ));
  }
}

class _PartitionBar extends StatelessWidget {
  _PartitionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    return RoundedContainer(
      child: CustomPaint(
        size: Size(double.infinity, 48),
        painter: _PartitionPainter(model, model.selectedIndex),
      ),
    );
  }
}

class _PartitionPainter extends CustomPainter {
  const _PartitionPainter(this._model, this._selectedIndex);

  final AllocateDiskSpaceModel _model;
  final int _selectedIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final diskSize = _model.selectedDisk?.disk.size ?? 0;
    if (diskSize <= 0) return;

    final rect = Offset.zero & size;
    canvas.clipRRect(RRect.fromRectAndRadius(rect, Radius.circular(5.0)));

    final baseColor = HSLColor.fromColor(Colors.blue.shade900);

    final partitions = _model.findPartitions(_model.selectedIndex);
    for (var index = 0; index < partitions.length; ++index) {
      final partitionSize = partitions[index].partition?.size ?? 0;
      if (partitionSize <= 0) continue;

      final paint = Paint();
      final hue = (baseColor.hue + 360 / partitions.length * index) % 360;
      paint.color = baseColor.withHue(hue).toColor();
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
