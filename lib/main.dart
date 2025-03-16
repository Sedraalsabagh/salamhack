import 'package:devloper_app/app_router.dart';
import 'package:devloper_app/presentaion/screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/cv_cubit.dart';
import 'data/repository/CVRepository.dart';
import 'data/webService/CVWebServices.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

void main() {
  final appRouter = AppRouter();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CvCubit>(
          create: (context) => CvCubit(
            CVRepository(cvWebServices: CVWebServices()),
          ),
        ),
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
      home: BottomNavigation(),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
