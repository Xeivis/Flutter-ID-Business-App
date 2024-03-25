import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/theme/theme.dart';

import '../widgets/custom_list_tile.dart';
import '../widgets/go_back_button.dart';
import '../widgets/settings_section.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme;
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: currentTheme.colorScheme.primary,
      ),
    );
    // Color screenPickerColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                SettingsSection(
                  title: "Perfil",
                  settings: [
                    CustomListTile(
                      icon: Icons.person,
                      name: "Name",
                      functionIcon: Icons.edit,
                      function: () {},
                    ),
                    CustomListTile(
                      icon: Icons.label_rounded,
                      name: "Postion",
                      functionIcon: Icons.edit,
                      function: () {},
                    ),
                    CustomListTile(
                      icon: Icons.image,
                      name: "Image",
                      functionIcon: Icons.upload,
                      function: () {},
                    ),
                  ],
                ),
                const Divider(),
                SettingsSection(
                  title: "Contact",
                  settings: [
                    CustomListTile(
                      icon: Icons.phone,
                      name: "Phone Number",
                      functionIcon: Icons.edit,
                      function: () {},
                    ),
                    CustomListTile(
                      icon: Icons.mail,
                      name: "Email Address",
                      functionIcon: Icons.edit,
                      function: () {},
                    ),
                    CustomListTile(
                      icon: Icons.share,
                      name: "Social Name Tag",
                      functionIcon: Icons.edit,
                      function: () {},
                    ),
                  ],
                ),
                const Divider(),
                SettingsSection(
                  title: "General",
                  settings: [
                    CustomListTile(
                      icon: Icons.palette,
                      name: "Color Palette",
                      functionIcon: Icons.colorize,
                      function: () {},
                    ),
                    CustomListTile(
                      icon: Icons.dark_mode,
                      name: "Dark Theme",
                      functionIcon: Icons.arrow_drop_down_circle,
                      function: () {},
                    ),
                    CustomListTile(
                      icon: Icons.delete,
                      name: "Delete Data",
                      functionIcon: Icons.cancel,
                      function: () {},
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Card(
                      elevation: 1,
                      // child: ColorPicker(
                      //   enableShadesSelection: false,
                      //   pickersEnabled: const {
                      //     ColorPickerType.accent: false,
                      //   },
                      //   // // Use the screenPickerColor as start color.
                      //   // color: Colors.red,
                      //   // Update the screenPickerColor using the callback.
                      //   onColorChanged: (Color color) =>
                      //       setState(() => screenPickerColor = color),
                      //   heading: Text(
                      //     'Select color',
                      //     style: Theme.of(context).textTheme.headlineSmall,
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const GoBackButton(),
    );
  }
}
