import 'presentaion/screen/widget/bouttom_navigation.dart';

import 'package:flutter/material.dart';
import 'presentaion/screen/logIn.dart';
import 'presentaion/screen/welcomeScreen.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Welcomescreen(),
        );

      case '/auth/login/':
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );

      default:
        return null;
    }
  }
}
