import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_icons/widgets/yaru_icons.dart';

import '../../../constants.dart';
import '../../services.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'allocate_disk_space_model.dart';

part 'allocate_disk_space_widgets.dart';

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
                    const SizedBox(height: kContentSpacing / 2),
                    _PartitionLegend(),
                    const SizedBox(height: kContentSpacing / 2),
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
