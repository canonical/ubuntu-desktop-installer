import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../routes.dart';
import '../widgets.dart';

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
  List<_DiskOrPartition> _disksAndPartitions = [];

  @override
  void initState() {
    super.initState();
    final client = Provider.of<SubiquityClient>(context, listen: false);
    client.getGuidedStorage(0, true).then((r) {
      setState(() {
        print('Guided storage response: ${r.toJson()}');
        _response = r;
        _disksAndPartitions.clear();
        r.disks!.forEach((disk) {
          _disksAndPartitions.add(_DiskOrPartition(disk: disk));
          disk.partitions!.forEach((partition) {
            _disksAndPartitions
                .add(_DiskOrPartition(disk: disk, partition: partition));
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
        builder: (context, lang) => Scaffold(
            appBar: AppBar(
              title: Text(lang.allocateDiskSpace),
              automaticallyImplyLeading: false,
            ),
            body: Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  Expanded(
                      child: Column(children: <Widget>[
                    RoundedContainer(
                      child: DataTable(
                        headingTextStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .apply(fontWeightDelta: 3, color: Colors.black),
                        dataTextStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .apply(color: Colors.black),
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
                              ImageIcon(AssetImage(
                                  'assets/icon-hard-drive-solid.png')),
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
                  const SizedBox(height: 20),
                  ButtonBar(
                    children: <OutlinedButton>[
                      OutlinedButton(
                        child: Text(lang.backButtonText),
                        onPressed: Navigator.of(context).pop,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF0E8420),
                            primary: Colors.white),
                        child: Text(lang.startInstallingButtonText),
                        onPressed: () {
                          final client = Provider.of<SubiquityClient>(context,
                              listen: false);
                          final choice = GuidedChoice(
                              diskId: _response!.disks![0].id, useLvm: false);
                          client.setGuidedStorage(choice).then(
                              (r) => print('Storage response: ${r.toJson()}'));
                          Navigator.pushNamed(
                              context, Routes.updatesOtherSoftware);
                        },
                      ),
                    ],
                  ),
                ]))));
  }
}
