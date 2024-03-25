import 'package:flutter/material.dart';

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
