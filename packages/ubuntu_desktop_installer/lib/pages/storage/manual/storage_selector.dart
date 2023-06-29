import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

class StorageSelector extends StatelessWidget {
  const StorageSelector({
    super.key,
    this.title,
    this.selected,
    this.enabled,
    required this.storages,
    required this.onSelected,
  });

  final String? title;
  final int? selected;
  final List<Disk> storages;
  final ValueChanged<int?> onSelected;
  final bool Function(Disk disk)? enabled;

  @override
  Widget build(BuildContext context) {
    String prettyFormatStorage(Disk storage) {
      final fullName = <String?>[
        storage.model,
        storage.vendor,
      ].where((p) => p?.isNotEmpty == true).join(' ');
      return '${storage.sysname} $fullName (${filesize(storage.size)})';
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MenuButtonBuilder<int>(
          entries: List.generate(
            storages.length,
            (index) => MenuButtonEntry(
              value: index,
              enabled: enabled?.call(storages[index]) ?? true,
            ),
          ),
          selected: selected,
          onSelected: onSelected,
          itemBuilder: (context, index, _) {
            return Text(
              prettyFormatStorage(storages[index]),
              key: ValueKey(index),
            );
          },
          decoration: InputDecoration(labelText: title),
        )
      ],
    );
  }
}
