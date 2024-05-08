import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:id_card/models/contact.dart';
import 'package:id_card/providers/config_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.name,
    this.functionIcon,
    this.dropdown,
    this.enabled,
    this.onTap,
    this.currentValue,
    this.setter,
    this.isImage,
  });

  final IconData icon;
  final String name;
  final IconData? functionIcon;
  final Widget? dropdown;
  final bool? enabled;
  final Function()? onTap;
  final Function(dynamic value)? setter;
  final String? currentValue;
  final bool? isImage;

  @override
  Widget build(BuildContext context) {
    Contact currentContact = context.read<ConfigProvider>().currentContact;
    Widget trailing = Icon(functionIcon);
    return ListTile(
      enabled: enabled ?? true,
      title: Text(name),
      leading: Icon(icon),
      trailing: dropdown ?? trailing,
      onTap: onTap ??
          () async {
            if (isImage != true) {
              settingsInputDialog(context, currentContact);
            } else {
              if (setter != null) {
                dynamic selectedImage = await pickImageFromGallery();
                if (kIsWeb) {
                  selectedImage != null
                      ? setter!(base64Encode(selectedImage))
                      : {};
                } else {
                  selectedImage != null ? setter!(selectedImage.path) : {};
                }
              }
            }
          },
    );
  }

  Future<dynamic> settingsInputDialog(
      BuildContext context, Contact currentContact) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$name:"),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text("Current:"),
                  const SizedBox.square(dimension: 10.0),
                  Text(currentValue ?? "Null"),
                ],
              ),
              const SizedBox.square(
                dimension: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'New $name',
                      ),
                      onSubmitted: (value) {
                        if (setter != null) {
                          setter!(value);
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (kIsWeb) {
      return pickedFile != null ? await pickedFile.readAsBytes() : null;
    } else {
      return pickedFile != null ? File(pickedFile.path) : null;
    }
  }
}
