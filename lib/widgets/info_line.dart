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
    Size size = MediaQuery.of(context).size;
    double relevantSize;
    if (size.height > size.width) {
      relevantSize = size.width;
    } else {
      relevantSize = size.height;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
          size: 20 * (relevantSize/700),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20 * (relevantSize/700),),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20 * (relevantSize/700),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
