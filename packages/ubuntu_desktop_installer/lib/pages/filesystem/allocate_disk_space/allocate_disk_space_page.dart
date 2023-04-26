import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'allocate_disk_space_model.dart';
import 'allocate_disk_space_widgets.dart';
import 'storage_selector.dart';

class AllocateDiskSpacePage extends StatefulWidget {
  const AllocateDiskSpacePage({
    super.key,
  });

  static Widget create(BuildContext context) {
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (_) => AllocateDiskSpaceModel(service),
      child: const AllocateDiskSpacePage(),
    );
  }

  @override
  State<AllocateDiskSpacePage> createState() => _AllocateDiskSpacePageState();
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
    model.init().then((_) => _scrollToSelection());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollSubscription?.cancel();
    super.dispose();
  }

  void _scrollToSelection() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
      if (model.selectedDiskIndex != -1) {
        _scrollController.scrollToIndex(
          Object.hashAll([model.selectedDiskIndex, model.selectedObjectIndex]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AllocateDiskSpaceModel>(context);
    final lang = AppLocalizations.of(context);

    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.allocateDiskSpace),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const PartitionBar(),
          const SizedBox(height: kContentSpacing / 4),
          const PartitionLegend(),
          const SizedBox(height: kContentSpacing),
          Expanded(child: PartitionTable(controller: _scrollController)),
          const SizedBox(height: kContentSpacing / 2),
          const PartitionButtonRow(),
          const SizedBox(height: kContentSpacing / 2),
          FractionallySizedBox(
            widthFactor: 0.5,
            alignment: Alignment.topLeft,
            child: StorageSelector(
              title: lang.bootLoaderDevice,
              storages: model.disks,
              selected: model.bootDiskIndex,
              enabled: (disk) => disk.canBeBootDevice,
              onSelected: (storage) => model.selectBootDisk(storage!),
            ),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            root: true,
            enabled: model.isValid,
            onNext: model.setStorage,
          ),
        ],
      ),
    );
  }
}
