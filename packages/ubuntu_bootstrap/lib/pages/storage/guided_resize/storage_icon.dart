import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageIcon extends StatelessWidget {
  const StorageIcon({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    final lower = name?.toLowerCase();
    final asset = lower == null
        ? 'folder'
        : lower.contains('buntu')
            ? 'ubuntu'
            : lower.contains('windows')
                ? 'windows'
                : 'block-device';
    return SizedBox.square(
      dimension: 48,
      child: SvgPicture.asset(
        'assets/install_alongside/$asset.svg',
      ),
    );
  }
}
