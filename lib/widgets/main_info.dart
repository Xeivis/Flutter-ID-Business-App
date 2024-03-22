import 'package:flutter/material.dart';
import 'package:id_card/model/contact.dart';

class MainInfo extends StatelessWidget {
  final Contact contact;
  const MainInfo({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 130,
          ),
          Text(
            contact.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 72, color: Theme.of(context).colorScheme.secondary),
          ),
          Text(
            contact.title,
            style: TextStyle(
              fontSize: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
