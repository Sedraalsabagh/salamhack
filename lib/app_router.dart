import 'package:devloper_app/presentaion/screen/Home.dart';
import "package:flutter/material.dart";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      // case signupscreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SignUp(), // 🚀
      //   );

      default:
        return null;
    }
  }
}
