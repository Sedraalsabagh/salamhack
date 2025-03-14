import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'education_screen.dart';
import 'personal_details.dart';
import 'widget/Listitem.dart';
import 'widget/bottom_button.dart';
import 'widget/section_title.dart';
import 'skills_screen.dart'; // استيراد شاشة المهارات

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
            Color.fromARGB(255, 141, 20, 141),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: const [
                SectionTitle(title: 'Sections'),
                ListItem(icon: Icons.person_pin, title: 'Personal Details'),
                ListItem(icon: Icons.summarize_rounded, title: 'Summary'),
                ListItem(icon: Icons.school, title: 'Education'),

                ListItem(icon: Icons.play_lesson, title: 'Courses'),
                ListItem(icon: CupertinoIcons.text_badge_star, title: 'Skills'),

                SizedBox(
                  height: 10,
                ),
                SectionTitle(title: 'More Sections'),

                ListItem(icon: Icons.workspace_premium, title: 'Experience'),
                ListItem(icon: Icons.rocket_launch, title: 'Projects'),
                ListItem(icon: Icons.article_rounded, title: 'Reference'),
                ListItem(icon: CupertinoIcons.signature, title: 'Signature'),
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
