import 'package:devloper_app/presentaion/screen/Home.dart';
import "package:flutter/material.dart";
import 'package:devloper_app/presentaion/screen/widget/bouttom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: HomePage()),
            Align(alignment: Alignment.bottomCenter, child: BottomNavigation()),
          ],
        ),
      ),
    );
  }
}
