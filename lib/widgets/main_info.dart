import 'package:flutter/material.dart';
import 'package:id_card/classes/contact.dart';

class MainInfo extends StatelessWidget {
  final Contact contact;
  const MainInfo({
    super.key,
    required this.contact,
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: relevantSize / 4,
          ),
          Text(
            contact.name,
            style: TextStyle(
                fontSize: 72 * (relevantSize / 800),
                color: Theme.of(context).colorScheme.secondary),
          ),
          Text(
            contact.title,
            style: TextStyle(
              fontSize: 32 * (relevantSize / 800),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
