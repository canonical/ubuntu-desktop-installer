import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class StorageSelector extends StatelessWidget {
  const StorageSelector({
    super.key,
    this.title,
    this.selected,
    required this.storages,
    required this.onSelected,
  });

  final String? title;
  final int? selected;
  final List<Disk> storages;
  final ValueChanged<int?> onSelected;

  @override
  Widget build(BuildContext context) {
    String prettyFormatStorage(Disk storage) {
      final fullName = <String?>[
        storage.model,
        storage.vendor,
      ].where((p) => p?.isNotEmpty == true).join(' ');
      return '${storage.path} $fullName (${filesize(storage.size)})';
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (title != null) Text(title!),
        if (title != null) const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            return YaruPopupMenuButton<int>(
              initialValue: selected,
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              itemBuilder: (context) {
                return [
                  for (var i = 0; i < storages.length; ++i)
                    PopupMenuItem<int>(
                      value: i,
                      height: kPopupMenuItemHeight,
                      child: Text(
                        prettyFormatStorage(storages[i]),
                        key: ValueKey(i),
                      ),
                    ),
                ];
              },
              onSelected: onSelected,
              child: selected != null
                  ? Text(prettyFormatStorage(storages[selected!]))
                  : const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
