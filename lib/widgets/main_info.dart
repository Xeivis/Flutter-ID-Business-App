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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return CircleAvatar(
                radius: constraints.maxWidth / 4,
              );
            },
          ),
          Text(contact.name),
          Text(contact.title),
        ],
      ),
    );
  }
}
