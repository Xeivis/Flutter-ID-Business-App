import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:id_card/providers/config_provider.dart';
import 'package:provider/provider.dart';

class CustomColorPicker extends StatelessWidget {
  const CustomColorPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ((19 * 80) / 3) + 16,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Card(
                    elevation: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ColorPicker(
                          spacing: 6,
                          width: 80,
                          height: 80,
                          enableShadesSelection: false,
                          pickersEnabled: const {
                            ColorPickerType.accent: false,
                          },
                          onColorChanged: (Color color) {
                            context.read<ConfigProvider>().setColorTheme(color);
                          },
                          color: context.read<ConfigProvider>().themeColor,
                          heading: Text(
                            'Select color',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: IconButton.filled(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.check),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
