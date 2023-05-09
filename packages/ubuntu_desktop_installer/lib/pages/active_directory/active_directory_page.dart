import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'active_directory_dialogs.dart';
import 'active_directory_model.dart';
import 'active_directory_widgets.dart';

class ActiveDirectoryPage extends ConsumerStatefulWidget {
  const ActiveDirectoryPage({super.key});

  static final modelProvider = ChangeNotifierProvider(
    (_) => ActiveDirectoryModel(getService<ActiveDirectoryService>()),
  );

  @override
  ConsumerState<ActiveDirectoryPage> createState() =>
      _ActiveDirectoryPageState();
}

class _ActiveDirectoryPageState extends ConsumerState<ActiveDirectoryPage> {
  @override
  void initState() {
    super.initState();

    final model = ref.read(ActiveDirectoryPage.modelProvider);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.activeDirectoryTitle),
      ),
      contentPadding: EdgeInsets.zero,
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldWidth = (constraints.maxWidth - kContentPadding.horizontal) *
            kContentWidthFraction;
        return ListView(
          padding: kContentPadding,
          children: [
            DomainNameFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kContentSpacing),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: OutlinedButton(
                onPressed: ref
                    .read(ActiveDirectoryPage.modelProvider)
                    .pingDomainController,
                child: Text(lang.activeDirectoryTestConnection),
              ),
            ),
            const SizedBox(height: kContentSpacing),
            AdminNameFormField(fieldWidth: fieldWidth),
            const SizedBox(height: kContentSpacing),
            PasswordFormField(fieldWidth: fieldWidth),
          ],
        );
      }),
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            enabled: ref.watch(
                ActiveDirectoryPage.modelProvider.select((m) => m.isValid)),
            onNext: () async {
              final model = ref.read(ActiveDirectoryPage.modelProvider);
              await model.save();
              model.getJoinResult().then((result) {
                if (mounted &&
                    (result == AdJoinResult.JOIN_ERROR ||
                        result == AdJoinResult.PAM_ERROR)) {
                  showActiveDirectoryErrorDialog(context);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
