import 'package:devloper_app/app_router.dart';
import 'package:devloper_app/business_logic/cubit/cv_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repository/CVRepository.dart';
import 'data/repository/auth.dart';
import 'data/webService/CVWebServices.dart';
import 'data/webService/auth.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CvCubit>(
          create: (context) =>
              CvCubit(CVRepository(CVWebServices: CVWebServices())),
        ),
      ],
      child: MyWidget(appRouter: AppRouter()),
    ),
  );
}

class MyWidget extends StatefulWidget {
  final AppRouter appRouter;

  const MyWidget({Key? key, required this.appRouter}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    appRouter = widget.appRouter;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        home: Scaffold(
          body: BottomNavigation(),
        ));
  }
}
