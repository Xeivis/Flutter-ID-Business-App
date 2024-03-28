import 'package:flutter/material.dart';
import '../routes/route_from_left.dart';

class ConfigButton extends StatelessWidget {
  const ConfigButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      elevation: 1,
      onPressed: () => Navigator.of(context).push(
        createRoute(
            // handleColorChange: handleColorChange,
            ),
      ),
      child: const Icon(
        Icons.settings,
      ),
    );
  }
}
