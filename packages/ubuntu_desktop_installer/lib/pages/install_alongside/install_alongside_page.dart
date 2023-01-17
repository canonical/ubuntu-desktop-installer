import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../pages.dart';
import '../../services.dart';
import 'install_alongside_model.dart';
import 'storage_split_view.dart';

part 'install_alongside_widgets.dart';

/// Install alongside other OSes.
class InstallAlongsidePage extends StatefulWidget {
  /// Use [InstallAlongsidePage.create] instead.
  @visibleForTesting
  const InstallAlongsidePage({super.key});

  /// Creates a [InstallAlongsidePage] with [InstallAlongsideModel].
  static Widget create(BuildContext context) {
    final service = getService<DiskStorageService>();
    return ChangeNotifierProvider(
      create: (context) => InstallAlongsideModel(service),
      child: const InstallAlongsidePage(),
    );
  }

  @override
  State<InstallAlongsidePage> createState() => _InstallAlongsidePageState();
}

class _InstallAlongsidePageState extends State<InstallAlongsidePage> {
  @override
  void initState() {
    super.initState();

    final model = Provider.of<InstallAlongsideModel>(context, listen: false);
    model.init();
  }

  static String _formatTitle(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = context.read<InstallAlongsideModel>();

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
    final model = Provider.of<InstallAlongsideModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_formatTitle(context)),
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
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          label: lang.selectGuidedStorageInstallNow,
          onNext: model.selectedStorage != null ? model.save : null,
          onBack: model.reset,
        ),
      ],
    );
  }
}
