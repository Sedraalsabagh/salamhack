import 'package:devloper_app/app_router.dart';
import 'package:devloper_app/business_logic/cubit/evaluations_cubit.dart';
import 'package:devloper_app/data/repository/evaluation.dart';
import 'package:devloper_app/data/webService/evaluationWebServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/auth_cubit.dart';
import 'business_logic/cubit/cv_cubit.dart';
import 'data/repository/CVRepository.dart';
import 'data/repository/auth.dart';
import 'data/webService/CVWebServices.dart';
import 'data/webService/auth.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

void main() {
  final appRouter = AppRouter();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            AuthRepository(authWebServices: AuthWebServices()),
          ),
        ),
        //  BlocProvider(
        //   create: (context) => ResumeCubit(
        //     ResumeRepository(ResumeWebServices()),
        //   ),
        // ),
      ],
      child: MyWidget(appRouter: appRouter),
    ),
  );
}

class MyWidget extends StatelessWidget {
  final AppRouter appRouter;

  const MyWidget({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
