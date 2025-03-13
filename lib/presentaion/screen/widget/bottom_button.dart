import 'package:flutter/material.dart';

import '../cv_screen.dart';
class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
         gradient:LinearGradient(colors: [
    Color.fromARGB(255, 109, 67, 248),
    Color.fromARGB(255, 185, 31, 185),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight)
      ),
      child: Center(
        child: TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CvScreen(),
              ),
            );
          },
          icon: const Icon(Icons.remove_red_eye, color: Colors.white),
          label: const Text(
            "View CV",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
