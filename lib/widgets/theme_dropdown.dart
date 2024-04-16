import 'package:flutter/material.dart';
import 'package:id_card/model/theme_options.dart';
import 'package:id_card/provider/config_provider.dart';
import 'package:provider/provider.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({
    super.key,
  });

  @override
  State<ThemeDropdown> createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<ThemeOption>(
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
              children: [
                const SizedBox.square(dimension: 16),
                Icon(
                  option.icon,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox.square(dimension: 16),
                Text(option.label),
                const SizedBox.square(dimension: 16),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
