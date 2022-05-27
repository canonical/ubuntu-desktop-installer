import 'package:filesize/filesize.dart';
import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

class StorageSelector extends StatelessWidget {
  const StorageSelector({
    Key? key,
    this.title,
    this.selected,
    required this.storages,
    required this.onSelected,
  }) : super(key: key);

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) Text(title!),
        if (title != null) const SizedBox(height: 8),
        DropdownBuilder<int>(
          values: List.generate(storages.length, (index) => index),
          selected: selected,
          onSelected: onSelected,
          itemBuilder: (context, index, _) {
            return Text(
              prettyFormatStorage(storages[index]),
              key: ValueKey(index),
            );
          },
        )
      ],
    );
  }
}
