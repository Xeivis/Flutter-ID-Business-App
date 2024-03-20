import 'package:flutter/material.dart';

class InfoLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoLine({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
