import 'package:devloper_app/presentaion/screen/widget/welcomeScreen.dart';
import "package:flutter/material.dart";
import 'presentaion/screen/cv_screen.dart';
import 'presentaion/screen/logIn.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

class AppRouter {
  // late AuthRepository authRepository;
  // late AuthCubit authCubit;
  AppRouter() {
    // authRepository = AuthRepository(authWebServices: AuthWebServices());
    // authCubit = AuthCubit(authRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
      // case '/home':
      //   return MaterialPageRoute(
      //     builder: (context) => const BottomNavigation(),
      //   );

      default:
        return null;
    } //
  }
}
