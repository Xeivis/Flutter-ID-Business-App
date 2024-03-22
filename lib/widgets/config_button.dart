import 'package:flutter/material.dart';
import 'package:id_card/pages/settings.dart';
// import 'package:id_card/routes/RouteFromLeft.dart';

class ConfigButton extends StatelessWidget {
  const ConfigButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      onPressed: () => Navigator.of(context).push(_createRoute()),
      child: const Icon(
        Icons.settings,
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:id_card/pages/settings.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Settings(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
