// ignore: unused_import
import 'package:devloper_app/business_logic/cubit/auth_cubit.dart';
import 'package:devloper_app/data/repository/auth.dart';
import 'package:devloper_app/data/webService/auth.dart';
import 'package:devloper_app/presentaion/screen/Home.dart';
import "package:flutter/material.dart";

class AppRouter {
  late AuthRepository authRepository;
  late AuthCubit authCubit;
  AppRouter() {
    authRepository = AuthRepository(authWebServices: AuthWebServices());
    authCubit = AuthCubit(authRepository);
  }

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
