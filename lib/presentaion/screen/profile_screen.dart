import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widget/Listitem.dart';
import 'widget/bottom_button.dart';
import 'widget/section_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 91, 45, 240),
            // Color.fromARGB(255, 165, 19, 165),
            Color.fromARGB(255, 141, 20, 141),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: const [
                SectionTitle(title: 'Sections'),

                ListItem(icon: Icons.person_pin, title: 'Personal Details'),
                ListItem(icon: Icons.summarize_rounded, title: 'Summary'),
                ListItem(icon: Icons.school, title: 'Education'),
                ListItem(icon: CupertinoIcons.text_badge_star, title: 'Skills'),

                SizedBox(
                  height: 10,
                ),
                SectionTitle(title: 'More Sections'),

                ListItem(icon: Icons.workspace_premium, title: 'Experience'),
                ListItem(icon: Icons.rocket_launch, title: 'Projects'),
                ListItem(icon: Icons.play_lesson, title: 'trainings_courses'),

                // ListItem(icon: Icons.add, title: 'Add More Section'),
              ],
            ),
          ),
          BottomButton(),
        ],
      ),
    );
  }
}
