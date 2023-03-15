import 'package:flutter/material.dart';

class MascotAvatar extends StatelessWidget {
  const MascotAvatar({super.key});

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
      child: const CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage('assets/mascot.png'),
      ),
    );
  }
}
