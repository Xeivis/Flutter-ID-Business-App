import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    backgroundColor: Theme.of(context).colorScheme.background,
    elevation: 1,
    onPressed: () => Navigator.pop(context),
    child: const Icon(
      Icons.arrow_back,
    ),
        );
  }
}
