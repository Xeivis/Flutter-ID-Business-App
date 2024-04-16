import 'dart:io';

import 'package:flutter/material.dart';
import 'package:id_card/model/contact.dart';

class MainInfo extends StatefulWidget {
  final Contact contact;
  const MainInfo({
    super.key,
    required this.contact,
  });

  @override
  State<MainInfo> createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: FileImage(File(widget.contact.image)),
              radius: 130,
            ),
            Text(
              widget.contact.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 72, color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              widget.contact.title,
              style: TextStyle(
                fontSize: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
