import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'allocate_disk_space_model.dart';
import 'allocate_disk_space_widgets.dart';

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
  final _scrollController = AutoScrollController();
  StreamSubscription? _scrollSubscription;

  @override
  void initState() {
    super.initState();

    final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
    _scrollSubscription = model.onSelectionChanged.listen((_) {
      _scrollToSelection();
    });
    model.getStorage().then((_) => _scrollToSelection());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollSubscription?.cancel();
    super.dispose();
  }

  void _scrollToSelection() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!mounted) return;
      final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
      if (model.selectedDiskIndex != -1) {
        _scrollController.scrollToIndex(
          hashList([model.selectedDiskIndex, model.selectedPartitionIndex]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    final lang = AppLocalizations.of(context);

    return WizardPage(
      title: Text(lang.allocateDiskSpace),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PartitionBar(),
          const SizedBox(height: kContentSpacing / 2),
          PartitionLegend(),
          const SizedBox(height: kContentSpacing / 2),
          Expanded(child: PartitionTable(controller: _scrollController)),
          const SizedBox(height: kContentSpacing / 2),
          PartitionButtonRow(),
          const SizedBox(height: kContentSpacing),
          BootDiskSelector(),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled: model.isValid,
          onActivated: () async {
            await model.setStorage();
            Wizard.of(context).next();
          },
        ),
      ],
    );
  }
}
