import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/theme/theme.dart';

import '../widgets/go_back_button.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: SafeArea(
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
                  CustomListTile(
                    icon: Icons.person,
                    name: "Name",
                    functionIcon: Icons.edit,
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
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const GoBackButton(),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.settings,
  });

  final String title;
  final List<CustomListTile> settings;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: settings,
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.name,
    required this.functionIcon,
    required this.function,
  });

  final IconData icon;
  final String name;
  final IconData functionIcon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: Icon(icon),
      trailing: Icon(functionIcon),
      onTap: function(),
    );
  }
}
