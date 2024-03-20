import 'package:flutter/material.dart';

class ConfigButton extends StatelessWidget {
  const ConfigButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      onPressed: () {},
      child: const Icon(
        Icons.settings,
      ),
    );
  }
}
