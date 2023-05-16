part of 'install_alongside_page.dart';

class _StorageSelector extends ConsumerWidget {
  const _StorageSelector({
    required this.count,
    this.selectedIndex,
    this.onSelected,
  });

  final int count;
  final int? selectedIndex;
  final ValueChanged<int?>? onSelected;

  static String formatStorage(BuildContext context, WidgetRef ref, int index) {
    final model = ref.read(installAlongsideModelProvider);
    final partition = model.getPartition(index);
    final os = model.getOS(index);

    // "sda1 - Ubuntu 22.04 LTS - 123 GB"
    final parts = [
      partition?.sysname,
      if (os != null) os.long,
      if (partition?.size != null) filesize(partition!.size),
    ];
    return parts.join(' - ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    return Row(
      children: <Widget>[
        Text(lang.selectGuidedStorageDropdownLabel),
        const SizedBox(width: kContentSpacing),
        Expanded(
          child: MenuButtonBuilder<int>(
            values: List.generate(count, (index) => index),
            selected: selectedIndex != null &&
                    selectedIndex! >= 0 &&
                    selectedIndex! < count
                ? selectedIndex
                : null,
            onSelected: onSelected,
            itemBuilder: (context, index, child) => Text(
              formatStorage(context, ref, index),
              key: ValueKey(index),
            ),
          ),
        )
      ],
    );
  }
}

class _HiddenPartitionLabel extends StatelessWidget {
  const _HiddenPartitionLabel({required this.partitions, required this.onTap});

  final List<Partition> partitions;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hidden = partitions.length - 1;
    if (hidden <= 1) {
      return const SizedBox.shrink();
    }

    final lang = AppLocalizations.of(context);
    return Html(
      data: lang.installAlongsideHiddenPartitions(hidden, ''),
      style: {
        'body': Style(
          margin: Margins.zero,
          fontSize: FontSize(
            Theme.of(context).textTheme.bodySmall!.fontSize!,
          ),
        ),
        'a': Style(color: context.linkColor),
      },
      onLinkTap: (url, _, __) => onTap(),
    );
  }
}
