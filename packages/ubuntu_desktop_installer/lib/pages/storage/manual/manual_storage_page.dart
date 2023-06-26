import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'manual_storage_model.dart';
import 'manual_storage_widgets.dart';
import 'storage_selector.dart';

class ManualStoragePage extends ConsumerStatefulWidget {
  const ManualStoragePage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref
        .read(manualStorageModelProvider.notifier)
        .init()
        .then((_) => true);
  }

  @override
  ConsumerState<ManualStoragePage> createState() => _ManualStoragePageState();
}

class _ManualStoragePageState extends ConsumerState<ManualStoragePage> {
  final _scrollController = AutoScrollController();
  StreamSubscription? _scrollSubscription;

  @override
  void initState() {
    super.initState();

    final model = ref.read(manualStorageModelProvider);
    _scrollSubscription = model.onSelectionChanged.listen((_) {
      _scrollToSelection();
    });
    _scrollToSelection();
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
      final model = ref.read(manualStorageModelProvider);
      if (model.selectedDiskIndex != -1) {
        _scrollController.scrollToIndex(
          Object.hashAll([model.selectedDiskIndex, model.selectedObjectIndex]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(manualStorageModelProvider);
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
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: model.isValid,
            onNext: model.setStorage,
          ),
        ],
      ),
    );
  }
}
