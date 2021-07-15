import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/widgets/yaru_icons.dart';

import '../disk_storage_model.dart';
import '../routes.dart';
import '../widgets.dart';
import 'wizard_page.dart';

class AllocateDiskSpacePage extends StatefulWidget {
  const AllocateDiskSpacePage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) => AllocateDiskSpacePage();

  @override
  _AllocateDiskSpacePageState createState() => _AllocateDiskSpacePageState();
}

class _AllocateDiskSpacePageState extends State<AllocateDiskSpacePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<DiskStorageModel>(context, listen: false);
    model.initGuidedStorage();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DiskStorageModel>(context);
    return LocalizedView(
        builder: (context, lang) => WizardPage(
              title: Text(lang.allocateDiskSpace),
              content: Column(children: <Widget>[
                Expanded(
                    child: Column(children: <Widget>[
                  RoundedContainer(
                    child: DataTable(
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
                      rows: List<DataRow>.generate(model.diskAndPartitionCount,
                          (index) {
                        final element = model.diskAndPartition(index);
                        return DataRow(cells: <DataCell>[
                          DataCell(Row(children: [
                            Icon(YaruIcons.drive_harddisk),
                            const SizedBox(width: 16),
                            Text(element.name),
                          ])),
                          DataCell(Text(element.disk.type!)),
                          DataCell(Text('')),
                          DataCell(Text(filesize(element.disk.size))),
                          DataCell(Text('')),
                          DataCell(Text('')),
                          DataCell(Checkbox(value: true, onChanged: null)),
                        ]);
                      }),
                    ),
                  ),
                ])),
              ]),
              actions: <WizardAction>[
                WizardAction(
                  label: lang.backButtonText,
                  onActivated: Navigator.of(context).pop,
                ),
                WizardAction(
                  label: lang.startInstallingButtonText,
                  highlighted: true,
                  onActivated: () async {
                    await model.setGuidedStorage();
                    Navigator.pushNamed(context, Routes.writeChangesToDisk);
                  },
                ),
              ],
            ));
  }
}
