import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../routes.dart';
import '../widgets.dart';
import 'wizard_page.dart';

class _DiskOrPartition {
  final Disk disk;
  final Partition? partition;
  late String name;

  _DiskOrPartition({required this.disk, this.partition}) {
    name = disk.id!;
    if (partition != null) {
      name += partition!.number.toString();
    }
  }
}

class AllocateDiskSpacePage extends StatefulWidget {
  const AllocateDiskSpacePage({
    Key? key,
  }) : super(key: key);

  @override
  _AllocateDiskSpacePageState createState() => _AllocateDiskSpacePageState();
}

class _AllocateDiskSpacePageState extends State<AllocateDiskSpacePage> {
  GuidedStorageResponse? _response;
  final List<_DiskOrPartition> _disksAndPartitions = [];

  @override
  void initState() {
    super.initState();
    final client = Provider.of<SubiquityClient>(context, listen: false);
    client.getGuidedStorage(0, true).then((r) {
      setState(() {
        _response = r;
        _disksAndPartitions.clear();
        for (var disk in r.disks!) {
          _disksAndPartitions.add(_DiskOrPartition(disk: disk));
          for (var partition in disk.partitions!) {
            _disksAndPartitions
                .add(_DiskOrPartition(disk: disk, partition: partition));
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      rows: List<DataRow>.generate(_disksAndPartitions.length,
                          (index) {
                        final element = _disksAndPartitions[index];
                        return DataRow(cells: <DataCell>[
                          DataCell(Row(children: [
                            ImageIcon(
                                AssetImage('assets/icon-hard-drive-solid.png')),
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
                    final client =
                        Provider.of<SubiquityClient>(context, listen: false);

                    final choice = GuidedChoice(
                        diskId: _response!.disks![0].id, useLvm: false);
                    final storageResponse =
                        await client.setGuidedStorage(choice);

                    Navigator.pushNamed(context, Routes.writeChangesToDisk,
                        arguments: storageResponse.config);
                  },
                ),
              ],
            ));
  }
}
