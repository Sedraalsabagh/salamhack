import 'package:devloper_app/constants/Colors.dart';
import 'package:devloper_app/presentaion/screen/logIn.dart';

import 'package:flutter/material.dart';
import '../../Animation/Fadeanimation.dart';
import 'widget/custom_botton.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 244),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(
              1,
              const Text(
                "Find  Your",
                style: TextStyle(
                  color: MyColors.myText,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              2,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Dream Job ",
                      style: TextStyle(
                        color: Colors.orangeAccent.withOpacity(0.7),
                        fontSize: 30,
                        height: 1.4,
                      ),
                    ),
                    const TextSpan(
                      text: "Here",
                      style: TextStyle(
                        color: MyColors.myText,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              3,
              const Text(
                "Start your journey today!",
                style: TextStyle(
                  color: MyColors.myText,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 250),
            FadeAnimation(
              2.5,
              Center(
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  text: "Get started",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
