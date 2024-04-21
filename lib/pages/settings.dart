import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/models/theme_options.dart';
import 'package:id_card/providers/config_provider.dart';
import 'package:id_card/theme/theme.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_color_picker.dart';
import '../widgets/settings_list_tile.dart';
import '../widgets/go_back_button.dart';
import '../widgets/settings_section.dart';
import '../widgets/theme_dropdown.dart';

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
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: currentTheme.colorScheme.primary,
      ),
    );
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
                    SettingsListTile(
                      icon: Icons.person,
                      name: "Name",
                      functionIcon: Icons.edit,
                      currentValue:
                          context.read<ConfigProvider>().currentContact.name,
                      setter: (dynamic) {
                        context.read<ConfigProvider>().setContactName(dynamic);
                      },
                    ),
                    SettingsListTile(
                      icon: Icons.label_rounded,
                      name: "Postion",
                      functionIcon: Icons.edit,
                      currentValue:
                          context.read<ConfigProvider>().currentContact.title,
                      setter: (dynamic) {
                        context.read<ConfigProvider>().setContactTitle(dynamic);
                      },
                    ),
                    SettingsListTile(
                      icon: Icons.image,
                      name: "Image",
                      functionIcon: Icons.upload,
                      setter: (dynamic value) {
                        context.read<ConfigProvider>().setContactImage(value);
                      },
                      isImage: true,
                    ),
                  ],
                ),
                const Divider(),
                SettingsSection(
                  title: "Contact",
                  settings: [
                    SettingsListTile(
                      icon: Icons.phone,
                      name: "Phone Number",
                      functionIcon: Icons.edit,
                      currentValue:
                          context.read<ConfigProvider>().currentContact.phone,
                      setter: (dynamic) {
                        context.read<ConfigProvider>().setContactPhone(dynamic);
                      },
                    ),
                    SettingsListTile(
                      icon: Icons.mail,
                      name: "Email Address",
                      functionIcon: Icons.edit,
                      currentValue:
                          context.read<ConfigProvider>().currentContact.email,
                      setter: (dynamic) {
                        context.read<ConfigProvider>().setContactEmail(dynamic);
                      },
                    ),
                    SettingsListTile(
                      icon: Icons.share,
                      name: "Social Name Tag",
                      functionIcon: Icons.edit,
                      currentValue:
                          context.read<ConfigProvider>().currentContact.nametag,
                      setter: (dynamic) {
                        context
                            .read<ConfigProvider>()
                            .setContactNametag(dynamic);
                      },
                    ),
                  ],
                ),
                const Divider(),
                SettingsSection(
                  title: "General",
                  settings: [
                    SettingsListTile(
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
                    SettingsListTile(
                      icon: Icons.dark_mode,
                      name: "Dark Theme",
                      functionIcon: Icons.arrow_drop_down_circle,
                      dropdown: const ThemeDropdown(),
                      onTap: () {},
                    ),
                    const SettingsListTile(
                      enabled: false,
                      icon: Icons.delete,
                      name: "Delete Data",
                      functionIcon: Icons.cancel,
                    ),
                  ],
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
