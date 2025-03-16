import 'package:devloper_app/presentaion/screen/Home.dart';
import 'package:devloper_app/presentaion/screen/profile_screen.dart';
import 'package:devloper_app/presentaion/screen/widget/welcomeScreen.dart';
import "package:flutter/material.dart";

import 'presentaion/screen/ResumeEvaluator.dart';
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
          builder: (context) => const Welcomescreen(),
          
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );

      default:
        return null;
    } //
  }
}
