import 'dart:convert';

import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../widgets.dart';
import 'wizard_page.dart';

class WriteChangesToDiskPage extends StatefulWidget {
  const WriteChangesToDiskPage({
    Key? key,
  }) : super(key: key);

  @override
  _WriteChangesToDiskPageState createState() => _WriteChangesToDiskPageState();
}

class _WriteChangesToDiskPageState extends State<WriteChangesToDiskPage> {
  GuidedStorageResponse? _response;
  final List<String> _partitionTableChanges = [];
  final List<String> _partitionChanges = [];

  @override
  void initState() {
    super.initState();
    final client = Provider.of<SubiquityClient>(context, listen: false);
    client.getGuidedStorage(0, true).then((r) {
      setState(() {
        _response = r;
        _partitionTableChanges.clear();
        // FIXME: assumes only one disk
        final disk = r.disks![0];
        final diskid = disk.id!.split('-').last;
        _partitionTableChanges.add('${disk.label} ($diskid)');
        _partitionChanges.clear();
        for (var partition in disk.partitions!) {
          // FIXME: needs localizing
          _partitionChanges.add(
              'partition #$diskid${partition.number} (${partition.annotations!.join(', ')})');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
        builder: (context, lang) => WizardPage(
              title: Text(lang.writeChangesToDisk),
              content: Column(children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(lang.writeChangesDescription)),
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(lang.writeChangesPartitionTablesHeader)),
                const SizedBox(height: 5),
                ...List.generate(
                    _partitionTableChanges.length,
                    (index) => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_partitionTableChanges[index],
                            style: TextStyle(fontWeight: FontWeight.bold)))),
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(lang.writeChangesPartitionsHeader)),
                const SizedBox(height: 5),
                ...List.generate(
                    _partitionChanges.length,
                    (index) => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_partitionChanges[index],
                            style: TextStyle(fontWeight: FontWeight.bold)))),
              ]),
              actions: <WizardAction>[
                WizardAction(
                  label: lang.backButtonText,
                  onActivated: Navigator.of(context).pop,
                ),
                WizardAction(
                  label: lang.continueButtonText,
                  onActivated: () async {
                    final client =
                        Provider.of<SubiquityClient>(context, listen: false);

                    // Use the default values for a number of endpoints
                    // for which a UI page isn't implemented yet.
                    await client.markConfigured(
                        ['mirror', 'proxy', 'network', 'ssh', 'snaplist']);

                    // Define a default identity until a UI page is implemented
                    // for it.
                    final identity = IdentityData(
                        realname: 'Ubuntu',
                        username: 'ubuntu',
                        cryptedPassword: Crypt.sha512('ubuntu').toString(),
                        hostname: 'ubuntu-desktop');
                    await client.setIdentity(identity);

                    final choice = GuidedChoice(
                        diskId: _response!.disks![0].id, useLvm: false);
                    final storageResponse =
                        await client.setGuidedStorage(choice);
                    print(
                        'Storage config: ${JsonEncoder.withIndent('  ').convert(storageResponse.config)}');
                    await client.setStorage(storageResponse.config!);

                    await client.confirm('/dev/tty1');
                  },
                ),
              ],
            ));
  }
}
