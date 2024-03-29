import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/model/theme_options.dart';
import 'package:id_card/provider/config_provider.dart';
import 'package:id_card/theme/theme.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_color_picker.dart';
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
    switch (context.read<ConfigProvider>().darkThemeOption) {
       case ThemeOption.dark:
        currentTheme = darkTheme;
        break;
      case ThemeOption.light:
        currentTheme = lightTheme;
        break;
      default:
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
    }

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
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: Icons.label_rounded,
                      name: "Postion",
                      functionIcon: Icons.edit,
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: Icons.image,
                      name: "Image",
                      functionIcon: Icons.upload,
                      onTap: () {},
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
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: Icons.mail,
                      name: "Email Address",
                      functionIcon: Icons.edit,
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: Icons.share,
                      name: "Social Name Tag",
                      functionIcon: Icons.edit,
                      onTap: () {},
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
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomColorPicker();
                          },
                        );
                      },
                    ),
                    CustomListTile(
                      icon: Icons.dark_mode,
                      name: "Dark Theme",
                      functionIcon: Icons.arrow_drop_down_circle,
                      onTap: () {},
                    ),
                    CustomListTile(
                      icon: Icons.delete,
                      name: "Delete Data",
                      functionIcon: Icons.cancel,
                      onTap: () {},
                    ),
                  ],
                ),
                DropdownButton<ThemeOption>(
                  icon: const Icon(Icons.menu),
                  underline: Container(),
                  value: context.read<ConfigProvider>().darkThemeOption,
                  onChanged: (ThemeOption? option) {
                    setState(() {
                       context.read<ConfigProvider>().setThemeOption(option!);
                    });
                  },
                  items: ThemeOption.values.map<DropdownMenuItem<ThemeOption>>(
                    (ThemeOption option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox.square(dimension: 16),
                            Icon(option.icon, color: Theme.of(context).colorScheme.onSurfaceVariant,),
                            const SizedBox.square(dimension: 16),
                            Text(option.label),
                            const SizedBox.square(dimension: 16),
                          ],
                        ),
                      );
                    },
                  ).toList(),
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
