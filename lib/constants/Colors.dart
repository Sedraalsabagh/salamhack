import 'package:flutter/material.dart';

class MyColors {
  static const Color mybackground = Color.fromARGB(255, 33, 21, 51);
  static const Color myText = Color(0xFF6B1A6B);
  static final LinearGradient myGreadient1 = LinearGradient(colors: [
    Color(0xFF4A15F4),
    Color(0xFF6B1A6B),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient myGreadient2 = LinearGradient(colors: [
    Color(0xFF4A15F4),
    Color(0xFF6B1A6B),
  ]);
}

// // ignore: file_names
// // import 'package:devloper_app/presentaion/screen/SignUP.dart';
// import 'package:devloper_app/presentaion/screen/logIn.dart';
// import 'package:flutter/material.dart';
// import '../../Animation/Fadeanimation.dart';
// import 'package:devloper_app/constants/Colors.dart';

// class Welcomescreen extends StatefulWidget {
//   const Welcomescreen({super.key});

//   @override
//   State<Welcomescreen> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<Welcomescreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _onButtonPressed() async {
//     await _animationController.forward();
//     await _animationController.reverse();
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LogIn(
//           onLoginTap: () {},
//           onSignUpTap: () {},
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             for (int i = 0; i < 3; i++)
//               Positioned(
//                 top: -150 + (i * 100),
//                 child: FadeAnimation(
//                   1.6 + (i * 0.4),
//                   Container(
//                     width: width,
//                     height: 400,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/one.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   FadeAnimation(
//                     1,
//                     Text(
//                       "Welcome",
//                       style: TextStyle(
//                         color: MyColors.mybackground,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   FadeAnimation(
//                     1,
//                     Text(
//                       "Everything you need as a developer, from resources to opportunities, all in one place.",
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.7),
//                         fontSize: 18,
//                         height: 1.4,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 250),
//                   FadeAnimation(
//                     1.6,
//                     Center(
//                       child: GestureDetector(
//                         onTap: _onButtonPressed,
//                         child: AnimatedBuilder(
//                           animation: _scaleAnimation,
//                           builder: (context, child) {
//                             return Transform.scale(
//                               scale: _scaleAnimation.value,
//                               child: Container(
//                                 padding: const EdgeInsets.all(10),
//                                 width: 80,
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       MyColors.myGreadient1 ,
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: MyColors.myGreadient1 ,
//                                   ),
//                                   child: const Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.white,
//                                     size: 30,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
