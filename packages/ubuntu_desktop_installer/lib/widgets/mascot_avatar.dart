import 'package:flutter/material.dart';

class MascotAvatar extends StatelessWidget {
  const MascotAvatar({super.key, this.radius = 80});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 8,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('assets/mascot.png'),
      ),
    );
  }
}
