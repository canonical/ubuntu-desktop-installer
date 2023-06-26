import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'guided_resize_model.dart';
import 'guided_resize_widgets.dart';
import 'storage_split_view.dart';

/// Install alongside other OSes.
class GuidedResizePage extends ConsumerWidget {
  const GuidedResizePage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(guidedResizeModelProvider).init();
  }

  static String _formatTitle(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final model = ref.read(guidedResizeModelProvider);

    switch (model.existingOS.length) {
      case 0:
        return lang.installationTypeAlongsideUnknown(model.productInfo);
      case 1:
        return lang.installationTypeAlongside(
          model.productInfo,
          model.existingOS.single.long,
        );
      case 2:
        return lang.installationTypeAlongsideDual(
          model.productInfo,
          model.existingOS.first.long,
          model.existingOS.last.long,
        );
      default:
        return lang.installationTypeAlongsideMulti(model.productInfo);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(guidedResizeModelProvider);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(_formatTitle(context, ref)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StorageSelector(
            count: model.storageCount,
            selectedIndex: model.selectedIndex,
            onSelected: model.selectStorage,
          ),
          const SizedBox(height: kContentSpacing),
          Text(lang.installAlongsideSpaceDivider),
          const SizedBox(height: kContentSpacing / 2),
          if (model.selectedPartition != null)
            SizedBox(
              height: 200,
              child: StorageSplitView(
                currentSize: model.currentSize,
                minimumSize: model.minimumSize,
                maximumSize: model.maximumSize,
                totalSize: model.totalSize,
                partition: model.selectedPartition!,
                existingOS: model.selectedOS,
                productInfo: model.productInfo,
                onResize: model.resizeStorage,
              ),
            ),
          const SizedBox(height: kContentSpacing / 2),
          HiddenPartitionLabel(
            partitions: model.getAllPartitions(model.selectedIndex ?? -1) ?? [],
            onTap: () =>
                Wizard.of(context).replace(arguments: StorageType.manual),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            onNext: model.selectedStorage != null ? model.save : null,
            onBack: model.reset,
          ),
        ],
      ),
    );
  }
}
