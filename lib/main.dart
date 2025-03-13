import 'package:devloper_app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/auth_cubit.dart';
import 'data/repository/auth.dart';
import 'data/webService/auth.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(AuthRepository(authWebServices: AuthWebServices())),
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
          // appBar: AppBar(),
          body: BottomNavigation(),
        ));
  }
}
