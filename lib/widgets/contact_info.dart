import 'package:flutter/material.dart';
import 'package:id_card/classes/contact.dart';
import 'package:id_card/widgets/info_line.dart';

class ContactInfo extends StatelessWidget {
  final Contact contact;
  const ContactInfo({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoLine(
              icon: Icons.call,
              text: contact.phone,
            ),
            InfoLine(
              icon: Icons.mail,
              text: contact.email,
            ),
            InfoLine(
              icon: Icons.share,
              text: contact.nametag,
            ),
          ],
        );
      },
    );
  }
}
