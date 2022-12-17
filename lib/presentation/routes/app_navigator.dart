import 'package:flutter/material.dart';

enum NavigationType {
  pushNamedAndRemoveUntil,
  pushNamed,
  pushReplacementNamed,
}

class AppNavigation {
  static navigateToNamed(
      BuildContext context, String routeName, NavigationType navigationType,
      {Object? arguments}) {
    if (navigationType == NavigationType.pushNamedAndRemoveUntil) {
      Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false,
          arguments: arguments);
      if (navigationType == NavigationType.pushReplacementNamed) {
        Navigator.of(context)
            .pushReplacementNamed(routeName, arguments: arguments);
      }
    } else {
      Navigator.of(context).pushNamed(routeName, arguments: arguments);
    }
  }
}
