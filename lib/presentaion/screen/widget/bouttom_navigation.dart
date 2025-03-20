import 'package:flutter/material.dart';
import '../Home.dart';
import 'package:devloper_app/presentaion/screen/ResumeEvaluator.dart';
import '../convertCV.dart';
import '../profile_screen.dart';
import '../quiz_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int myCurrentIndex = 0;
  final List<Widget> pages = const [
    HomePage(),
    ProfileScreen(),
    ResumeEvaluatorApp(),
    ConvertCvScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: pages[myCurrentIndex],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 30,
                offset: Offset(0, 20))
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              currentIndex: myCurrentIndex,
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xFF6B1A6B),
              unselectedItemColor: Colors.black,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.create, size: 25),
                  label: "Create Resume",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fact_check),
                  label: "Evaluate Resume",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.autorenew), // Convert CV
                  label: "Convert Resume",
                ),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.question_answer_outlined), label: "Quiz")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
