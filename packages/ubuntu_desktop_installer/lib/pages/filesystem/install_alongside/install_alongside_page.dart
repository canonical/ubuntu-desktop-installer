import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'install_alongside_model.dart';
import 'storage_split_view.dart';

part 'install_alongside_widgets.dart';

/// Install alongside other OSes.
class InstallAlongsidePage extends ConsumerStatefulWidget {
  const InstallAlongsidePage({super.key});

  @override
  ConsumerState<InstallAlongsidePage> createState() =>
      _InstallAlongsidePageState();
}

class _InstallAlongsidePageState extends ConsumerState<InstallAlongsidePage> {
  @override
  void initState() {
    super.initState();

    final model = ref.read(installAlongsideModelProvider);
    model.init();
  }

  static String _formatTitle(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final model = ref.read(installAlongsideModelProvider);

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
  Widget build(BuildContext context) {
    final model = ref.watch(installAlongsideModelProvider);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(_formatTitle(context, ref)),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _StorageSelector(
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
          _HiddenPartitionLabel(
            partitions: model.getAllPartitions(model.selectedIndex ?? -1) ?? [],
            onTap: () =>
                Wizard.of(context).replace(arguments: InstallationType.manual),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            root: model.isDone,
            onNext: model.selectedStorage != null ? model.save : null,
            onBack: model.reset,
          ),
        ],
      ),
    );
  }
}
