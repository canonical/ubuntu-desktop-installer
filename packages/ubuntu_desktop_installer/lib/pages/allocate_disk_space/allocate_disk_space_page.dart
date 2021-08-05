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
            Expanded(child: _PartitionTable()),
            const SizedBox(height: kContentSpacing / 2),
            _PartitionButtonRow(),
            const SizedBox(height: kContentSpacing),
            _BootDiskSelector(),
          ],
        ),
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
      ),
    );
  }
}
