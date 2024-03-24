import 'package:flutter/material.dart';
import '../routes/route_from_left.dart';

class ConfigButton extends StatelessWidget {
  const ConfigButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      onPressed: () => Navigator.of(context).push(createRoute()),
      child: const Icon(
        Icons.settings,
      ),
    );
  }
}
